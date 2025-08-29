#Q 1.1

my_name <- "Shivaji Sawant"          # store character
my_age <- 21                    # store numeric
is_student <- TRUE              # logical

#Q 1.2

numbers <- 1:10
vec <- c(1,2,3,4,5,6,7,8,9,10)

#Q 1.3

seqof5 <- 1:10*5        
alter <- seq(5,50,5)             # (start,end,step)

#Q 1.4

fruits <- c("Apple","Banana","Lichi","Mango","Strawberry")
fruits[c(2,4)]                   # To fetch 2nd and 4th position

#Q 1.5

random <- sample(1:100,10)        #sample(range,count) for random no.generation
x=min(random)
y=max(random)
z=mean(random)

#Q 1.6

students <- data.frame(
  Name = c("Alka", "Bharat", "Charlie", "Dravid", "Elizabeth"),
  Age= c(20, 22, 20, 21, 19),
  Marks = c(85, 90, 78, 92, 88))

print(students)

#Q 1.7

desc <- students[order(students$Marks,decreasing =TRUE),]
print(desc)



#Q 2.1

10+5         
10-5
10*5
10/5
10%%3
10%/%3  

#Q 2.2
15>10
7==7

#Q2.3

a <- c(2,4,6,8)
b <- c(1,3,5,7)
a+b
a-b
a*b

#Q 2.4

a>5
b<=4

#Q 2.5

5 %in% a

#Q 2.6

x <- c(TRUE, FALSE, TRUE, FALSE)
y <- c(TRUE, TRUE, FALSE, FALSE)
x&y
x|y
!x

#Q 3.1

for (i in 1:10) {
  print(i)
}

#Q 3.2

sum <- 0
i <- 1

while (i <= 100) {
  sum <- sum + i
  i <- i + 1
}
print(sum)  

#Q 3.3

for (i in 1:50) {
  if (i %% 2 == 0) {
    print(i)
  }
}

#Q 3.4

for (i in 1:10) {
  result <- 7 * i
  cat("7 x", i, "=", result, "\n")
}

#Q 3.5

n <- 10     
factorial <- 1

for (i in 1:n) {
  factorial <- factorial * i
}

cat("Factorial of", n, "is", factorial)

#Q 4.1

n <- -10

if (n > 0) {
  print(" +ve")
} else {
  print(" -ve")
}

#Q 4.2

num <- 7

if (num %% 2 == 0) {
  print("Even")
} else {
  print("Odd ")
}

#Q 4.3

year <- 2024

if (year %% 4 == 0){
  print("Leap year")
} else {
  print("Not a leap year")
}

#Q 4.4

marks <- 38

if (marks >= 40) {
  print("Pass")
} else {
  print("Fail")
}

#Q 4.5

marks <- 80

if (marks >= 90) {
  print("Grade: A")
} else if (marks >= 75) {
  print("Grade: B")
} else if (marks >= 60) {
  print("Grade: C")
} else {
  print("Fail")
}

