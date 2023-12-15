# Define required packages and constants
library(rjson)  # Package to import data
library(stringr)  # Package to manipulate strings
library(ggplot2)  # Package for plotting

# Constants and initializations
prime_number <- 1637
size_substring <- 10
count_bootstraps <- 1

# Importing data and separating shops
TVMergedData <- fromJSON(file = "TVs-all-merged.json") 
TVData <- list()

counter <- 1
for (i in 1:length(TVMergedData)) {
  temp <- length(TVMergedData[[i]])
  if (temp != 1) {
    for (j in 1:temp) {
      TVData[counter + j - 1] <- TVMergedData[[i]][j]
    }
    counter <- counter + temp
  } else {
    TVData[counter] <- TVMergedData[[i]]
    counter <- counter + 1
  }
}

remove(TVMergedData, i, j, temp, counter)

# Generate GridSearch plain
gammavec <- seq(0.4, 0.7, by = 0.1)
muvec <- seq(0.4, 0.7, by = 0.1)
epsilonvec <- seq(0.8, 1.2, by = 0.1)
gridsearchvaluescoef <- matrix(
  data = NA,
  nrow = (length(gammavec) * length(muvec) * length(epsilonvec)),
  ncol = 3
)
counter <- 1

for (g in 1:length(gammavec)) {
  for (m in 1:length(muvec)) {
    for (e in 1:length(epsilonvec)) {
      gridsearchvaluescoef[counter, ] <- c(gammavec[g], muvec[m], epsilonvec[e])
      counter <- counter + 1
    }
  }
}

remove(e, epsilonvec, g, gammavec, m, muvec, counter)

# Apply algorithm to train set to find optimal parameters
TVData_BSTest_all <- list()

for (g in 1:dim(gridsearchvaluescoef)[1]) {
  gamma <- gridsearchvaluescoef[g, 1]
  print(gamma)
  mu <- gridsearchvaluescoef[g, 2]
  print(mu)
  epsilon <- gridsearchvaluescoef[g, 3]
  print(epsilon)
  
  for (i in 1:count_bootstraps) {
    TVData_BS_complete <- bootstrap_data(TVData)
    TVData_BSTrain <- TVData_BS_complete$TVData_BS_Train
    TVData_BSTest_all[[length(TVData_BSTest_all) + 1]] <- TVData_BS_complete$TVData_BS_Test  # safe test set for next step
    
    writeLines(paste("BOOTSTRAP", i, "on", length(TVData_BSTrain), "prods"))
    BrandVec <- brand_vector(TVData_BSTrain)
    hashnumber <- as.integer(length(TVData_BSTrain) * 0.5)
    total_evaluation_BS <- estimate_algorithm(TVData_BSTrain)
    
    total_evaluation_Averaged_Train <- total_evaluation_BS$Evaluation
    print("total evaluation is now ")
    print(total_evaluation_Averaged_Train)
  }
}