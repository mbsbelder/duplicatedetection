#Compares if two products are from different brands
different_brand_comparison <- function(prod_i, prod_j, BrandVec) {
  # Retrieve brand names for products i and j
  i_brand <- brand_name(prod_i, BrandVec)
  j_brand <- brand_name(prod_j, BrandVec)
  
  # Check for null brand names
  if (is.null(i_brand) | is.null(j_brand)) {
    return(FALSE)  # If any brand name is null, return False
  } else {
    if (i_brand != j_brand) {
      return(TRUE)  # If brands are different, return True
    } else {
      return(FALSE)  # If brands are the same, return False
    }
  }
}
