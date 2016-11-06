# convert fahrenheit to kelvin
fah_to_kelvin <- function(temp) {
  kelvin <- ((temp - 32) * (5 / 9)) + 273.15
  return(kelvin)
}

# convert kelvin to celsius
kel_to_cel <- function(temp) {
  celsius <- temp - 273.15
  return(celsius)
}

# Exercise: write a function to convert Fahrenheit to Celsius

fah_to_celsius <- function(temp) {
  kelvin <- ((temp - 32) * (5 / 9)) + 273.15
  celsius <- kelvin - 273.15
  return(celsius)
}

# another way to do this
fah_to_celsius2 <- function(temp) {
  temp_k <- fah_to_kelvin(temp)
  result <- kel_to_cel(temp_k)
  return(result)
}