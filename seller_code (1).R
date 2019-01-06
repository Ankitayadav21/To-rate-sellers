data1 <- read.csv(file.choose(),header = T)
head(data1)
attach(data1)

# fitting a linear model:
lm <- lm(data1$y ~ . , data = data1)
summary(lm)

# importing the test data:
test <- read.csv(file.choose(), header = T)
head(test)

# predicted value.
pre <- predict(lm, test)
pre

# converting predicted value into data frame:
pred <- data.frame(pre)

# the below code ensure, if cost in test data set is greater then budget (say 11) then it 
# will print predicted value as 0.
pred$pre[test$cost > 11] = 0
test_f <- cbind(test,pred)
test_f

# the result of above code will be:
cost experience emergency        pre
1 11.90        5.0       5.0  0.0000000
2  3.47        2.0       3.0  1.3585019
3  9.34        4.0       4.0  3.0502991
4  8.32        3.5       3.9  2.7193174
5  5.54        3.9       2.5  2.1730850
6  1.00        0.0       1.1 -0.1691854
7  6.56        4.5       4.0  2.9079888
8  6.56        4.0       4.0  2.7232249
9 10.53        5.0       5.0  3.8219544
