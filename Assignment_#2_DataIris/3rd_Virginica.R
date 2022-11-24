#Mamon, Jasmin Mae G. BSIT 2A


data("iris")
iris

#2. subset the data iris into 3-files by Species
#3rd file-virginica

subset(iris, Species == "virginica")


#declare each column to get the total mean

iris_petal1 <- iris$Petal.Length[101:150]
iris_petal1

iris_petal2 <- iris$Petal.Width[101:150]
iris_petal2

iris_sepal1 <- iris$Sepal.Length[101:150]
iris_sepal1

iris_sepal2 <- iris$Sepal.Width[101:150]
iris_sepal2


#Get the total mean of characteristics of virginica

tota_mean <- c(iris_petal1,iris_petal2,iris_sepal1,iris_sepal2)
tota_mean

#Answer: 4.285 total mean of virginica species
mean(tota_mean)

#get the mean of each characteristics of species

# Answer: 5.552
mean(iris_petal1)

#Answer: 2.026
mean(iris_petal2)

#Answer: 6.588
mean(iris_sepal1)

#Answer: 2.974
mean(iris_sepal2)

