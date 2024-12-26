
Project Overview
This project involves the following key steps:

Data Loading and Preprocessing:

Load the dataset (Main Dataset.csv).
Clean the dataset by removing missing values.
Convert categorical variables into factors.
Analyze basic summary statistics.
Data Visualization:

Generate bar charts for categorical features.
Create box plots to visualize the relationship between categorical features and the target variable (SalePrice).
Generate density plots for numeric variables to understand their distributions.
Calculate skewness for numeric features.
Correlation Analysis:

Compute the correlation matrix between numeric variables and visualize it using a heatmap.
Model Training:

Split the data into training and test sets.
Train a Random Forest model on the training set.
Make predictions using the test set.
Model Evaluation:

Calculate the RMSE (Root Mean Square Error) to evaluate the model's performance.
Dataset
The dataset used for this project (Main Dataset.csv) contains various features related to the housing prices. Some of the important columns include:

MSSubClass: Type of dwelling.
LotArea: Lot size in square feet.
Neighborhood: The neighborhood where the house is located.
OverallQual: Overall material and finish quality.
SalePrice: The target variable, representing the sale price of the house.
Key Visualizations
Bar Charts: For categorical variables like LandContour, Neighborhood, Condition1, etc.
Box Plots: Showing the relationship between categorical features and the sale price.
Density Plots: To examine the distribution of numeric features.
Correlation Heatmap: To understand the correlation between numeric features.
Example Output
Bar Charts for Categorical Variables:
Each categorical variable is visualized with bar plots that show the frequency of each category.

Box Plot for SalePrice by Neighborhood:
A box plot showing the distribution of sale prices across different neighborhoods, with a red dashed line indicating the mean sale price.

Random Forest Model:
After training the Random Forest model, predictions are made on the test set. The performance of the model is evaluated using the Root Mean Square Error (RMSE).

Running the Project
To run the project, simply execute the following steps:

Load and clean the dataset.
Perform exploratory data analysis (EDA) to understand the dataset.
Visualize the data using various plots.
Split the data into training and test sets.
Train the Random Forest model on the training data.
Evaluate the model's performance using RMSE.


example:

# Load dataset
main_dataset <- read.csv("C:/Users/user/Desktop/Main Dataset.csv", stringsAsFactors = FALSE)

# Clean and preprocess data
f_data <- main_dataset[, c("Id", "MSSubClass", "LotArea", "LandContour", "Utilities", "Neighborhood", "Condition1", "Condition2", "BldgType", "OverallQual", "OverallCond", "YearBuilt", "YearRemodAdd", "Heating", "HeatingQC", "CentralAir", "Electrical", "KitchenQual", "GarageType", "GarageCars", "MoSold", "YrSold", "SalePrice")]
f_data1 <- na.omit(f_data)

# Visualizations
# Generate bar plots for categorical features
ggplot(data, aes(x=LandContour)) + geom_bar()

# Train Random Forest model
ranfor_model <- randomForest(x = data_train[, -22], y = data_train$SalePrice, ntree = 100)

# Evaluate performance
rf_pred <- predict(ranfor_model, data_test)
rmse(rf_pred, data_test$SalePrice)


# Housing Price Prediction with Random Forest

This project uses a dataset to predict housing prices based on various features like the neighborhood, condition, overall quality, and more. The model utilizes Random Forest for regression, and the dataset is analyzed and preprocessed to visualize correlations, distributions, and other insights.

## Prerequisites

Before running the project, make sure you have the following libraries installed in R:

- ggplot2
- gridExtra
- grid
- lattice
- scales
- moments
- devtools
- corrplot
- reshape2
- dplyr
- caret
- car
- randomForest
- Metrics
- performance

You can install the required libraries using the following commands:

```r
install.packages("ggplot2")
install.packages("gridExtra")
install.packages("grid")
install.packages("lattice")
install.packages("scales")
install.packages("moments")
install.packages("devtools")
install.packages("corrplot")
install.packages("reshape2")
install.packages("dplyr")
install.packages("caret")
install.packages("car")
install.packages("randomForest")
install.packages("Metrics")
install.packages("performance")
