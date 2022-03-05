# List if Uppercase and Lowercase alphabets
alphabets <-  c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z")

# List of numbers
numbers <-  c("1", "2", "3", "4", "5", "6", "7", "8", "9", "0")

# List of special characters
specialChars <- c('~', ':', "'", '+', '[', '@', '^', '{', '%', '(', '-', '"', '*', '|', ',', '&', '<', '`', '}', '.', '_', '=', ']', '!', '>', ';', '?', '#', '$', ')', '/') 

# Generate password
genPassword <- function(nAlphabets, nNumbers, nSpecialChars) {
  #nNumbers = 0.25 * nAlphabets
  #nSpecialChars = 0.2 * nAlphabets
  #nAlphabetsAdj = nAlphabets - (nNumbers + nSpecialChars)
  randomAlphabets <- sample(alphabets, nAlphabets, replace = T)
  randomNumbers <- sample(numbers, nNumbers, replace = T)
  randomSpecialChars <- sample(specialChars, nSpecialChars, replace = T)
  vectorPassword <- c(randomAlphabets, randomNumbers, randomSpecialChars)
  shuffleVectorPassword <- sample(vectorPassword)
  password <- paste(shuffleVectorPassword, collapse = "")
  return(password)
}