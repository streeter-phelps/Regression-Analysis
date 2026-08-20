#READ DATA FROM EXCEL
#Change the working directory to a different location.
setwd("E:/data_analysis/Suman Dai Manuscript/correlation_regression_dec18_2023/")

library(readxl)
dataset <- read_excel("E:/data_analysis/Suman Dai Manuscript/correlation_regression_dec18_2023/Usnea_Correlation.xlsx")
View(dataset)

ncol(dataset)

# PREPARATION FOR PCA-CORRELATIONS AND 0'S
View(dataset[2:18])


corrdata <- cor(data.frame(dataset[2:18]),method = "pearson")
corrdata
mean(corrdata)

# Convert correlation matrix to a data frame
corrdf <- data.frame(corrdata)


library(openxlsx)
#write.xlsx(corrdf, file = "Corrdata.xlsx", rowNames=FALSE)

#Plot Correlation Matrix
library(corrplot)

#create color vector
coll <- colorRampPalette(c("#7F0000","red","#FF7F00","yellow","white",
                          "cyan","#007fff","blue","#00007f"))

corrplot(corrdata, method = 'color',col = coll(21),order = 'alphabet') # colorful alphabet

#Know about unfamiliar function
?corrplot
help("corrplot")
help(png)
corrplot(corrdata) # by default, method = 'circle'

################################################################################

jpeg(filename = "Correlogram_Soil_1.jpg",
     width = 3600, height = 3600, units = "px", pointsize = 6,
     quality = 1200,bg = "white", res = 1200, family = "", restoreConsole = TRUE,
     type = c("windows", "cairo"),symbolfamily="default")

png(filename = "Correlogram_Usnea.png",
    width = 3600, height = 3600, units = "px", pointsize = 6,
    bg = "white", res = 1200, family = "sans", restoreConsole = TRUE,
    type = c("cairo"),symbolfamily="default")

corrplot(corrdata, method = 'circle',col = coll(21),type = 'upper',
         bg="white",title = expression(paste("Correlation - ",italic("Usnea "),"spp.")),
         cex.main=1.2,diag = TRUE,mar = c(0,0,1.5,0),addgrid.col = "grey",
         addCoef.col = NULL, tl.pos = 'lt',tl.cex = 0.9,tl.col = "black",
         tl.offset = 0.4,tl.srt = 90,cl.pos = 'r',cl.length = NULL,cl.cex = 0.8,
         cl.ratio = 0.15,cl.align.text = "c",number.cex = 0.6,number.font = 9,
         number.digits = 2,addshade = "negative",shade.lwd = 1,shade.col = "white",win.asp = 1)

# For order of variables insert (order = 'alphabet') into above code for corrplot

# Define a custom color palette: blue (low) → white (neutral) → red (high)
rwb_col <- colorRampPalette(c("blue", "white", "red"))

# Plot the correlogram with the new color palette
corrplot(corrdata, method = 'circle', col = rwb_col(21),
         bg = "white", title = expression(paste("Correlation - ", italic("Usnea "), "spp.")),
         cex.main = 1.2, diag = TRUE, mar = c(0, 0, 1.5, 0),
         addgrid.col = "grey", addCoef.col = NULL, tl.pos = 'lt', 
         tl.cex = 0.9, tl.col = "black", tl.offset = 0.4, tl.srt = 90, 
         cl.pos = 'r', cl.length = NULL, cl.cex = 0.8, cl.ratio = 0.15, 
         cl.align.text = "c", number.cex = 0.6, number.font = 9, 
         number.digits = 2, addshade = "negative", 
         shade.lwd = 1, shade.col = "white", win.asp = 1)


dev.off()

corrplot(corrdata, method = 'circle',col = coll(21),
         bg="white",title = expression(paste("Correlation - ",italic("Hypotrachyna "),"spp.")),
         cex.main=1.2,diag = TRUE,mar = c(0,0,1.5,0),addgrid.col = "grey",
         addCoef.col = NULL,outline = 'black',order = 'alphabet', tl.pos = 'lt',tl.cex = 0.9,tl.col = "black",
         tl.offset = 0.4,tl.srt = 90,cl.pos = 'r',cl.length = NULL,cl.cex = 0.8,
         cl.ratio = 0.15,cl.align.text = "c",number.cex = 0.6,number.font = 9,
         number.digits = 2,addshade = "negative",shade.lwd = 1,shade.col = "white",win.asp = 1)