#Mamon, Jasmin Mae G.
#BSIT 2-A

# Using Vectors
# 1. Create a vector using : operator
# a. Sequence from -5 to 5. Write the R code and its output. Describe its output.
seqVector <- c(-5:5)
seqVector#it print out the numbers from -5 to 5 with 0 in between

# b. x <- 1:7. What will be the value of x?
x <- 1:7 
x           # 1,2,3,4,5,6,7

# 2.* Create a vector using seq() function

# a. seq(1, 3, by=0.2) # specify step size
one <- seq(1, 3, by=0.2) 
one                      # step size 0.2

# Write the R code and its output. Describe the output.
# [1] 1.0 1.2 1.4 1.6 1.8 2.0 2.2 2.4 2.6 2.8 3.0

# 3. A factory has a census of its workers. There are 50 workers 
# in total. The following
# list shows their ages: 34, 28, 22, 36, 27, 18, 52, 39, 42,
# 29, 35, 31, 27, 22, 37, 34, 19, 20, 57, 49, 50, 37, 46, 25, 17, 37,
# 43, 53, 41, 51, 35 24,33, 41, 53, 40, 18, 44, 38, 41, 48, 27, 39,
# 19, 30, 61, 54, 58, 26, 18.

workers_age <- c(34, 28, 22, 36, 27, 18, 52, 39, 42, 29, 35, 31, 27,
                 22, 37, 34, 19, 20, 57, 49, 50, 37, 46, 25, 17, 37, 43, 53, 41, 51, 35,
                 24,33, 41, 53, 40, 18, 44, 38, 41, 48, 27, 39, 19, 30, 61, 54, 58, 26,
                 18)
workers_age

# a. Access 3rd element, what is the value?

workers_age[3]   #22


# b. Access 2nd and 4th element, what are the values?
workers_age[c(2,4)]    #28 and 36




# c. Access all but the 1st element is not included.
workers_age[-1] #or 

workers_age[2:50]


# Write the R code and its output.


# 4. *Create a vector x <- c("first"=3, "second"=0, "third"=9). 
# Then named the vector,names(x).
x <- c("first"=3, "second"=0, "third"=9)
names(x)  

# a. Print the results. Then access x[c("first", "third")].
x <- c("first"=3, "second"=0, "third"=9)
names(x)

x[c("first", "third")]
#it prints the first and third number only 

# Describe the output.

# b. Write the code and its output.



#5. Create a sequence x from -3:2.
x <- c(-3:2)
x

#a. Modify 2nd element and change it to 0;
x[2] <- 0
x

#Describe the output.


# 6. *The following data shows the diesel fuel purchased by Mr. Cruz.
# Month Jan Feb March Apr May June
# Price per liter (PhP) 52.50 57.25 60.00 65.00 74.25 54.00
# Purchase–quantity(Liters) 25 30 40 50 10 45
# a. Create a data frame for month, price per liter (php) and purchase-quantity (liter).

# Write the codes.


month <- c("Jan", "Feb", "March", "Apr", "May", "June")
Price_per_liter_Php <- c(52.50, 57.25, 60.00, 65.00, 74.25, 54.00)
Purchase_Quantity_liter <- c( 25, 30, 40, 50, 10, 45)

data <- data.frame(month,Price_per_liter_Php,Purchase_Quantity_liter)


data


# b. What is the average fuel expenditure of Mr. Cruz from Jan to June? Note: Use
# weighted.mean(liter, purchase)

weighted.mean(Price_per_liter_Php,Purchase_Quantity_liter)  #59.2625




#7. R has actually lots of built-in datasets. For example, the rivers data “gives the lengths
#(in miles) of 141 “major” rivers in North America, as compiled by the US Geological
#Survey”.
#a. Type “rivers” in your R console. Create a vector data with 7
#elements, containing the number of elements (length) in rivers,
#their sum (sum), mean (mean), median (median), variance (var)
#standard deviation (sd), minimum (min) and maximum (max).
#data <- c(length(rivers), sum(rivers), mean(rivers), median(rivers), var(rivers),
#         sd(rivers), min(rivers), max(rivers))
#b. What are the results?

data <- c(length(rivers), sum(rivers), mean(rivers), median(rivers), var(rivers),
          sd(rivers), min(rivers), max(rivers))
data

rivers
# c. Write the code and its outputs.


#8. The table below gives the 25 most powerful celebrities and their annual pay as ranked
#by the editions of Forbes magazine and as listed on the Forbes.com website.


#a. Create vectors according to the above table. Write the codes.

Power_Ranking <- c(1:25)
Celebrity_Name <- c("Tom Cruise", "Rolling Stones","Oprah Winfrey","U2","Tiger woods","Steven Speilberg",
                    "Howard Stern","50 Cent", "Cast of the Sopranos","Dan Brown","Bruce Springsteen",
                    "Donald Trumph","Muhammad Ali","Paul McCartney","Goerge Lucas","Elton John","David Letterman",
                    "Phil Mickelson","J.K Rowling","BRADd Pitt", "Peter Jackson","Dr. Phil McGraw","Jay Lenon",
                    "Celine Dion","Kobe Bryant")
Pay <- c(67,90,225,110,90,332,302,41,52,88,55,44,55,40,233,34,40,47,75,25,39,45,32,40,31)

data <- data.frame(Power_Ranking, Celebrity_Name, Pay)
data


Power_Ranking [19] <- 15
Power_Ranking
Pay[75] <- 90
Pay

#b. Modify the power ranking and pay of J.K. Rowling. Change power ranking to 15 and
#pay to 90. Write the codes and its output.



#c. Interpret the data

# The data shows the ranking of the most powerful celebrity and their annual pay 
#that is also rank by the edition of Forbes Magazine.
#By modifying the power ranking of J.K Rowling, it's rank changed from 19 to 15 and it's pay from 75 to 90. 

