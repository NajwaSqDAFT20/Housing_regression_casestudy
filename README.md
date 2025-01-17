# Project: Housing Price Prediction in King County, USA 

This is a mid Project for the Data Analytics Bootcamp at Ironhack, Berlin. In this repo, you can find all the deliverables: 
* Python File named 'Housing_case_study.ipynb'
* Dataset/datasets named 'regression_data_clean.csv'
* Tableau workbook named 'Housing_Prices_Tableau.twb'
* File containing SQL queries named 'housing_casestudy.sql'
* Presentaion in the presentation file. Tableau story [here](https://public.tableau.com/profile/najwa6600#!/vizhome/Housing_Prices_Tableau/Story1?publish=yes)
* Note that the presentation was presented to a friend of mine who had no technical background. 


# Introduction:
Housing prices are affected by several factors, external and internal. External factors are mainly related to economic factors (GDP, population, employment, income per capita, demand, inflation rate etc.), and internal factors (no. of rooms, location, size, age of the house etc.).
We are looking into the internal factors provided by the dataset (19 feature variables available in the dataset). 

# Objectives:
* Building a model that will predict the price of a house;
* Understanding the factors/features that are responsible for higher property value >= $650K

# Data Source:
The dataset for the project is provided by Ironhack. However, the dataset is publicly available [here](https://info.kingcounty.gov/assessor/DataDownload/default.aspx) or on [Kaggle](https://www.kaggle.com/harlfoxem/housesalesprediction).
The dataset contains information on historic house sale prices for 22,000 properties in Kingcounty, USA between 2014 and 2015. 

# Approach:
* Get modules needed: Python 3.7.0, Matplotlib, Pandas, Numpy, scikit-learn
* Data exploration 
* Data cleaning and wrangling
* Visualisation / finding patterns for numeric and categrical values
* Data Preprocessing: dealing with missing data, ouliers, feature engineering, dropping columns, normalize numeric variables and encode categorical variables
* Split data into train and test sets
* Fit a model 
* Evaluate model's perfomance
* Iterate

# Next steps:
* Due to time constraints, I could not test advanced models on the linear regression model. For future work, I would like to implement a forest tree model and Lasso.
* Since the price of houses relies on different and multiple factors (internally and externally), I would like to have a look into other external elements (economic growth, GDP, unemployment, access to facilities, government policies (subsidies/ tax deduction) and interest rate).
* I also would like to analyse the effect of increasing prices on accessing to housing. 

# References:
* [Housing Market Prediction Problem using Different Machine Learning Algorithms: A Case Study](https://www.researchgate.net/publication/342302491_Housing_Market_Prediction_Problem_using_Different_Machine_Learning_Algorithms_A_Case_Study)
* [Modeling House Price Prediction using Regression Analysis and Particle Swarm Optimization](https://thesai.org/Downloads/Volume8No10/Paper_42-Modeling_House_Price_Prediction_using_Linear_Regression.pdf)




