#Retrieves all the unique brands from product data
brand_vector <- function(product_data) {
  brand_vector <- c()
  
  # Iterate through product data to extract brand information
  for (i in 1:length(product_data)) {
    brand <- product_data[[i]]$features_map$Brand
    if (!is.null(brand)) {
      brand_vector <- append(brand_vector, brand)  # Append non-null brands to brand_vector
    }
  }
  
  return(unique(brand_vector))  # Return unique brands
}
