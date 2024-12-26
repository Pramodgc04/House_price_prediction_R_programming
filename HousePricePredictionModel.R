library(ggplot2)
library(gridExtra)
library(grid)
library(lattice)
library(scales)
library(moments)
library(devtools)
library(corrplot)
library(reshape2)
library(dplyr)
library(caret)
library(car)
library(randomForest)
library(Metrics)
library(performance)

main_dataset <- read.csv("C:/Users/user/Desktop/Main Dataset.csv", stringsAsFactors = FALSE)



View(main_dataset)
head(main_dataset, 10)


f_data <- main_dataset[, c("Id", "MSSubClass", "LotArea", "LandContour", "Utilities", "Neighborhood", 
                      "Condition1", "Condition2", "BldgType", "OverallQual", "OverallCond", "YearBuilt",
                      "YearRemodAdd", "Heating", "HeatingQC", "CentralAir", "Electrical", "KitchenQual",
                      "GarageType", "GarageCars", "MoSold", "YrSold", "SalePrice")]

f_data



names(f_data)

f_data$LandContour <- as.factor(f_data$LandContour)
f_data$Utilities <- as.factor(f_data$Utilities)
f_data$Neighborhood <- as.factor(f_data$Neighborhood)
f_data$Condition1 <- as.factor(f_data$Condition1)
f_data$Condition2 <- as.factor(f_data$Condition2)
f_data$BldgType <- as.factor(f_data$BldgType)
f_data$Heating <- as.factor(f_data$Heating)
f_data$HeatingQC <- as.factor(f_data$HeatingQC)
f_data$CentralAir <- as.factor(f_data$CentralAir)
f_data$Electrical <- as.factor(f_data$Electrical)
f_data$KitchenQual <- as.factor(f_data$KitchenQual)
f_data$GarageType <- as.factor(f_data$GarageType)

is.na(f_data)

sum(is.na(f_data))

f_data1 <- na.omit(f_data)

sum(is.na(f_data1))

sum(is.na(f_data))
sum(is.na(f_data1))

str(f_data1)

summary(f_data1)

data <- data.frame(f_data1)
chart1 = ggplot(data, aes(x=LandContour)) + geom_bar() + theme(axis.text.x = element_text(angle = 90, hjust =1))
chart2 = ggplot(data, aes(x=f_data1$Utilities)) + geom_bar() + theme(axis.text.x = element_text(angle = 90, hjust =1))
chart3 = ggplot(data, aes(x=f_data1$Neighborhood)) + geom_bar() + theme(axis.text.x = element_text(angle = 90, hjust =1))
chart4 = ggplot(data, aes(x=f_data1$Condition1)) + geom_bar() + theme(axis.text.x = element_text(angle = 90, hjust =1))
chart5 = ggplot(data, aes(x=f_data1$Condition2)) + geom_bar() + theme(axis.text.x = element_text(angle = 90, hjust =1))
chart6 = ggplot(data, aes(x=f_data1$BldgType)) + geom_bar() + theme(axis.text.x = element_text(angle = 90, hjust =1))
chart7 = ggplot(data, aes(x=f_data1$Heating)) + geom_bar() + theme(axis.text.x = element_text(angle = 90, hjust =1))
chart8 = ggplot(data, aes(x=f_data1$HeatingQC)) + geom_bar() + theme(axis.text.x = element_text(angle = 90, hjust =1))
chart9 = ggplot(data, aes(x=f_data1$CentralAir)) + geom_bar() + theme(axis.text.x = element_text(angle = 90, hjust =1))
chart10 = ggplot(data, aes(x=f_data1$Electrical)) + geom_bar() + theme(axis.text.x = element_text(angle = 90, hjust =1))
chart11 = ggplot(data, aes(x=f_data1$KitchenQual)) + geom_bar() + theme(axis.text.x = element_text(angle = 90, hjust =1))


chart12 = ggplot(data, aes(x=f_data1$GarageType)) + geom_bar() + theme(axis.text.x = element_text(angle = 90, hjust =1))

chart1
chart2
chart3
chart4
ggplot(data, aes(x = Neighborhood, y = SalePrice)) + 
  geom_boxplot() + 
  geom_hline(aes(yintercept = mean(data$SalePrice)), colour = "red", linetype = "dashed", lwd = 0.5) + 
  scale_y_continuous(labels = scales::dollar_format()) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) + 
  labs(title = "Sale Price Distribution by Neighborhood", y = "Sale Price")

chart5
chart6
chart7
chart8
chart9
chart10
chart11
chart12
grid.arrange(chart1, chart2, chart3,ncol=2, nrow=3)


chartX = ggplot(data, aes(x= Neighborhood, y= SalePrice)) + geom_boxplot() + geom_hline(aes(yintercept=mean(data$SalePrice)), colour = "red", linetype= "dashed", lwd=0.5) + scale_y_continuous(labels = dollar_format()) + theme(axis.text.x = element_text(angle = 90, hjust =1))
chartX

chart_d1 = ggplot(data = data, aes(x = MSSubClass)) + geom_density( fill = "yellow", color = "black")
chart_d2 = ggplot(data = data, aes(x = LotArea)) + geom_density( fill = "yellow", color = "black")
chart_d3 = ggplot(data = data, aes(x = OverallQual)) + geom_density( fill = "yellow", color = "black")
chart_d4 = ggplot(data = data, aes(x = OverallCond)) + geom_density( fill = "yellow", color = "black")
chart_d5 = ggplot(data = data, aes(x = YearBuilt)) + geom_density( fill = "yellow", color = "black")
chart_d6 = ggplot(data = data, aes(x = YearRemodAdd)) + geom_density( fill = "yellow", color = "black")
chart_d7 = ggplot(data = data, aes(x = GarageCars)) + geom_density( fill = "yellow", color = "black")
chart_d8 = ggplot(data = data, aes(x = MoSold)) + geom_density( fill = "yellow", color = "black")
chart_d9 = ggplot(data = data, aes(x = YrSold)) + geom_density( fill = "yellow", color = "black")

