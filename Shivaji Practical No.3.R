#Practical No.3
#1.Count the missing values in the airquality dataset
data("airquality")
View(airquality)
sum(is.na(airquality))

#2.Replace the missing values in ozone with the median instead of mean 
airquality$Ozone[is.na(airquality$Ozone)] <- median(airquality$Ozone, na.rm = TRUE)

#3.Create a duplicate dataset from mtcars and remove the duplicates
data("airquality")
airquality_duplicates <- rbind(airquality, airquality) #add duplicates
nrow(airquality_duplicates) #before removing

airquality_clean <- unique(airquality_duplicates) #remove duplicates
nrow(airquality_clean) #after removing

#4.Convert all car names in mtcars row names to uppercase
rownames(mtcars) <- toupper(rownames(mtcars))
head(mtcars)

#5.Convert the Species column in iris dataset into numeric codes (1, 2, 3).
View(iris)
iris$Species_num <- as.numeric(factor(iris$Species))
head(iris[, c("Species", "Species_num")])

