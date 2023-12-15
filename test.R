# Calculate optimal values for gamma, mu, epsilon and apply on test set
gamma <- 0.7
mu <- 0.7
epsilon <- 1

# Apply algorithm to test set for evaluation  
total_evaluation_Averaged <- NULL

for (i in 1:count_bootstraps) {
  TVData_BSTest <- TVData_BSTest_all[[i]]
  writeLines(paste("BOOTSTRAP", i, "on", length(TVData_BSTest), "prods"))
  
  BrandVec <- brand_vector(TVData_BSTest)
  hashnumber <- as.integer(length(TVData_BSTest) * 0.5)
  total_evaluation_BS <- estimate_algorithm(TVData_BSTest)
  
  if (is.null(total_evaluation_Averaged)) {
    total_evaluation_Averaged <- total_evaluation_BS$Evaluation
  } else {
    total_evaluation_Averaged <- total_evaluation_Averaged + total_evaluation_BS$Evaluation
  }
}

total_evaluation_Averaged <- total_evaluation_Averaged / count_bootstraps
print("Last evaluation ")
print(total_evaluation_Averaged)

# Draw ggplot2 scatterplot with smooth curve
df <- as.data.frame(total_evaluation_Averaged)

names(df) <- c("Pair Quality", 'Pair Completeness', 'F1*-Measure', 
               'Fraction of Comparisons', 'F1-Measure')

pq <- ggplot(df, aes(`Fraction of Comparisons`, `Pair Quality`)) + 
  geom_line() +
  theme_classic()

pc <- ggplot(df, aes(`Fraction of Comparisons`, `Pair Completeness`)) + 
  geom_line() +
  theme_classic()

f1s <- ggplot(df, aes(`Fraction of Comparisons`, `F1*-Measure`)) + 
  geom_line() +
  theme_classic()

f1 <- ggplot(df, aes(`Fraction of Comparisons`, `F1-Measure`)) + 
  geom_line() +
  theme_classic()
