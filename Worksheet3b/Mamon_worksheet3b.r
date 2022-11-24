#Mamon, Jasmin Mae G. 
#BSIT 2-A





#1. Create a data frame using the table below.
# a. Write the codes.

Respondents <- c(1:20)
Sex <- c(2,2,1,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,1,2)
Fathers_Occupation <- c(1,3,3,3,1,2,3,1,1,1,3,2,1,3,3,1,3,1,2,1)
Home <- c(5,7,3,8,5,9,6,7,8,4,7,5,4,7,8,8,3,11,7,6)
Sibling <- c(6,4,4,1,2,1,5,3,1,2,3,2,5,5,2,1,2,5,3,2)
Houses <- c(1,2,3,1,1,3,3,1,2,3,2,3,2,2,3,3,3,3,3,2)

respondents1 <- data.frame(Respondents,Sex,Fathers_Occupation,Home,Sibling,Houses
)
respondents1

#b. Describe the data. Get the structure or the summary of the data
summary(respondents1)

#c. Is the mean number of siblings attending is 5?
mean(Sibling)

#Answer
#No, the answer is 2.95.

# d. Extract the 1st two rows and then all the columns using the subsetting functions.
#Write the codes and its output.
set <- subset(respondents1[1:2,1:6, drop = FALSE])

set
  
#e. Extract 3rd and 5th row with 2nd and 4th column. Write the codes and its result.
set1 <- subset(respondents1[c(3,5),c(2,4)])
set1


#f. Select the variable types of houses then store the vector that results as types_houses.
#RWrite the codes.


types_houses <- respondents1[c(6)]
types_houses




#g. Select only all Males respondent that their father occupation was farmer. Write
#the codes and its output.

subset(respondents1,Sex == 1, select = c(Sex, Fathers_Occupation))



#h. Select only all females respondent that have greater than or equal to 5 number
#of siblings attending school. Write the codes and its output
 
Sex <-  subset(respondents1[c(1:20),c(2,5)])
sibling <- Sex[respondents1$Sibling >= 5,]
sibling

#2. Write a R program to create an empty data frame. Using the following codes:
  df = data.frame(Ints=integer(),
                  Doubles=double(), Characters=character(),
                  Logicals=logical(),
                  Factors=factor(),
                  stringsAsFactors=FALSE)
print("Structure of the empty dataframe:")
print(str(df))
#a. Describe the results.
#Answer: It prints out a empty data frame that have zero(0) objects but has 5 
# variables with it's equal 5 different classes. 


#3. Interpret the graph
#Sentiments of tweets Per Day
#The data shows the sentiments of people about the former president of the US Donald Trump
#from July 14, 2020 to July 21, 2020.
#The red bar shows the negative, the orange shows the neutral and the blue shows the positive sentiment 
#of tweets per day. They highest tweets per day is around 4000 plus 
#on July 15, 2020 followed by July 21, 2020, it show that people is active during that time. 
