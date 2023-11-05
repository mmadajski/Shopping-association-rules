# Associative Analysis
## Project Overview
My goal is to discover interesting associations and patterns in the dataset
as well as to better understand what customers are buying.
The R language was chosen as the main tool because of its strong association rule visualization capabilities.

---

## Table of Contents
- [Project Overview](#project-overview)
- [Dataset and data preparation](#dataset-and-data-preparation)
- [Associative Analysis](#associative-analysis)
- [Results](#results)
- [Requirements](#requirements)
- [Installation](#installation)

---

## Dataset and data preparation.

This project is base on market basket dataset. The data comes in single format,
meaning that each row contains single item and id of transaction. 
The dataset also includes information on the country in which the products were sold
as well as the quantity sold.

Due to the fact that more than 90% of the transactions took place in the UK, I decided to 
conduct an analysis only for items sold in the UK.
Some transactions were canceled, resulting in fewer than one.
These observations have been omitted.
In addition, items that were sold less than 200 times were also removed.

Data source: [dataset](https://www.kaggle.com/datasets/aslanahmedov/market-basket-analysis)

---

## Associative Analysis

On the previously prepared data, association rules were searched using the apriori algorithm.
I decided to look for rules with a minimum support of 0.01 and a confidence of 0.5.

---

## Results 

As a result, 1167 rules have been found. 
[image]()

On the plot above we can see that most of the rules have support in range `[0.01, 0.03]`.
A lot of the found rules have very high confidence, more than 80%.

Of all the rules, the 50 with the highest confidence were selected to plot the rules graph.
Interesting findings: 

[image]()

---

## Requirements

To run this project, you will need:

- R (Make sure you have an up-to-date version of R)
- Required R packages, which can be installed using the `install.packages()` function in R.
- RStudio is the recommended IDE

as well as following libraries:

- dplyr
- arules
- arulesViz

---

## Installation

1. Clone this repository or copy script to your local machine:

```bash
git clone https://github.com/mmadajski/Shopping-association-rules/tree/main
```

2. Download and unzip the data: [dataset](https://www.kaggle.com/datasets/aslanahmedov/market-basket-analysis).
3. Make sure you set have working directory to source file. 
You can do it using command `setwd()` or if you're using Rstudio:
Session -> Set Working Directory -> To Source File Location
4. Install packages using `install.packages()` function.

