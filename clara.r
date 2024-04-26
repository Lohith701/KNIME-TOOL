# Load the dataset
healthcare_data <- read.csv("C:/Users/LOHITH/Downloads/archive (2)/healthcare_dataset.csv")

# Select the categorical features for clustering
categorical_data <- healthcare_data[, c("Name", "Gender", "Blood.Type", "Medical.Condition", "Doctor", "Hospital", "Insurance.Provider", "Admission.Type", "Medication", "Test.Results")]

# Convert categorical variables to factors
categorical_data <- lapply(categorical_data, as.factor)

# Convert to dataframe
categorical_df <- as.data.frame(categorical_data)


library(cluster)
dissimilarity_matrix <- daisy(categorical_df, metric = "gower")

# Perform clustering using CLARA
clara_result <- clara(dissimilarity_matrix, k = 3)  # Assuming you want 3 clusters

# Extract cluster assignments
cluster_assignments <- clara_result$clustering

# Plot the data points with cluster colors
plot(categorical_df$Test.Results, col = cluster_assignments, pch = 19, 
     main = "CLARA Clustering Results", xlab = "Test Results", ylab = "Cluster Assignments")
