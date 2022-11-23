#Mamon, Jasmin Mae G. 
#BSIT 2-A

#  1. The table shows the enrollment of BS in Computer Science, SY 2010-2011.
#Course Year 2019 - 2020
#1st 80
#2nd 75
#3rd 70
#4th 60


  #a. Plot the data using a bar graph. Write the codes and copy the result.


one <- c("1st", "2nd","3rd","4th")
two <- c(80,75,70,60)
barplot((two), 
        ylab = "2019-2020",
        xlab = "Course Year",
        names.arg = c("1st", "2nd","3rd","4th"))


#  b. Using the same table, label the barchart with


#  Title = ??? Enrollment of BS Computer Science
#horizontal axis = ???Curriculum Year??? and
#vertical axis = ???number of students???


one <- c("1st", "2nd","3rd","4th")
two <- c(80,75,70,60)
barplot((two), 
        main = "Enrollment of BS Computer Science",
        ylab = "number of students",
        xlab = "Curriculum Year",
        names.arg = c("1st", "2nd","3rd","4th"))


#  2. The monthly income of De Jesus family was spent on the following: 60% on Food, 10% on electricity, 5% for savings, and 25% for other miscellaneous expenses.


#  a. Create a table for the above scenario.
#Write the codes and its result.


de <- c(60,10,5,25)
barplot(de,names.arg = c("Food", "electricity", "savings","miscellaneous expenses"))



 # b. Plot the data using a pie chart. Add labels, colors and legend.
#Write the codes and its result.


de <- c(60,10,5,25)
de_jesus <- round(de/sum(de) * 100, 1)
de_jesus <- paste(de_jesus, "%", sep = "")
pie(de,col = rainbow(length(de)), labels = de_jesus, cex = 0.8)

legend(1.0,0.5, c("Food", "electricity", "savings","miscellaneous expenses"),
       cex = 0.8, fill = rainbow((length(de_jesus))))



#  3. Open the mtcars dataset.
#a. Create a simple histogram specifically for mpg (miles per gallon) variable.


cars <- data(mtcars)
cars 



#  Use $ to select the mpg only. Write the codes and its result.

#  b. Colored histogram with different number of bins.

#  hist(mtcars$mpg, breaks=12, col="red")

#  Note: breaks= controls the number of bins


mtcarsDF <- c(mtcars$mpg)
hist(mtcars$mpg, breaks=12, col = "red")



#  c. Add a Normal Curve

x <- mtcars$mpg
h<-hist(x, breaks=10, col="red", xlab="Miles Per Gallon",
        main="Histogram with Normal Curve")
xfit<-seq(min(x),max(x),length=40)
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x))
yfit <- yfit*diff(h$mids[1:2])*length(x)
lines(xfit, yfit, col="blue", lwd=2)


  #Copy the result


#  4. Open the iris dataset. Create a subset for each species.
#a. Write the codes and its result.


data("iris")

h <- subset(iris, Species == "setosa")
h

i <- subset(iris, Species == "virginica")
i

j <- subset(iris, Species == "versicolor")
j



#b. Get the mean for every characteristics of each species using colMeans().
#Write the codes and its result.
#Example: setosa <- colMeans(setosa[sapply(setosaDF,is.numeric)])


setosa <- colMeans(h[sapply(iris,is.numeric)])
setosa

virginica <- colMeans(i[sapply(iris,is.numeric)])
virginica

versicolor <- colMeans(j[sapply(iris,is.numeric)])
versicolor



  #c. Combine all species by using rbind()
#The table should be look like this:
  

table1 <- rbind(setosa,versicolor,virginica)
table1



 # d. From the data in 4-c: Create the barplot().
#Write the codes and its result.
#The barplot should be like this.

barplot(table1, beside = TRUE,
        col = c("red", "green","blue"),
        ylab = "Mean Scores",
        xlab = "Characteristics",
        main = "Iris Data")

