#Mamon, Jasmin Mae G. 
#BSIT 2-A


#1. The table below shows the data about shoe size and height. Create a data frame.
shoe_size <- c(6.5,9.0,8.5,8.5,10.5,7.0,9.5,9.0,13.0,7.5,10.5,8.5,12.0,10.5,
               13.0,11.5,8.5,5.0,10.0,6.5,7.5,8.5,10.5,8.5,10.5,11.0,9.0,13.0)
height <- c(66.0,68.0,64.5,65.0,70.0,64.0,70.0,71.0,72.0,64.0,74.5,67.0,71.0,71.0,
            77.0,72.0,59.0,62.0,72.0,66.0,64.0,67.0,73.0,69.0,72.0,70.0,69.0,70.0)
gender1 <- c("F","F","F","F","M","F","F","F","M","F","M","F","M","M",
             "M","M","F","F","M","F","F","M","M","F","M","M","M","M")


one1 <- data.frame(
  shoe_size,height,gender1
)

one1

subset(data.frame, gender1 == "F", select = c(shoe_size, gender1))


#a. Describe the data.
#Answer: The data shows the shoes size, the height and the gender listed in data frame.


#b. Find the mean of shoe size and height of the respondents.
summary(one1)

shoe_size <- mean(shoe_size) #Answer: 9.410714
shoe_size

height1 <- mean(height) #Answer: 68.57143
height1

#Copy the codes and results.

#c. Is there a relationship between shoe size and height? Why?
#YES, the taller the person the larger size of the shoes they will have since their feet is expanding
#for shorter person they tend to have smaller size of feet so they have smaller size of shoes. 


#Factors
#A nominal variable is a categorical variable without an implied order. This
#means that it is impossible to say that ‘one is worth more than the other’.
#In contrast, ordinal variables do have a natural ordering.
#Example:

Gender <- c("M","F","F","M")
factor_Gender <- factor(Gender)
factor_Gender
## [1] M F F M
## Levels: F M

#2. Construct character vector months to a factor with factor() and assign the result to
#factor_months_vector. Print out factor_months_vector and assert that R prints out
#the factor levels below the actual values.
#Consider data consisting of the names of months:

factor_months1 <- c("March","April","January","November","January",
                    "September","October","September","November","August",
                    "January","November","November","February","May","August",
                    "July","December","August","August","September","November","February","April")
factor_months_vector <- factor(factor_months1)
factor_months_vector


#3. Then check the summary() of the months_vector and factor_months_vector. |
#  Interpret the results of both vectors. Are they both equally useful in this case?
summary(factor_months_vector)
summary(factor_months1)
#Answer: Yes, for factor_months_vector's summary it was easy to distinguish how many similar names are 
#there like for April it was easy to distinguish that there are 2 Aprils since it already shows the
#summary of the month. For factor_months1 is shows the total or the summary of months
#it was easy to know that there are 24 months in total, the class is character and the mode is character 
#because the summary was already given.


#4. Create a vector and factor for the table below.
#Direction Frequency
#Note: Apply the factor function with required order of the level.
factor_data <- c(1,4,3)
new_order_data <- factor(factor_data,levels = c("East","West","North"))
print(new_order_data)

#5. Enter the data below in Excel with file name = import_march.csv
#Figure 1: Excel File
#a. Import the excel file into the Environment Pane using read.table() function.
#Write the code.

getwd()
import_table <- read.table("D:/CS101 FILES/Worksheet#4/Excel/import_march.csv", header =  TRUE, sep = ",")
import_table

#b. View the dataset. Write the code and its result.

read.csv("D:/CS101 FILES/Worksheet#4/Excel/import_march.csv")


  
