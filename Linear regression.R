#Simple Linear Regression Model

#Import the dataset
library(readxl)
dataset <- read_excel("D:/R/Dolpa Manuscript/dataRegression.xlsx")
dataset
print(dataset,n=816)

cor.test(dataset$Usnea,dataset$Ramalina)


#Explore the dataset
head(dataset)
summary(dataset)

#Fit the linear regression model
model <- lm(Usnea ~ Ramalina, data = dataset)
model

# Extract regression information
coefficients <- coef(model)
equation <- paste0("y = ", round(coefficients[1], 2), " + ", round(coefficients[2], 2), "x")
equation
r_squared <- round(summary(model)$r.squared, 3)
r_squared
p_value <- format(summary(model)$coefficients[2, 4], digits = 5)
p_value
pearson_r <- format(cor(dataset$Ramalina,dataset$Usnea,method = "pearson"),digits = 3) 
pearson_r
rserror <- format(summary(model)$sigma,digits = 4)  
rserror
rssquare <- format(sum(summary(model)$residuals^2),digits = 4)
rssquare

#Analyze the model
summary(model)
coefficients(model)
attributes(model)
model$residuals
hist(model$residuals)
hist(dataset$Usnea)

png(filename = "Correlogram_Soil.png",
    width = 3600, height = 3600, units = "px", pointsize = 7,
    bg = "white", res = 1200, family = "sans", restoreConsole = TRUE,
    type = c("cairo-png"),symbolfamily="default")


# Step 3: Create a scatter plot with the regression line
library(ggplot2)
p <- ggplot(dataset, aes(Ramalina, Usnea)) +geom_point(col="maroon",size=3)
p <- p + geom_smooth(method="lm",stat = "smooth",col="black",level=0.95,se=TRUE,size=2)
p <- p + ggtitle("Linear Regression") + xlab("R. intermedia") + ylab("U. cornuta")
p <- p + theme(plot.title = element_text(size = rel(2),face = "bold",colour = "black")) #Font size of plot title
p <- p + theme(axis.ticks = element_line(size = 2))
p <- p + theme(axis.text = element_text(size = 14,colour = "black")) # Font size and color of axis text (0,1,2,.)
p <- p + theme(axis.title = element_text(size = rel(2),face = "italic",colour = "black")) # Font size of axis titles
p

#Change font style
windowsFonts(a=windowsFont("Arial"))
p <- p + theme(text = element_text(family = "a"))
p

# Create the regression information string
info <- paste0("Equation: ", equation, "\n",
               "R-squared: ", r_squared, "\n",
               "p-value: ", p_value,"\n",
               "Pearson's r: ",pearson_r,"\n",
               "Residual Sum of Squares: ", rssquare,"\n",
               "Residual Standard Error: ", rserror)

# Add the regression information as a text annotation
p <- p + geom_text(x = 3.5, y = 0, label = info,hjust = 0,vjust = 0,size = 5, color = "black")
p


# Save biplot as PNG
ggsave("Regress1.png", device= "png",width = 10, height = 8, dpi = 600)
dev.off()


?theme()

?geom_point()
?geom_smooth()