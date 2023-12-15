# Duplicate Detection for TV Data

This code performs Locality-Sensitive Hashing (LSH) and MinHashing on TV dataset to identify potential duplicates, employing Jaro-Winkler and Sørensen-Dice similarity measures. The process is divided into separate functions followed by a main block for training and evaluation.

## Functions Overview

### `get_tvtitles`

Extracts all TV titles in one list.

### `brand_vector`

Gets all the brands from product data.

### `get_binary_vector`

Creates a uniform vector representation for each product based on titles and brands.

### `hash`

Computes hash values used in MinHashing.

### `min_hashing`

Applies MinHashing to generate a signature matrix.

### `lsh`

Local Sensitivity Hashing function to identify potential duplicate products based on signature matrices.

### `bootstrap_data`

Generates bootstrap data for training purposes.

### `evaluation_matrix`

Constructs TP, NP, FP, FN values for evaluation.

### `evaluation`

Computes evaluation values such as Pair Quality (PQ), Pair Completeness (PC), F1*-Measure, and Fraction of Comparisons.

### `estimate_algorithm`

Executes the algorithm, performing LSH and MSM on the TV dataset, saving training results, and conducting training/test split.

## Main Functionality

### Running Functions

The code runs `min_hashing`, `lsh`, and other functions necessary for preprocessing and preparing the TV dataset for training.

### Main for Training

The primary section focuses on training. It starts with grid search (`gridsearchvaluescoef`) for optimal parameters and utilizes bootstrapping for data splitting (`TVData_BS_complete`). The code saves the training results and runs evaluations (`total_evaluation_Averaged`) for performance assessment.

### Testing for Evaluation

After training, the code evaluates the model's performance on the test set using predefined optimal parameters. This section includes drawing scatterplots using `ggplot2` to visualize the evaluation metrics.

## Authors
This code is a collaboration between:
- Bas Belder
- Douwe Terlouw (codebuddy for this project)
