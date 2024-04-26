# Read the dataset
data <- read.csv("C:/Users/LOHITH/Downloads/archive (2)/healthcare_dataset.csv")

# Select categorical features for clustering
categorical <- data[, c("Name", "Gender", "Blood.Type", "Medical.Condition", "Doctor", "Hospital", "Insurance.Provider", "Admission.Type", "Medication", "Test.Results")]

# Convert categorical variables to factors
categorical <- lapply(categorical, as.factor)

# Convert to dataframe
categorical_df <- as.data.frame(categorical)

# Compute dissimilarity matrix using Gower's distance
library(cluster)
diss_matrix <- daisy(categorical_df, metric = "gower")

# Perform hierarchical clustering
hclust_res <- hclust(as.dist(diss_matrix))

# Plot dendrogram
plot(hclust_res, main = "Dendrogram for Healthcare Data", xlab = "Observations", ylab = "Distance")
