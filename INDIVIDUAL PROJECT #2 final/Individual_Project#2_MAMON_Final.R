#MAMON,JASMIN MAE
#BSIT 2-A

#Individual Project 2

#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
library(twitteR) 
library(dplyr)
library(tidyr)
library(plotly)
library(ggplot2)
library(RColorBrewer)
library(tidytext)
library(rtweet)
library(tm)
library(slam)
library(wordcloud)
library(wordcloud2)
library(corpus)


#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#Set-up credentials
CONSUMER_SECRET <- "WJXiTWYd6qY3NtwOaX8alreAbbv3sUpjiIVsMRYZWAL0j5xIAK"
CONSUMER_KEY <- "YULyHZwxMbIYGCmJEMSpvvv0D"
ACCESS_SECRET <- "HWJOiuSEVkzQTIGY9HZH14UTIRyHxRBv1wcLUt9ixHT9m"
ACCESS_TOKEN <- "1595205822350401536-hk8oSRVWz5LpnnM2fw0WRqbuwxk2zP"

#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#connect to twitter app
setup_twitter_oauth(consumer_key = CONSUMER_KEY,
                    consumer_secret = CONSUMER_SECRET,
                    access_token = ACCESS_TOKEN,
                    access_secret = ACCESS_SECRET)

#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#Extract 10000 tweets from Twitter using twitteR package including tweets and retweets.
trends_on_twitter <- searchTwitter("Seventeen",
                             n = 10000,
                             lang = "en",
                             since = "2022-11-10",
                             until = "2022-12-4",
                             retryOnRateLimit = 120)

trends_on_twitter
 #-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#Convert data into dataframe
trends_on_twitterDF <- twListToDF(trends_on_twitter)
trends_on_twitterDF


#Save is as a file
save(trends_on_twitterDF,file = "trendsonTweetsDF.Rdata")

#load the file
load(file = "trendsonTweetsDF.Rdata")

#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#2.Subset the retweets and the original tweets into a separate file.
#SUBSETTING USING the dplyr() package
#w/out retweet

subTweets  <- trends_on_twitterDF %>%
  select(screenName, text, created, isRetweet) %>%
  filter(isRetweet == "FALSE")
subTweets


#saving a new file as Rdata
save(subTweets, file = "subTweetsDF.Rdata")


#Grouping the date created
subTweets %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))
subTweets  %>% pull(created) %>% min()
subTweets %>% pull(created) %>% max()

#Grouping the date created
subTweets %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))
subTweets  %>% pull(created) %>% min()
subTweets %>% pull(created) %>% max()

crtd1 <- subtweets %>%  mutate(Created_At_Round = created %>%
                                 round(units = 'hours') %>% as.POSIXct())
crtd1

# Plot on tweets by time using the library(plotly) and ggplot().
mams <- ggplot(crtd1, aes(x = Created_At_Round)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "right") +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "cyan", high = "orange")

mams %>% ggplotly()

#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#with retweet

setTweets <- trends_on_twitterDF %>%
  select(screenName, text, created, isRetweet) %>%
  fitler(isRetweet == "TRUE")
setTweets

#saving a new file as Rdata
save(setTweets, file = "setTweets.Rdata")


#Grouping the date created
setTweets %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))
setTweets  %>% pull(created) %>% min()
setTweets %>% pull(created) %>% max()

crtd <- setTweets %>%  mutate(Created_At_Round = created %>%
round(units = 'hours') %>% as.POSIXct())
crtd

# Plot on tweets by time using the library(plotly) and ggplot().
mams2 <- ggplot(crtd, aes(x = Created_At_Round)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "right") +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "rose", high = "magenta")

mams2 %>% ggplotly()


#asta lang di
#-------------------------------------------------------------------------------
#-----------------------------------------------------------------------------

#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#plotting using geom_bar() - bar graph
mams <- ggplot(subTweets[subTweets$tweetSource != 'others',], aes(tweetSource, fill = tweetSource)) +
  geom_bar() +
  theme(legend.position="none",
        axis.title.x = element_blank(),
        axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylab("Number of tweets") +
  ggtitle("Tweets by Source")


dataDF <- data.frame(
  category = tweet_appSource$tweetSource,
  count = tweet_appSource$count
)

dataDF$fraction = dataDF$count / sum(dataDF$count)
dataDF$percentage = dataDF$count / sum(dataDF$count) * 100
dataDF$ymax = cumsum(dataDF$fraction)
dataDF$ymin = c(0, head(dataDF$ymax, n=-1))
dataDF$roundP = round(dataDF$percentage, digits = 2)

#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#plotting with values
Source <- paste(dataDF$category, dataDF$roundP, "%")

ggplot(dataDF, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=Source)) +
  geom_rect() +
  coord_polar(theta="y") + 
  xlim(c(2, 4)) +
  theme_void() +
  theme(legend.position = "right")
