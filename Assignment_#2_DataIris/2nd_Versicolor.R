#Mamon, Jasmin Mae G. BSIT 2A


data("iris")
iris

#2. subset the data iris into 3-files by Species
#2nd file-versicolor

subset(iris, Species == "versicolor")

#declare each column to get the total mean

iris_petal <- iris$Petal.Length[51:100]
iris_petal

iris_petal2 <- iris$Petal.Width[51:100]
iris_petal2

iris_sepal1 <- iris$Sepal.Length[51:100]
iris_sepal1

iris_sepal2 <- iris$Sepal.Width[51:100]
iris_sepal2


#Get the total mean of characteristics of versicolor

tota_mean <- c(iris_petal,iris_petal2,iris_sepal1,iris_sepal2)
tota_mean

#Answer: 3.573
mean(tota_mean)

#get the mean of each characteristics of species

# Answer: 4.26
mean(iris_petal)

#Answer: 1.326
mean(iris_petal2)

#Answer: 5.936
mean(iris_sepal1)

#Answer: 2.77
mean(iris_sepal2)

