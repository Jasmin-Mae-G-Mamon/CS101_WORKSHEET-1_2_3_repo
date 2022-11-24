#MAMON, JASMIN MAE G. BSIT 2-A


# Using functions:
#seq(), assign(), min(), max(), c(), sort(), sum(), filter()

# 1. Set up a vector named age, consisting of 34, 28, 22, 36, 27, 18, 52, 39, 42, 29,
# 35, 31, 27, 22, 37, 34, 19, 20, 57, 49, 50, 37, 46, 25, 17, 37, 42, 53, 41,
# 51, 35, 24, 33, 41.

#a. How many data points? 34
age <- c(34, 28, 22, 36, 27, 18, 52, 39, 42, 29,
         35, 31, 27, 22, 37, 34, 19, 20, 57, 49, 50, 37, 46, 25, 17, 37, 42, 53, 41,
         51, 35, 24, 33, 41)
age # printing the numeric value

#a. How many data points?
#displays the length of age
length(age)  


# 2. Find the reciprocal of the values for age.
reciprocal <- function(age) vec <- 1/age 
rage <- reciprocal(age)
rage

# 3. Assign also new_age <- c(age, 0, age).
#What happen to the new_age? new_age shows ages with a zero(0) in between another the same set of ages.
new_age <- c(age, 0, age)
new_age 

# 4. Sort the values for age.
#Write the R code and its output.
#sort  the value of age
sort(age)

# 5. Find the minimum and maximum value for age.
# Write the R code and its output.p
max(age) #57 is the output
min(age) #17 is the output

# 6. Set up a vector named data, consisting of 2.4, 2.8, 2.1, 2.5, 2.4, 2.2, 2.5, 2.3,
# 2.5, 2.3, 2.4, and 2.7.

dataVector <- c(2.4, 2.8, 2.1, 2.5, 2.4, 2.2, 2.5, 2.3,
                2.5, 2.3, 2.4,2.7)
dataVector

#a. How many data points? 12
length(dataVector)

# b. Write the R code and its output.


# 7.Generates a new vector for data where you double every value of the data. | What happen
#to the data?
dataVector*2  ##it displays the double value of the data


# 8. Generate a sequence for the following scenario:

#8.1 Integers from 1 to 100.
k <- seq(1:100) #creating sequence of integers with the sequence function
k
length(seq(1:100)) #8.5 A



#8.2 Numbers from 20 to 60
n <- seq(20,60)  
n
length(seq(20,60)) #8.1A


#*8.3 Mean of numbers from 20 to 60
m <- mean(20:60)
m
length(mean(20:60)) #8.5A


#8.4 Sum of numbers from 51 to 91
s <- sum(51:91)
s
length(sum(51:91)) #8.5A


#8.5 Integers from 1 to 1,000
o <- seq(1:1000)
o


#8.5 A data points (sample only)
points <- sum(100,41,1,1)
points


#b. Write the R code and its output from 8.1 to 8.4.
#refer to 8.5 A


#c. For 8.5 find only maximum data points until 10.
ten <- seq(1:10)
max(ten)


#9. *Print a vector with the integers between 1 and 100 that are not divisible by 3, 5 and 7
#using filter option.
#filter(function(i) { all(i %% c(3,5,7) != 0) }, seq(100))
#Write the R code and its output.

Filter(function(i) { all(i%% c(3,5,7) != 0) }, seq(100))  


#10. Generate a sequence backwards of the integers from 1 to 100.
#Write the R code and its output.

seq(100,1)

numbers <- sort(numbers, decreasing = TRUE)
numbers

# or 

seq(from = 100, to = 1)

#or

length(100:1)


#11. List all the natural numbers below 25 that are multiples of 3 or 5.
#Find the sum of these multiples.

(sum(unique(c(seq(5,25,5),seq(3,25,3))))) # or

#2nd option
sum((1:25)[((1:25)%%3 == 0) | ((1:25)%%5 == 0)])


#a. How many data points from 10 to 11?
numbers <- sort(numbers, decreasing = TRUE)
numbers

length(numbers) # 100 is the total data points

(sum(unique(c(seq(5,25,5),seq(3,25,3))))) #1 is the data point
length(sum)

sum(100,1) # will display the total data points from 10 to 11 which is 101

# 12 Enter this statement:
{ x <- 0+ x + 5 + }

# Describe the output. the output is error

# 13. *Set up a vector named score, consisting of 72, 86, 92, 63, 88, 89, 91, 92, 75,
# 75 and 77. To access individual elements of an atomic vector, one generally uses the x[i]
# construction.
# Find x[2] and x[3]. Write the R code and its output.

x <- c(72, 86, 92, 63, 88, 89, 91, 92, 75, 75, 77)
x

x[2] # will display 86
x[3] # will display 92


# 14*Create a vector a = c(1,2,NA,4,NA,6,7).
#a. Change the NA to 999 using the codes print(a,na.print="-999")

a <-  c(1,2,NA,4,NA,6,7)
a

print(a,na.print="-999")

# 15. A special type of function calls can appear on the left hand side of the assignment
#operator as in > class(x) <- "foo".
#Follow the codes below:

class(x) <- "foo"
name = readline(prompt="Input your name: ")
age = readline(prompt="Input your age: ")
print(paste("My name is",name, "and I am",age ,"years old."))
print(R.version.string)

#What is the output of the above code? 
# the output will be "R version 4.2.1 (2022-06-23 ucrt)"
