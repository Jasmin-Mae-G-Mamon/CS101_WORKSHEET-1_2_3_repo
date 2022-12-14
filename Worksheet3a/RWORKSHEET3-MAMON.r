#Mamon, Jasmin Mae
#BSIT 2-A
#WORKSHEET#3

#USING VECTOR
LETTERS <- c("A","B","C","D","E","F","G","H","I","J","K","L","M","N",
             "O","P","Q","R","S","T","U","V","W","X","Y","Z")
LETTERS



Letters <- c("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o",
             "p","q","r","s","t","u","v","w","x","y","z")
Letters

#Based on the above vector LETTERS.
#a. You need to produce a vector that contains the first 11 letter. 

first <- LETTERS[c(1:11)]
first

#b Produce a vector that contains the odd numbered letters.

odd_LETTERS <- c(LETTERS[1:26 %% 2 != 0])
odd_LETTERS

#c.Produce a vector that contains the vowels
vowels <- LETTERS[c(1,5,9,15,21)]
vowels

#Based on the above vector letters:
#d. Produce a vector that contains the last 5 lowercase letters.
lower_case <- letters[c(22:26)]
lower_case


#e. Produce a vector that contains letters between 15 to 24 letters in lowercase.
between <- letters[c(15:24)]
between

#22. Create a vector with the average temperatures in April for Tuguegarao City, Manila,
#Iloilo City, Tacloban, Samal Island, and Davao City. The average temperatures in
#Celcius are 42, 39, 34, 34, 30, and 27 degrees.

april <- c(
  city <- c("Tuguegarao City","Manila","Iloilo City","Tacloban","Samal Island",
            "Davao City"),
  temp <- c(42, 39, 34, 34, 30, 27)
)
april


#a. What is the R code and its result for creating a character vector for the city/town of
#Tuguegarao City, Manila, Iloilo City, Tacloban, Samal Island, and Davao City? Name the
#object as city. The names should follow the same order as in the instruction.

city <- c("Tuguegarao City","Manila","Iloilo City","Tacloban","Samal Island","Davao City")
city

#b. The average temperatures in Celcius are 42, 39, 34, 34, 30, and 27 degrees.
#Name the object as temp. Write the R code and its output. Numbers should also follow what
#is in the instruction.

temp <- c(42, 39, 34, 34, 30, 27)
temp


#c. Associate the temperature temp with the city by using names() function. What is
#the R code and its result?)
names(temp) <- c("Tuguegarao City","Manila","Iloilo City","Tacloban","Samal Island","Davao City")
temp


#e. From the answer in d, what is the content of index 5 and index 6? What is its R code?
index <- temp[c(5:6)]
index


#Using Matrices
#??? Matrix can be created by specifying the rows and columns
#2. Create a matrix of one to eight and eleven to fourteen with four columns and three rows.


mat <- matrix(c(1,2,3,4,5,6,7,8,11,12,13,14),3,4)
mat

#a. What will be the R code for the #2 question and its result?
mat <- matrix(c(1,2,3,4,5,6,7,8,11,12,13,14),3,4)
mat

#b. Multiply the matrix by two. What is its R code and its result?
result <- mat*2
result

# c. What is the content of row 2? What is its R code?
x <- mat[2,]
x

#d. What will be the R code if you want to display the column 3 and column 4 in row 1
#and row 2? What is its output?
a <- mat[c(1,2),c(3,4)]
a

# e. What is the R code if you want to display only the columns in 2 and 3, row 3? What
#is its output?
b <- mat[c(3),c(2,3)]
b

# f. What is the R code is you want to display only the columns 4? What is its output?
c <- mat[,4]
c

#g. Name the rows as isa, dalawa, tatlo and columns as uno, dos, tres, quatro
#for the matrix that was created in b.???. What is its R code and corresponding output?
dimnames(mat) <- list(c("isa","dalawa","tatlo"),c("uno","dos","tres","quatro"))
mat

#h. From the original matrix you have created in a, reshape the matrix by assigning a
#new dimension with dim(). New dimensions should have 2 columns and 6 rows. What will
#be the R code and its output?
dim(mat) <- c(6,2)
mat


#Using Arrays
#??? Array can have more than two dimensions by using the array() function and dim() to
#specify the dimensions

#3. An array contains 1, 2, 3, 6, 7, 8, 9, 0, 3, 4, 5, 1

#a. Create an array for the above numeric values. Each values will be repeated twice
#What will be the R code if you are to create a three-dimensional array with 4 columns and 2
#rows. What will be its output?
array1 <- c(1,2,3,4,5,6,7,8,9,0,3,4,5,1)
array1

three <- array(rep(array1,2), dim = c(2,4,3))
three



#  b. How many dimensions do your array have?
#Anawer: 3

#c. Name the rows as lowercase letters and columns as uppercase letters starting from
#the A. The array names should be ???1st-Dimensional Array???, ???2nd-Dimentional Array???, and
#???3rd-Dimensional Array???. What will be the R codes and its output?
dimnames(three) <- list(letters[1:2],LETTERS[1:4],c("1st-Dimensional Array","2nd-Dimensional Array","3rd-Dimensional Array"))
three

