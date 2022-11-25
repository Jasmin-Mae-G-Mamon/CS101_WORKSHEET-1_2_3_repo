#WORKSHEET6
#MAMON,JASMIN MAE G
#BSIT2-A

library(ggplot2)
data(mpg)
as.data.frame(data(mpg))
data(mpg)
mpg

str(mpg)
library(dplyr)
glimpse(mpg)
#Example. graph using ggplot()
ggplot(mpg, aes(cty, hwy)) +
  geom_point()

#1. How many columns are in mpg dataset? How about the number of rows? Show the codes and its result.
#There are 11 columns and 234 rows in the mpg data frame.

data_mpg <- glimpse(mpg)
nrow(mpg)
#234
ncol(mpg)
#11

#2. Which manufacturer has the most models in this data set? Which model has the most variations? Ans:
#Answer: dodge has 37 models
total_num <- mpg %>% 
  group_by(manufacturer) %>% 
  tally(sort = TRUE)

  
#a. Group the manufacturers and find the unique models. Copy the codes and result.
data_mpg <- mpg
uniq_Models <- data_mpg %>% group_by(Manufacturer, Model) %>%
  distinct() %>% count()
uniq_Models

colnames(uniq_Models) <- c("Manufacturer", "Model","Counts")
uniq_Models

#b. Graph the result by using plot() and ggplot(). Write the codes and its result.

#plot
qplot(model, data = mpg,geom = "bar", fill=manufacturer)

#ggplot
ggplot(mpg, aes(model, manufacturer)) + geom_point()

#3. Same dataset will be used. You are going to show the relationship of the model and the manufacturer.

datampg <- mpg
model_fact <- datampg %>% group_by(manufacturer, model) %>%
  distinct() %>% count()
model_fact

colnames(model_fact) <- c("Manufacturer", "Model")
model_fact

#a. What does ggplot(mpg, aes(model, manufacturer)) + geom_point() show?

ggplot(mpg, aes(model, manufacturer)) + geom_point()
#The plot shows the geometric point graph of mpg's model and manufacturer.

#b. For you, is it useful? If not, how could you modify the data to make it more informative?  : Yes, It is useful because you could trackdown the data of each model of the manufacturer
#to modify the data:
ggplot(mpg, aes(model, manufacturer)) + 
  geom_point() +
  geom_jitter()

#4. Using the pipe (%>%), group the model and get the number of cars per model. Show codes and its result.
datampg <- uniq_Models %>% group_by(Model) %>% count()
datampg

colnames(datampg) <- c("Model","Counts")

#a. Plot using the geom_bar() + coord_flip() just like what is shown below. Show codes and its result
qplot(model,data = mpg,main = "Number of Cars per Model", xlab = "Model",ylab = "Number of Cars", geom = "bar", fill = manufacturer) + coord_flip()

#b. Use only the top 20 observations. Show code and results.

cars_Model <- mpg %>% 
  group_by(model) %>% 
  tally(sort = TRUE)
cars_Model
ggplot(cars_Model, aes(x = model, y = n, fill = "rainbow")) +
  geom_bar(stat = "identity") + coord_flip()

#5. Plot the relationship between cyl - number of cylinders and displ - engine displacement using geom_point with aesthetic colour = engine displacement. Title should be “Relationship between No. of Cylinders and Engine Displacement”.
#a. Show the codes and its result.

ggplot(data = mpg , mapping = aes(x = displ, y = cyl, main = "Relationship between No. of Cylinders and Engine Displacement")) + 
  geom_point(mapping=aes(colour = "engine displacement")) + geom_jitter()


#b. How would you describe its relationship?
#According to my data of making cyl the y,
#the jittered graph displays the pink and black color. The pink indicates the engine displacement
#The dots indicates the number of cylinder which is 4,5,6,8. 


#6.Get the total number of observations for drv - type of drive train (f = front-wheel drive, r = rear wheel drive, 4 = 4wd) and class - type of class (Example: suv, 2seater, etc.) Plot using the geom_tile() where the number of observations for class be used as a fill for aesthetics.
#a. Show the codes and its result for the narrative in #6.

ggplot(data = mpg, mapping = aes(x = drv, y = class)) + geom_point(mapping=aes(color=class)) +
  geom_tile()
#b. Interpret the result: The areas that have covered 
#with tile are mapped using the geometric point graph, y as class and x as drv.

#7. Discuss the difference between these codes. Its outputs for each are shown below.
#Code #1
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, colour = "blue"))

#+ Code #2
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), colour = "blue")

#The difference between the code #1 and #2 is that in #2 the aes or 
#the x and y was inside the close-open parenthesis which separated with the color, blue. 
#While the code #1 the x and y was not enclosed that result the mix of color
#and since the color red is the color for engine displacement it automatically display
#the red color which is the engine displacement.


#8. Try to run the command ?mpg. What is the result of this command?
?mpg


#a. Which variables from mpg dataset are categorical? 
#Categorical variables in mpg include: manufacturer, model, trans (type of transmission), drv (front-wheel drive, rear-wheel, 4wd), fl (fuel type), and class (type of car).

#b. Which are continuous variables?
#Continuous variables in mpg include: displ (engine displacement in litres), cyl (number of cylinders), cty (city miles/gallon), and hwy (highway gallons/mile).

#c. Plot the relationship between displ (engine displacement) and hwy(highway miles per gallon). Mapped it with a continuous variable you have identified in #5-b.
ggplot(mpg, aes(displ, hwy, colour = cty)) + geom_point()

#What is its result? Why it produced such output? 
#The data tracks the cty(city miles per gallon), it also displays the engine displacement
#the high way gallons/miles and the number of cylinders in the hue of blue.

#9.Plot the relationship between displ (engine displacement) and hwy(highway miles per gallon) using geom_point(). Add a trend line over the existing plot using geom_smooth() with se = FALSE. Default method is “loess”.

ggplot(data = mpg, mapping = aes(displ, hwy)) +
  geom_point(mapping=aes(color=class)) + 
  geom_smooth(se = FALSE)

#10.Using the relationship of displ and hwy, add a trend line over existing plot. Set the se = FALSE to remove the confidence interval and method = lm to check for linear modeling

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = class)) +
  geom_point() +
  geom_smooth(se = FALSE)
