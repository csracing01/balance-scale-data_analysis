#PART-I

a <- read.csv('balance-scale.csv', header = TRUE)
b <- a[-1,]
c <- split(b, b$class)

c$B$class <- NULL
c$L$class <- NULL
c$R$class <- NULL

d1 <- dist(c$B)
d2 <- dist(c$L)
d3 <- dist(c$R)
boxplot(d1, d2, d3, main = "Class-wise Boxplot of distances", xlab = "Class", 
        las = 1, col = c("red", "blue", "green"), ylab = "Distances", 
        outline = TRUE, names = c("Balanced", "Left", "Right"))


library(e1071)

print("For class = B i.e. balanced")
print("Summary: ")
print(summary(d1))
print("Statistics: ")
print(boxplot.stats(d1))
print("Skewness: ")
print(skewness(d1))

print("For class = L i.e. left")
print("Summary: ")
print(summary(d2))
print("Statistics: ")
print(boxplot.stats(d2))
print("Skewness: ")
print(skewness(d2))

print("For class = R i.e. right")
print("Summary: ")
print(summary(d3))
print("Statistics: ")
print(boxplot.stats(d3))
print("Skewness: ")
print(skewness(d3))

#rm(list = ls())
detach("package:e1071", unload = TRUE)