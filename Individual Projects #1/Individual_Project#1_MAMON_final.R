#MAMON, JASMIN MAE G. 
#BSIT 2-A
#Individual Project #1Final



library(dplyr) 
library(tidyr) 
library("plotly") 
library(ggplot2) 
library(RColorBrewer) 
library(tidytext) 
library(rtweet)  
library(tm) 
library(slam)
library(wordcloud) 
library(wordcloud2) 
library(corpus) 
library('twitteR')


#Set up Credentials
CONSUMER_KEY <-  "myVMprl6I4wxoFTjmBkHjA2Zt"
CONSUMER_SECRET <- "58I7S0DOcl7AM2WMwA3oDmwU2gDfLiOHWliXgtNk56r4XQl8so"
ACCESS_SECRET <- "YPnPy3QiHZka94vztBJ8i51FbRVmbRUVbuG9V1OGjcQ9z"
ACCESS_TOKEN <- "1595205822350401536-U2zgdjEOiVPBid26n0fLz0iMoh5U5J"


#connect to twitter app
#-----------------------------------------------------------------------------------

setup_twitter_oauth(consumer_key = CONSUMER_KEY,
                    consumer_secret = CONSUMER_SECRET,
                    access_token = ACCESS_TOKEN,
                    access_secret = ACCESS_SECRET)

#-----------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------
#Choose any keyword you want. 

trendTweets <- searchTwitter("SEVENTEEN -filter:retweets",
                             n = 10000,
                             lang = "en",
                             since = "2022-11-20",
                             until = "2022-11-27",
                             retryOnRateLimit = 120)
trendTweets

 #-----------------------------------------------------------------------------------
#Converting data into data.frame

trendTweetsDF <- twListToDF(trendTweets)
trendTweetsDF

class(trendTweetsDF)
names(trendTweetsDF)
View(trendTweetsDF)
head(trendTweetsDF)[1:5]
head(trendTweetsDF$text)[1:5]

save(trendTweetsDF,file = "trendingTweetsDF.Rdata")
load(file = "trendingTweetsDF.Rdata")

#-----------------------------------------------------------------------------------
#remove some (unicode?) values in text field

trendTweetsDF$text <- sapply(trendTweetsDF$text,function(x) iconv(x,to='UTF-8'))

load(file = "trendingTweetsDF.Rdata")

trendTweetsDF$text <- sapply(trendTweetsDF$text,function(x) iconv(enc2utf8(x), sub = "byte"))
head(trendTweetsDF$text)
#-----------------------------------------------------------------------------------
#checking for missing values in data frame

sapply(trendTweetsDF, function(x) sum(is.na(x)))


#-----------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------
#plotting time series using ts_plot() - rtweet package
ts_plot(trendTweetsDF, "hours") +
  labs(x = NULL, y = NULL,
       title = "Frequency of tweets with a #Seeventeen",
       subtitle = paste0(format(min(trendTweetsDF$created), "%d %B %Y"), " to ",
                         format(max(trendTweetsDF$created), "%d %B %Y")),
       caption = "Data collected from twitter's RESP API via Twitter") +
  theme(legend.position = "right") +
  theme_minimal()

#creating a histogram with legend
ggplot(data = trendTweetsDF, aes(x = created)) + 
  geom_histogram(aes(fill = ..count..)) +
  xlab("Time") + ylab("Number of tweets") +
  scale_fill_gradient(low = "violet", high = "midnightblue") +
  theme(legend.position = "right")


#-----------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------
#Trend analysis using the source 
encodeSource <- function(x) {
  if (grepl(">Twitter for iPhone</a>", x)){
    "iphone"
  }else if (grepl(">Twitter for iPad</a>", x)){
    "ipad"
  }else if (grepl(">Twitter for Android</a>", x)){
    "android"
  }else if (grepl(">Twitter Web Client</a>", x)){
    "Web"
  }else if (grepl(">Twitter for  Windowws Phone</a>", x)){
    "windows phone"
  }else if (grepl(">dlvr.it</a>", x)){
    "dlvr.it"
  }else if (grepl(">IFTTT</a>", x)){
    "ifttt"
  }else if (grepl(">Facebook</a>", x)){
    "facebook"
  }else{
    "others"
  }
}


trendTweetsDF$tweetSource = sapply(trendTweetsDF$statusSource, encodeSource)

tweet_appSource <- trendTweetsDF %>%
  select(tweetSource) %>%
  group_by(tweetSource) %>%
  summarize(count=n()) %>%
  arrange(desc(count))

Source_subset <- subset(tweet_appSource, count > 10)

#-----------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------
#Using geom_bar() -bar graph

ggplot(trendTweetsDF[trendTweetsDF$tweetSource != "others",], aes(tweetSource, fill = tweetSource)) +
  geom_bar() +
  theme(legend.position = "right",
        axis.title.x = element_blank(),
        axis.text.x = element_text(angle = 45,
                                   hjust = 1)) +
  ylab("Number of tweets") +
  ggtitle("Tweets by Source")

#-----------------------------------------------------------------------------------
#values

dataDF <- data.frame(
  category = tweet_appSource$tweetSource,
  count = tweet_appSource$count
)

dataDF$fraction = dataDF$count / sum(dataDF$count)
dataDF$percentage = dataDF$count / sum(dataDF$count) * 100
dataDF$ymax = cumsum(dataDF$fraction)
dataDF$ymin = c(0, head(dataDF$ymax, n=-1))
dataDF$roundP = round(dataDF$percentage, digits = 2)


Source <- paste(dataDF$category, dataDF$roundP, "%")

ggplot(dataDF, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=Source)) +
  geom_rect() +
  coord_polar(theta="y") + # Try to remove that to understand how the chart is built initially
  xlim(c(2, 4)) +
  theme_void() +
  theme(legend.position = "right")



#-------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------
#using wordcloud() package

tweet_appScreen <- trendTweetsDF %>%
  select(screenName) %>%
  group_by(screenName) %>%
  summarize(count=n()) %>%
  arrange(desc(count))

namesCorpus <- Corpus(VectorSource(trendTweetsDF$screenName)) 
namesCorpus

class(trendTweetsDF$screenName)
class(VectorSource(trendTweetsDF$screenName))
str(namesCorpus)

class(namesCorpus)
namesCorpus

pal <- brewer.pal(8, "Dark2")
pal <- pal[-(1:4)]
set.seed(123)

par(mar = c(0,0,0,0), mfrow = c(1,1))

wordcloud(words = namesCorpus, scale = c(3,0.5),
          max.words = 500,
          random.color = FALSE,
          rot.per = 0.5,
          use.r.layout = TRUE,
          colors = pal)


#-----------------------------------------------------------------------------------
#Using wordcloud2() package
library(wordcloud2)
wordcloud2(data = tweet_appScreen, 
           size=0.8, 
           color='random-light',
           shape = 'pentagon')




