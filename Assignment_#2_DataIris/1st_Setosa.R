#Mamon, Jasmin Mae G. BSIT 2A

data("iris")
iris

#2. subset the data iris into 3-files by Species
#1st file-setosa

subset(iris, Species == "setosa")

#declare each column to get the total mean

iris_Petal1 <- iris$Petal.Length[1:50]
iris_Petal1

iris_Petal2 <- iris$Petal.Width[1:50]
iris_Petal2

iris_Sepal1 <- iris$Sepal.Length[1:50]
iris_Sepal1

iris_Sepal2 <- iris$Sepal.Width[1:50]
iris_Sepal2


#Get the total mean 

tota_mean <- c(iris_Petal1,iris_Petal2,iris_Sepal1,iris_Sepal2)
tota_mean

#Answer: 2.5355
mean(tota_mean)


#get each mean 

# Answer: 1.462
mean(iris_Petal1)

#Answer: 0.246
mean(iris_Petal2)

#Answer: 5.006
mean(iris_Sepal1)

#Answer: 3.428
mean(iris_Sepal2)
