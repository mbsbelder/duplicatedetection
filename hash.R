#Computes hash values using parameters a, b, r, and a prime number
hash <- function(a, b, r, prime_number) {
  return((a * r + b) %% prime_number)
}
