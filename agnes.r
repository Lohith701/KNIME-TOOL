
# Load the dataset
healthcare_data <- read.csv("C:/Users/LOHITH/Downloads/archive (2)/healthcare_dataset.csv")

# Select the categorical features for clustering
categorical_data <- healthcare_data[, c("Name", "Gender", "Blood.Type", "Medical.Condition", "Doctor", "Hospital", "Insurance.Provider", "Admission.Type", "Medication", "Test.Results")]

# Convert categorical variables to factors
categorical_data <- lapply(categorical_data, as.factor)

# Converting into dataframe
categorical_df <- as.data.frame(categorical_data)


library(cluster)
dissimilarity_matrix <- daisy(categorical_df, metric = "gower")

# Perform hierarchical clustering using AGNES
agnes_result <- agnes(dissimilarity_matrix)

# Plot the dendrogram
plot(agnes_result, main = "Dendrogram: Hierarchical Clustering (AGNES)")
