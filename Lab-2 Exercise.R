#Lab-2 Exercise
#Accessing Various File Types
#1.Display the first 10 rows of each dataset using head().
data("Facebook")
data("lungcap")
data("titanic")
head(Facebook, 10)
head(lungcap, 10)
head(titanic, 10)

#2.Check the data type of each column in the Titanic dataset.
str(titanic)

#3.Save the Titanic dataset into a new CSV file after filtering only passengers who survived.
titanic_survivors <- subset(titanic, survived == 1)
write.csv(titanic_survivors, "Titanic_Survivors.csv", row.names = FALSE)


#Data Selection & Manipulation
#From the titanic dataset
#1.Select only the columns Name, Sex, Age, and Survived.
colnames(titanic)
titanic_subset <- titanic[, c("name", "sex", "age", "survived")]
print(titanic_subset)


#2.Show passengers older than 50.
titanic_over50 <- subset(titanic, age > 50)
print(titanic_over50)

#3.Count the number of survivors in each passenger class (Pclass).
table(titanic$pclass, titanic$survived)

#From the facebook dataset
#1.Find the post with the maximum number of likes.
FB <- Facebook[which.max(Facebook$likes),]
print(FB)

#2.Calculate the average number of shares per post.
FB_mean <- mean(Facebook$share, na.rm = TRUE)
print(FB_mean)

#3.Create a new column Engagement = Likes + Comments + Shares. 3. Using the Lung Capacity dataset:
Facebook$Engagement <- Facebook$like + Facebook$comment + Facebook$share
print(Facebook$Engagement)


#From the lungcap dataset
#1.Select children below age 12.
lung_child <- subset(lungcap, Age..years.<12)
print(lung_child)

#2.Group by Gender and calculate average Lung Capacity.
library(dplyr)
lungcap %>%
  group_by(Gender) %>%
  summarise(Avg_LungCap = mean(LungCap.cc., na.rm = TRUE))

#3.Find the child with the maximum Lung Capacity.
max_cap <- lungcap[which.max(lungcap$LungCap.cc.),]
print(max_cap)


#Data Manipulation (Using dplyr/base R
#1.Rename the columns of Titanic dataset to lowercase.
names(titanic) <- tolower(names(titanic))
head(titanic)

#2.Sort the Titanic dataset by Age in descending order.
titanic_sorted <- titanic[order(-titanic$age), ]
head(titanic_sorted)

#3.Create a new column in Titanic dataset AgeGroup.
titanic$AgeGroup <- ifelse(titanic$age < 12, "Child",
                    ifelse(titanic$age >= 12 & titanic$age <= 18, "Teen",
                    ifelse(titanic$age >= 19 & titanic$age <= 59, "Adult", "Senior")))

#4.Calculate mean Fare by Pclass and Survived status.
aggregate(fare ~ pclass + survived, data = titanic, FUN = mean, na.rm = TRUE)

#5.From Facebook dataset, group posts by Type (e.g., Photo, Link, Status) and compute average likes.
library(dplyr)

Facebook %>%
  group_by(Type) %>%
  summarise(AvgLikes = mean(like, na.rm = TRUE))


#Handling Missing Values
#1.Identify the columns with missing values in the Titanic dataset.
colSums(is.na(titanic))

#2.Replace missing Age values with the median Age.
titanic$age[is.na(titanic$age)] <- median(titanic$age, na.rm = TRUE)

#3.Drop rows where Embarked is missing (Titanic dataset)
titanic_clean <- titanic[!is.na(titanic$embarked) & titanic$embarked != "", ]
nrow(titanic_clean)

#4.For Lung Capacity dataset, fill missing values of LungCap with the mean LungCap.
mean_lungcap <- mean(lungcap$LungCap.cc., na.rm = TRUE)
lungcap$LungCap[is.na(lungcap$LungCap.cc.)] <- mean_lungcap
print(mean_lungcap)

#Exploratory Data Analysis (EDA)
#1.Draw a histogram of Age (Titanic dataset).
hist(titanic$age, 
     main = "Age Distribution", 
     xlab = "age", 
     col = "skyblue", 
     border = "black")

#2.Create a bar chart of Pclass vs. count of passengers.
barplot(table(titanic$pclass), 
        main = "Passenger Count by Class", 
        xlab = "Pclass", 
        ylab = "Count", 
        col = "orange")

