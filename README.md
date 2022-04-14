# DataExplorer
Group 2 repository for group project. 

**R package:** DataExplorer

Boxuan Cui (2020). DataExplorer: Automate Data Exploration and Treatment. R package version 0.8.2. https://cran.r-project.org/web/packages/DataExplorer/index.html

**Group members:** Cynthia Petrossian, Sally Heo, Tadeo Zuniga, Heather Carstensen.

**Group member contributions:**

* Cynthia Petrossian: Introduction, plot_histogram, plot_density
* Sally Heo: plot_correlation, create_report, configure_report
* Tadeo Zuniga:
* Heather Carstensen: plot_bar and plot_boxplot functions

DataExplorer is a package designed to assist users in the initial exploration of their data set. With very simple lines of code, the user can clean up their data, visualize values and distributions for each variable, and examine how variables relate to each other. The goal of this package is to allow the user to easily identify patterns within their data without spending time coding individual plots, and so is ideal for Exploratory Data Analysis (EDA). This package utilizes other useful data processing and visualization packages, such as ggplot2, data.table, reshape2, scales, and gridExtra. 

**Contents:** In our DataExplorer folder, there are three subfolders (data, scripts, and output) and a README.md file. 
  * [data:](https://github.com/Biol551-CSUN/DataExplorer/tree/main/DataExplorer/data) This data subfolder contains the dataset used to introduce our R package, DataExplorer. 
    * [Chemical Data](https://github.com/Biol551-CSUN/DataExplorer/blob/main/DataExplorer/data/chemicaldata_maunalua.csv) 
    * [Chem Data Dictionary](https://github.com/Biol551-CSUN/DataExplorer/blob/main/DataExplorer/data/chem_data_dictionary.csv)
  * [script:](https://github.com/Biol551-CSUN/DataExplorer/tree/main/DataExplorer/script) This subfolder contains the scripts used to code the DataExplorer functions.
  * [output:](https://github.com/Biol551-CSUN/DataExplorer/tree/main/DataExplorer/output) This subfolder contains the output plots generated from our codes. 

See these links for more information about the DataExplorer package:
* [Package document](https://cran.r-project.org/web/packages/DataExplorer/DataExplorer.pdf)
* [CRAN page](https://cran.r-project.org/web/packages/DataExplorer/index.html)
* [Introductory Vignette](https://cran.r-project.org/web/packages/DataExplorer/vignettes/dataexplorer-intro.html#bar-charts) This vignette was written by the creator of the DataExplorer package, Boxuan Cui, and includes examples of the package functions. 
* [GitHub page](https://github.com/boxuancui/DataExplorer)
* [A list of articles that discuss DataExplorer](https://github.com/boxuancui/DataExplorer/wiki/Articles)

For this project, we are focusing on the DataExplorer functions that allow for data visualization. The functions we will cover are:
* **plot_bar,** which uses bar charts to show value distributions of discrete variables. 
* **plot_boxplot,** which uses boxplots to examine the distributions of continuous variables when grouped by the values of a chosen discrete variable.  
* **plot_correlation,** creates a correlation heatmap for discrete functions and allows us to analyze correlation in our data
* **create_report,** this is a very important function that creates a data profiling report of our data and makes it easier for us to intepret, analyze, and understand our data
* **configure_report,** allows us to customize and edit each individual section of the data profiling report from the create_report function. 

