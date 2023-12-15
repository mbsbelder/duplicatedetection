# Duplicate Detection for TV Data

This code performs Locality-Sensitive Hashing (LSH) and MinHashing on TV dataset to identify potential duplicates, employing Jaro-Winkler and Sørensen-Dice similarity measures. The process is divided into separate functions followed by a main block for training and evaluation.

## Authors
This code is a collaboration between:
- Bas Belder
- Douwe Terlouw (codebuddy for this project)

## Functions Overview
### adjust_name
Description: Contains functions to adjust or normalize names.
Usage: Used to standardize and clean the product names for uniformity.

### band_sizes
Description: Computes the number of bands used in Local Sensitivity Hashing (LSH).
Usage: Determines the number of bands required for effective LSH based on input parameters.

### bootstrap_data
Description: Generates bootstrap data from the TV dataset for training purposes.
Usage: Provides a method to create multiple training datasets by resampling from the original data.

### brand_name
Description: Includes functions related to brand name extraction and processing.
Usage: Facilitates the extraction and management of brand names from product data.

### calc_sim_jw
Description: Computes Jaro-Winkler similarity between strings.
Usage: Calculates similarity scores using the Jaro-Winkler metric for comparing strings.

### calc_sim_sd
Description: Computes Sørensen-Dice similarity between strings.
Usage: Calculates similarity scores using the Sørensen-Dice metric for comparing strings.

### common_prefix_length
Description: Calculates the length of the common prefix between two strings.
Usage: Helps in determining the similarity between strings by measuring the length of their common prefix.

### different_brand_comparison
Description: Compares brand names to identify differences.
Usage: Helps in assessing discrepancies or variations in brand names within the dataset.

### duplicate_selection
Description: Selects duplicate pairs based on specific similarity measures.
Usage: Identifies and selects potential duplicate pairs using defined similarity thresholds.

### evaluation
Description: Computes evaluation metrics such as Pair Quality (PQ), Pair Completeness (PC), and F1-Measure.
Usage: Aids in evaluating the performance of the deduplication algorithm by calculating various metrics.

### evaluation_matrix
Description: Constructs matrices for True Positive (TP), False Positive (FP), True Negative (TN), and False Negative (FN) values.
Usage: Generates matrices to facilitate the computation of evaluation metrics.

### extract_modelwords
Description: Extracts model-related words from product titles.
Usage: Isolates and extracts words related to models or specific product identifiers from the product titles.

### get_binary_vector
Description: Creates binary vectors as a uniform representation of each product.
Usage: Transforms product data into a binary matrix format for further analysis and processing.

### get_tvtitles
Description: Retrieves and organizes TV titles from the dataset.
Usage: Collects and manages the titles of TV products for analysis and comparison.

### hash
Description: Implements hashing techniques used in the data deduplication process.
Usage: Generates hash values or codes for efficient comparison and identification of similar data items.

### lsh
Description: Contains the Local Sensitivity Hashing (LSH) algorithm.
Usage: Divides data into bands for comparison, identifying potential duplicates efficiently in large datasets.

### main
Description: The main execution file orchestrating the entire data deduplication process.
Usage: Integrates various functions and algorithms to perform the deduplication on TV dataset, calling necessary components in a cohesive sequence.

### min_hashing
Description: Implements MinHashing algorithm for reducing dimensionality.
Usage: Reduces the size of the data representation while preserving similarities for efficient comparison.

### msm
Description: Provides functions for computing similarity measures (MSM).
Usage: Calculates similarity scores using various metrics (Sorensen-Dice, Jaro-Winkler) to determine similarities between data items.

### percentage_model_words
Description: Computes the percentage of model-related words in product titles.
Usage: Determines the prevalence of model-specific words in the titles, aiding in similarity comparisons.

### same_shop
Description: Identifies if two products belong to the same shop or vendor.
Usage: Helps in distinguishing products based on their shop or vendor, reducing false positives in deduplication.

### split_string
Description: Contains functions to split strings into components.
Usage: Breaks down strings into segments or words, facilitating comparison and analysis.

### test
Description: Holds test cases or testing procedures for functions.
Usage: Used to verify the correctness and functionality of individual functions or algorithms.
