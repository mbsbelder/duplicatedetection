#Checks if the shop is the same for product i and product j
same_shop <- function(prod_i, prod_j) {
  if (prod_i[["shop"]] == prod_j[["shop"]]) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}
