# Environmental Regression Analysis: Usnea spp. & Hypogymnia spp.

This repository contains a regression analysis project evaluating the relationships between various environmental variables (heavy metals, nutrients) and physiological responses (e.g., Enzyme activity - CAT, Chlorophyll content, Electrical Conductivity) in two lichen species: *Usnea spp.* and *Hypogymnia spp.*

## Project Overview

Lichen species are widely used as bioindicators for environmental pollution. This project statistically models how different elemental concentrations and pollutants impact the physiological and biochemical parameters of two lichen genera. The analysis includes normality testing, variance inflation factor (VIF) evaluation for multicollinearity, and multiple linear regression modeling.

## Data Source

The datasets used in this project are log-transformed for statistical robustness:
*   **`hypo_Log.xlsx`**: Data for *Hypogymnia spp.* containing 90 observations and 19 variables.
*   **`usnea_Log.xlsx`**: Data for *Usnea spp.* containing 90 observations and 21 variables.

### Key Variables Analyzed:
*   **Predictors (Independent Variables):** Ammonia, Nitrogen, Nitrate, Na, Mg, K, Ca, Mn, Fe, Ni, Cu, Zn, Pb, Cd
*   **Responses (Dependent Variables):** Electrical Conductivity (EC), Chlorophyll (Chl_t, Chl_d, Chl_f), Total Phenolic Content (TPC), DPPH (antioxidant activity), Catalase (CAT)

## Dependencies

The analysis is performed in Python using a Jupyter/Colab Notebook environment. The following libraries are required:
*   `pandas` - Data manipulation and analysis
*   `matplotlib` - Basic plotting and visualizations
*   `seaborn` - Statistical data visualization
*   `scipy` - Scientific and technical computing (specifically `scipy.stats` for Shapiro-Wilk tests and linear regression)
*   `statsmodels` - Estimation of statistical models, hypothesis tests, and data exploration (Multiple Linear Regression, VIF)

## Methodology

1.  **Data Import & Preprocessing:** 
    *   Loading the log-transformed datasets from Excel files into Pandas DataFrames.
2.  **Normality Check:** 
    *   Performing the Shapiro-Wilk test to assess the normal distribution of each variable at a 95% confidence interval ($ lpha = 0.05$).
3.  **Exploratory Data Analysis (EDA):** 
    *   Generating histograms for variable distribution.
    *   Creating regression plots (scatter plots with fitted linear models) using `seaborn.regplot` to visualize univariate relationships (e.g., Nitrogen vs EC).
4.  **Multicollinearity Check:** 
    *   Calculating Variance Inflation Factor (VIF) to detect and manage multicollinearity among predictor variables before fitting multiple regression models.
5.  **Multiple Linear Regression:** 
    *   Fitting Ordinary Least Squares (OLS) regression models using `statsmodels` to predict physiological responses (like `CAT` or `Chl_t`) based on a selected subset of environmental factors.

## Repository Structure

*   `analysis_notebook.ipynb`: The main Jupyter Notebook containing the Python code for data analysis.
*   `hypo_Log.xlsx`: The dataset for Hypogymnia.
*   `usnea_Log.xlsx`: The dataset for Usnea.
*   `*.png`: Generated figures from the analysis (e.g., `regression_Nitrogen_vs_EC1.png`, `regression_plot_multi_variable.png`).
*   `README.md`: Project documentation.

## How to Run

1. Clone this repository.
2. Ensure the required Python libraries are installed (`pip install pandas matplotlib seaborn scipy statsmodels openpyxl`).
3. Open the Jupyter Notebook.
4. Update the file paths in the Data Import section to point to your local copies of `hypo_Log.xlsx` and `usnea_Log.xlsx`.
5. Run the cells sequentially to reproduce the analysis and plots.
