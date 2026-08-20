setwd("E:/data_analysis/Suman Dai Manuscript/Plots/")

library(ggplot2)
library(ggrepel)

library(readxl)
dataset <- read_excel("E:/data_analysis/Suman Dai Manuscript/usnea_chand_ghore.xlsx")
View(dataset[3:32])

ncol(dataset)

library(FactoMineR)
pca_all <- PCA(data.frame(dataset[3:32], row.names = NULL), graph = FALSE)

summary(pca_all)

library(factoextra)
eig.val <- get_eigenvalue(pca_all)
View(eig.val)
eig.val

# Convert eigenvalues to a data frame
eigenvalues_df <- data.frame(Eigenvalue = eig.val)

library(openxlsx)
# Save the data frame as an Excel file
write.xlsx(eigenvalues_df, file = "Eigen_usnea_allvariable.xlsx", rowNames=TRUE)

#Scree Plot
fviz_eig(pca_all, addlabels = TRUE, ylim = c(0, 50))

#PCA Variable
fviz_pca_var(pca_all, col.var = "cos2",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE # Avoid text overlapping
)

#PCA individual
fviz_pca_ind(pca_all, col.ind = "cos2",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE # Avoid text overlapping (slow if many points)
)

#Biplot
fviz_pca_biplot(pca_all, repel = TRUE, 
                col.var = "red",
                col.ind = "black"
)


#Biplot ellipses: Method 1 (BEST)
biplot <- fviz_pca_biplot(pca_all, 
                          col.ind = dataset$Site,
                          addEllipses = TRUE, label = "var",
                          col.var = "black", repel = TRUE,
                          legend.title = "Site")

biplot <- biplot + xlab("PC1 (38.1%)") + ylab("PC2 (10.5%)") #Modify Components Name
biplot <- biplot + theme(text = element_text(size = 14))  # Sets the font size to 12
biplot <- biplot + theme(axis.text = element_text(size = 14),axis.ticks = element_line(size = 0.5))
#biplot <- biplot + ggtitle("PCA Biplot-Usnea spp.")
biplot <- biplot + ggtitle(expression(paste("PCA Biplot-",italic(" Usnea "),"spp.")))
biplot <- biplot + theme_minimal() + theme_gray(base_size =16)
biplot <- biplot + theme(legend.position = "bottom")  # Moves the legend to the top of the plot
biplot <- biplot + theme(plot.title = element_text(size = 26))
biplot <- biplot + theme(plot.title = element_text(face = "bold"))

##Sets the point and arrow colors to blue and red, respectively
biplot <- biplot + scale_color_manual(values = c("blue","red"))
biplot <- biplot + theme(text = element_text(family = "Arial"))
#biplot <- biplot + theme(legend.text = element_text(face = "italic"))

#Display the Biplot
biplot

# Save biplot as PNG
ggsave("Usnea_biplot_sitewise.png", width = 10, height = 8, dpi = 1200)
