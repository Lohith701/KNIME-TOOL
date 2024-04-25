# Load the dataset
healthcare_data <- read.csv("C:/Users/LOHITH/Downloads/archive (2)/healthcare_dataset.csv")

# Select the categorical features for clustering
categorical_data <- healthcare_data[, c("Name", "Gender", "Blood.Type", "Medical.Condition", "Doctor", "Hospital", "Insurance.Provider", "Admission.Type", "Medication", "Test.Results")]

# Convert categorical variables to factors
categorical_data <- lapply(categorical_data, as.factor)

# Convert to dataframe
categorical_df <- as.data.frame(categorical_data)

# Compute dissimilarity matrix using Gower's distance
library(cluster)
dissimilarity_matrix <- daisy(categorical_df, metric = "gower")

# Perform hierarchical clustering
hclust_result <- hclust(as.dist(dissimilarity_matrix))

# Plot dendrogram
plot(hclust_result, main = "Dendrogram: Hierarchical Clustering", xlab = "Observations", ylab = "Distance")
`

