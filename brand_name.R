#Retrieves the brand name for a product
brand_name <- function(prod, brand_vector) {
  # Get the brand name from the product's features map
  brand_name <- prod$features_map$Brand
  
  # If the brand name is null, attempt to find it in the title using a list of brand names
  if (is.null(brand_name)) {
    title <- prod$title 
    words_list <- str_split(title, " ")
    
    # Iterate through words in the title to find a match in the brand vector
    for (w in words_list[[1]]) {
      find_brand <- match(w, brand_vector)
      if (!is.na(find_brand)) {
        brand_name <- brand_vector[find_brand]
        break  # Exit loop if a match is found
      }
    }
  }
  
  # Adjust the retrieved brand name if it's not null
  if (!is.null(brand_name)) {
    brand_name <- adjust_name(brand_name)
  }
  
  return(brand_name)
}
