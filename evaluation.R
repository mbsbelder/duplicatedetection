#Computes evaluation values based on input parameters
evaluation <- function(evaluation_matrix, B_lsh, n, band) {
  if (B_lsh == TRUE) {
    PQ = (evaluation_matrix$TP) / (n * band)
  } else {
    PQ = (evaluation_matrix$TP) / (evaluation_matrix$TP + evaluation_matrix$FP)
  }
  
  PC = evaluation_matrix$TP / (evaluation_matrix$TP + evaluation_matrix$FN)
  F1 = 2 / ((1 / PQ) + (1 / PC))
  FC = band / hashnumber  # Assuming hashnumber variable is defined somewhere
  
  return(list('PQ' = PQ, 'PC' = PC, 'F1' = F1, 'FractionComp' = FC))
}
