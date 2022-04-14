## QQ-Plot
Quantile-Quantile plot explains the variance at a chosen distribution, example the variance if the data were to be normally distributed. 

**Arguments**
  
  * **data:** input data

* **by:** feature name to be broken down by. If selecting a continuous feature, it will be grouped by 5 equal ranges, otherwise, all existing categories for a discrete feature. Default is NULL.

* **sampled_rows:** number of rows to sample if data has too many rows. Default is all rows, which means do not sample.

* **geom_qq_args:** a list of other arguments to geom_qq

* **geom_qq_line_args:** a list of other arguments to 

* **geom_qq_line:** title plot title

* **ggtheme:** complete ggplot2 themes. Default is *theme_gray*.

* **theme_config:** a list of configurations to be passed to *theme*
  
  * **nrow:** number of rows per page. Default is 3.

* **ncol:** number of columns per page. Default is 3.

* **parallel:** enable parallel? Default is FALSE.

```{r qq_plot}
qq_data <- chem[, c("Season", "Temp_in")] #plot basic qqplot, showing the 
plot_qq(qq_data, sampled_rows = 1000L) 
```

```{r qq_plot2}
# Step 2 log transform data to fit the regression line
log_qq_data <- update_columns(qq_data, c("Temp_in"), function(x) log(x + 1)) #update columns to long parameters giving a better "fit" line 
plot_qq(log_qq_data[,c("Season", "Temp_in")], sampled_rows = 1000L)

```