#3.Plot a boxplot of LungCap by Gender.
boxplot(LungCap.cc. ~ Gender, data = lungcap,
        main = "Lung Capacity by Gender",
        xlab = "Gender", ylab = "Lung Capacity",
        col = c("pink", "lightblue"))

#4.Create a scatter plot of Likes vs Comments(facebook dataset).
plot(Facebook$like, Facebook$comment,
     main = "Likes vs Comments",
     xlab = "Likes", ylab = "Comments",
     col = "blue", pch = 19)

#Create a histogram of Shares.
hist(Facebook$share,
     main = "Distribution of Shares",
     xlab = "Shares",
     col = "green", border = "black")

#5.For Titanic dataset, use a pie chart to show the proportion of survivors vs non-survivors.
survival_counts <- table(titanic$survived)
pie(survival_counts,
    labels = c("Did Not Survive", "Survived"),
    col = c("red", "green"),
    main = "Survival Distribution")


#Detecting and Handling Outliers
#Boxplot Method
#1.Create a boxplot of Fare and visually identify potential outliers(titanic dataset)
boxplot(titanic$fare,
        main = "Boxplot of Passenger Fare",
        ylab = "Fare",
        col = "lightblue")

#.Create a boxplot of Age separated by Survived (use boxplot(Age ~ Survived, data=Titanic) in R).
boxplot(age ~ survived, data = titanic,
        main = "Age Distribution by Survival Status",
        xlab = "Survived", ylab = "Age",
        names = c("Not Survived", "Survived"),
        col = c("red", "green"))

#2.Create a boxplot of Likes and identify extreme posts.(Facebook dataset)
boxplot(Facebook$like,
        main = "Boxplot of Likes",
        ylab = "Likes",
        col = "orange")

#.Draw a combined boxplot of Likes, Shares, and Comments side by side.
boxplot(Facebook[, c("like", "share", "comment")],
        main = "Engagement Metrics Distribution",
        col = c("lightblue", "lightgreen", "lightpink"),
        ylab = "Count")

#IQR Method
#1.Compute Q1, Q3, and IQR for Fare (Titanic dataset).
# Q1, Q3 and IQR
Q1 <- quantile(titanic$fare, 0.25, na.rm = TRUE)
Q3 <- quantile(titanic$fare, 0.75, na.rm = TRUE)
IQR_value <- IQR(titanic$fare, na.rm = TRUE)

# Bounds
lower_bound <- Q1 - 1.5 * IQR_value
upper_bound <- Q3 + 1.5 * IQR_value

# Count outliers
sum(titanic$fare < lower_bound | titanic$fare > upper_bound, na.rm = TRUE)

#2.Same for the titanic dataset
# Q1, Q3, IQR
Q1_age <- quantile(titanic$age, 0.25, na.rm = TRUE)
Q3_age <- quantile(titanic$age, 0.75, na.rm = TRUE)
IQR_age <- IQR(titanic$Age, na.rm = TRUE)

# Bounds
lower_age <- Q1_age - 1.5 * IQR_age
upper_age <- Q3_age + 1.5 * IQR_age

# Count outliers
sum(titanic$age < lower_age | titanic$age > upper_age, na.rm = TRUE)

# Capping method: replace outliers with nearest bound
titanic$age_capped <- titanic$age
titanic$age_capped[titanic$age < lower_age] <- lower_age
titanic$age_capped[titanic$age > upper_age] <- upper_age
print(titanic$age_capped)

#3.For lungcap dataset
# Q1, Q3, IQR
Q1_lung <- quantile(lungcap$LungCap, 0.25, na.rm = TRUE)
Q3_lung <- quantile(lungcap$LungCap, 0.75, na.rm = TRUE)
IQR_lung <- IQR(lungcap$LungCap, na.rm = TRUE)

# Bounds
lower_lung <- Q1_lung - 1.5 * IQR_lung
upper_lung <- Q3_lung + 1.5 * IQR_lung

# Detect outliers
outliers <- (lungcap$LungCap < lower_lung | lungcap$LungCap > upper_lung)

# Average before removal
mean_before <- mean(lungcap$LungCap, na.rm = TRUE)

# Remove outliers
lungcap_no_outliers <- lungcap[!outliers, ]

# Average after removal
mean_after <- mean(lungcap_no_outliers$LungCap, na.rm = TRUE)

# Compare
mean_before
mean_after
