#Mamon, Jasmin Mae G. 
#BSIT 2-A
#Worksheet7a
  
  

library(Hmisc)
library(pastecs)


#1. Create a data frame for the table below.


Students <- c(1:10)
PreTest <- c(55,54,47,57,51,61,57,54,63,58)
PostTest <- c(61,60,56,63,56,63,59,56,62,61)

one <- data.frame(Students,PreTest,PostTest)
one


#a. Compute the descriptive statistics using different packages (Hmisc and pastecs).
#Write the codes and its result.


#Hmisc
describe(one)
#pastecs
stat.desc(one)


#2. The Department of Agriculture was studying the effects of several levels of a fertilizer on the growth of a plant. For some analyses, it might be useful to convert the fertilizer levels to an ordered factor.

#The data were 10,10,10, 20,20,50,10,20,10,50,20,50,20,10.
#a. Write the codes and describe the result.

agriculture <- c(10,10,10,20,20,50,10,20,10,50,20,50,20,10)

order_one <- sort(agriculture, decreasing = FALSE)
order_one


#3. Abdul Hassan, president of Floor Coverings Unlimited, has asked you to study the exercise levels undertaken by 10 subjects were ???l???, ???n???, ???n???, ???i???, ???l??? , ???l???, ???n???, ???n???, ???i???, ???l??? ; n=none, l=light, i=intense
#a. What is the best way to represent this in R?
  

Subjects <- c("l","n","n","i","l","l","n","n","i","l")
one <- data.frame(Subjects)
one

#4.Sample of 30 tax accountants from all the states and territories of Australia and their individual state of origin is specified by a character vector of state mnemonics as:
  
state <- c("tas", "sa", "qld", "nsw", "nsw", "nt", "wa", "wa", "qld",
           "vic", "nsw", "vic", "qld", "qld", "sa", "tas", "sa", "nt",
           "wa", "vic", "qld", "nsw", "nsw", "wa", "sa", "act", "nsw",
           "vic", "vic", "act")

state


# a. Apply the factor function and factor level. Describe the results.


fs <- factor(state)
fs
levels(state)


#5. From #4 - continuation:
#Suppose we have the incomes of the same tax accountants in another vector (in suitably large units of money)



income <- c(60, 49, 40, 61, 64, 60, 59, 54,
            62, 69, 70, 42, 56, 61, 61, 61, 58, 51, 48,
            65, 49, 49, 41, 48, 52, 46, 59, 46, 58, 43)
income


#a. Calculate the sample mean income for each state we can now use the special function tapply():
  
incmeans <- tapply(income, state, mean)
incmeans


#b. Copy the results and interpret.
#Answer: The Result shows the income of tax accountants in each state.


#6. Calculate the standard errors of the state income means (refer again to number 3)
#Note: After this assignment, the standard errors are calculated by:
 
 incster <- tapply(incomes, state,stdError)
 incster

#a. What is the standard error? Write the codes.

stdError <- function(x) sqrt(var(x)/length(x))

calc_StandardDev <- length(incmeans) 
calc1 <- sd(incmeans)
calc2 <- calc1/sqrt(calc_StandardDev)
calc2

#b. Interpret the result.
#Answer:
 # By getting the state income means, I divided the sd()-- the standard deviation to sqrt() which has the result of 
#length of incmeans --the tapply. Through this process the result of standard errors was taken.

#7. Use the titanic dataset.
#a. subset the titatic dataset of those who survived and not survived. Show the
#codes and its result.


data("Titanic")
titanic <- data.frame(Titanic)

survived <- subset(titanic, Survived == "Yes")
survived

survived2 <- subset(titanic, Survived == "No")
survived2


#8. The data sets are about the breast cancer Wisconsin. The samples arrive periodically as Dr. Wolberg reports
#his clinical cases. The database therefore reflects this chronological grouping of the data. You can create this dataset in Microsoft Excel.

#a. describe what is the dataset all about.

#  Answer:
 # The dataset are all about breast cancer Wisconsin that has been reported by Dr. Wolberge as 
#his clinical case.It reflects the chronological group of data, that shows the ID, other information regarding the breast cancer case. It is also to identify the number of malignant and benign case from the biopsy.

#b. Import the data from MS Excel. Copy the codes


library(readxl)
data <- read_excel("D:\\bbmamon\\Worksheet 7a\\Breast_Cancer.xlsx")
data


#c. Compute the descriptive statistics using different packages. Find the values of:
#c.1 Standard error of the mean for clump thickness.


Clump <- length(data$`CL. thickness`)
Clump_A <- sd(data$`CL. thickness`)
Clump_A2 <- Clump_A/sqrt(data$`CL. thickness`)
Clump_A2


#c.2 Coefficient of variability for Marginal Adhesion.

co_ef <- sd(data$`Marg. Adhesion`)/mean(data$`Marg. Adhesion`)*100
co_ef


#c.3 Number of null values of Bare Nuclei.

null_value <- sum(data$`Bare. Nuclei` == "NA")
null_value


#c.4 Mean and standard deviation for Bland Chromatin


bl <-mean(data$`Bl. Cromatin`)
bl

bl2 <- sd(data$`Bl. Cromatin`)
bl2


#c.5 Confidence interval of the mean for Uniformity of Cell Shape
#alculate the mean

calculate_mean <- mean(data$`Cell Shape`)
calculate_mean

std_A <- length(data$`Cell Shape`)
std_A
std_B <- sd(data$`Cell Shape`)
std_B
std_C <- std_B/sqrt(std_A)
std_C

A = 0.05
cs = std_A - 1
cs2 = qt(p = A/2,df = cs, lower.tail = F)
cs2


margin_error <- cs2 * std_C
margin_error

lower_bound <- calculate_mean - margin_error
lower_bound

upper_bound <- calculate_mean + margin_error
upper_bound

print(c(lower_bound, upper_bound))



#d. How many attributes?
  
breast_cancer <- attributes(data)
breast_cancer


#Answer:
#It  has 10 attributes


#e. Find the percentage of respondents who are malignant. Interpret the results.

percent <- subset(data, Class == "malignant")
percent

#Getting the percentage
18  / 49 * 100


# Interpret the results.
#For the total of 49 respondents, there are 18 patient who has malignant breast cancer and 
#31 patient who has benign case of breast cancer. Patient with benign case is greater than those patient who has malignant case. 
#In conlcusion, there are 37% of respondents who has a malignant case of breast cancer. 

#9. Export the data abalone to the Microsoft excel file. Copy the codes.

install.packages("AppliedPredictiveModeling")
library("AppliedPredictiveModeling")
data(abalone)
View(abalone)
head(abalone)
summary(abalone)
save(file = "abalone.xlsx")

library(xlsx)
install.packages("xlsx")
Write.xlsx("abalone", "D:\\bbmamon\\Worksheet 7a\\abalone.xlsx")