chart_d1
chart_d2
chart_d3
chart_d4
chart_d5
chart_d6
chart_d7
chart_d8
chart_d9

print(paste0("MSSubClass = " , skewness(data$MSSubClass)))
print(paste0("LotArea = " , skewness(data$LotArea)))
print(paste0("OverallQual = " , skewness(data$OverallQual)))
print(paste0("OverallCond = " , skewness(data$OverallCond)))
print(paste0("YearBuilt = " , skewness(data$YearBuilt)))
print(paste0("YearRemodAdd = " , skewness(data$YearRemodAdd)))
print(paste0("GarageCars = " , skewness(data$GarageCars)))
print(paste0("MoSold = " , skewness(data$MoSold)))
print(paste0("YrSold = " , skewness(data$YrSold)))

num_data <- select_if(data, is.numeric)
corr_mat <- round(cor(num_data), 2)

melted_corr_mat <- melt(corr_mat)
head(melted_corr_mat)

ggplot(data = melted_corr_mat, aes(x=Var1, y=Var2, fill=value)) + geom_tile() + geom_text(aes(Var2, Var1, label = value), color = "black", size = 4) + theme(axis.text.x = element_text(angle = 90, hjust =1))



str(f_data1)

sum(!complete.cases(f_data1))

data_train <- f_data1[1:1300,]
data_train

data_test <- f_data1[1301:2757, ]

data_test

set.seed(1)

ranfor_model <- randomForest(x = data_train[, 1:22], 
                             y = data_train$SalePrice,
                             ntree = 100)

ranfor_model

plot(ranfor_model)
varImpPlot(ranfor_model)

ranfor_pred <- predict(ranfor_model, data_test)
View(ranfor_pred)


print(paste0("Root Mean Square Error (RMSE) = ", RMSE(ranfor_pred, data_test$SalePrice)))
print(paste0("R Square Error (R2) = ", R2(ranfor_pred, data_test$SalePrice)))
print(paste0("Mean Absolute Error (MAE) = ", MAE(ranfor_pred, data_test$SalePrice)))



set.seed(1)

mul_reg <- lm(data_train$SalePrice ~., data = data_train)
summary(mul_reg)

plot(mul_reg)

mulreg_pred <- predict(mul_reg, data_test)
View(mulreg_pred)

print(paste0("Root Mean Square Error (RMSE) = ", RMSE(mulreg_pred, data_test$SalePrice)))
print(paste0("R Square Error (R2) = ", R2(mulreg_pred, data_test$SalePrice)))
print(paste0("Mean Absolute Error (MAE) = ", MAE(mulreg_pred, data_test$SalePrice)))



test_data <- data.frame(
  Id = c(2758, 2759, 2760),
  MSSubClass = c(60, 120, 80),
  LotArea = c(5000, 10000, 7000),
  LandContour = factor(c("Lvl", "Bnk", "Low"), levels = c("Lvl", "Bnk", "Low")),
  Utilities = factor(c("AllPub", "AllPub", "NoSeWa"), levels = c("AllPub", "NoSeWa")),
  Neighborhood = factor(c("CollgCr", "Veenker", "NoRidge"), levels = c("CollgCr", "Veenker", "NoRidge")),
  Condition1 = factor(c("Norm", "Feedr", "Artery"), levels = c("Norm", "Feedr", "Artery")),
  Condition2 = factor(c("Norm", "Norm", "Norm"), levels = c("Norm", "PosN", "Artery")),
  BldgType = factor(c("1Fam", "2Fam", "TwnhsE"), levels = c("1Fam", "2Fam", "TwnhsE")),
  OverallQual = c(7, 6, 8),
  OverallCond = c(5, 6, 7),
  YearBuilt = c(1995, 1988, 2005),
  YearRemodAdd = c(2005, 1990, 2010),
  Heating = factor(c("GasA", "GasA", "Grav"), levels = c("GasA", "Grav", "GasW")),
  HeatingQC = factor(c("Ex", "Gd", "TA"), levels = c("Ex", "Gd", "TA")),
  CentralAir = factor(c("Y", "N", "Y"), levels = c("Y", "N")),
  Electrical = factor(c("SBrkr", "SBrkr", "FuseF"), levels = c("SBrkr", "FuseF", "FuseA")),
  KitchenQual = factor(c("Ex", "Gd", "TA"), levels = c("Ex", "Gd", "TA")),
  GarageType = factor(c("Attchd", "Detchd", "BuiltIn"), levels = c("Attchd", "Detchd", "BuiltIn")),
  GarageCars = c(2, 1, 3),
  MoSold = c(5, 7, 10),
  YrSold = c(2008, 2009, 2010),
  SalePrice = c(200000, 150000, 250000)  # This column is not needed for prediction
)



for(col in c("LandContour", "Utilities", "Neighborhood", "Condition1", "Condition2", 
             "BldgType", "Heating", "HeatingQC", "CentralAir", "Electrical", 
             "KitchenQual", "GarageType")) {
  levels(test_data[[col]]) <- union(levels(f_data1[[col]]), "Other")
  test_data[[col]] <- factor(test_data[[col]], levels = levels(f_data1[[col]]))
  test_data[[col]][!(test_data[[col]] %in% levels(f_data1[[col]]))] <- "Other"  
}


ranfor_pred_test <- predict(ranfor_model, test_data)


mulreg_pred_test <- predict(mul_reg, test_data)


print(ranfor_pred_test)
print(mulreg_pred_test)










