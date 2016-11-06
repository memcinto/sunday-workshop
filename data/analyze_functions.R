# Start working with the gapminder data again

dat_sunday <- read.csv('data/gapminder.csv', header=TRUE)

head(dat_sunday)
# shows country, year, pop, continent, lifeExp, gdpPercap

#summary shows how many of each Factor, plus stats for the numerical columns
summary(dat_sunday)

#str to see structure
str(dat_sunday)

# write function that takes country as argument, 
# shows min max and mean of lifeExp for that country
# first subset the data

country_name <- subset(dat_sunday, dat_sunday$country == "Uganda")

summary(country_name)

# calculate mean, min and max of lifeExp
mean(country_name$lifeExp)
min(country_name$lifeExp)
max(country_name$lifeExp)

analyze_country <- function(countryname) {
  # first create a subset of the data that only contains
  # that one country passed in by name
  one_country <- subset(dat_sunday, dat_sunday$country == countryname)
  #print(mean(one_country$lifeExp))
  #print(min(one_country$lifeExp))
  #print(max(one_country$lifeExp))
  # we want labels for the output
  output1 <- c("MeanLifeExp" = mean(one_country$lifeExp), "MinLifeExp" = min(one_country$lifeExp), "MaxLifeExp" = max(one_country$lifeExp))
  return(output1)
}

analyze_country("Uganda")
analyze_country("France")
analyze_country("Libya")

# modify the function to generate a plot with "Year" 
# on x-axis and "LifeExp" on y-axis.
# plus, label the axes.

plot_country <- function(countryname2) {
  # first create a subset of the data that only contains
  # that one country passed in by name
  one_country_plot <- subset(dat_sunday, dat_sunday$country == countryname2)
  # then plot year against life expectancy
  plot(one_country_plot$year, one_country_plot$lifeExp, xlab="Year", ylab="Life Expectancy", main=countryname2)
}

plot_country("Libya")

best_practice <- list("write","programs","for","people","not","computers")
str(best_practice)

best_practice_fun <- function(some_argument) {
 for (w in best_practice) {
   print(w)
 }
}

best_practice_fun2 <- function(some_argument) {
  for (w in best_practice) {
    print(w)
  }
}

best_practice_fun2(best_practice)

# Generate a file that contains years "1952" and "1997" 
# and name it as gapminder_52_97
# and another file that contains years "1967" and "2007"
# and name it as gapminder_67_07

gapminder_52_97 <- subset(dat_sunday, dat_sunday$year == 1952 | dat_sunday$year == 1997)

gapminder_67_07 <- subset(dat_sunday, dat_sunday$year == 1967 | dat_sunday$year == 2007)

str(gapminder_52_97)

# read.csv to read, write.csv to write a file to disk

write.csv(file = "data/gapminder_52_97.csv", gapminder_52_97, row.names = FALSE, quote = FALSE)
write.csv(file = "data/gapminder_67_07.csv", gapminder_67_07, row.names = FALSE, quote = FALSE)

# list files matching a pattern in a directory
list.files(path = "data", pattern = ".csv", full.names = TRUE)

# write a for loop to go through all three csv files
# and print each filename on a different line

listmyfiles <- list.files(path = "data", pattern = ".csv", full.names = TRUE)

loop_files <- function() {
  for (fff in listmyfiles) {
    print(fff)
  }
}

loop_files()

# Using the previous function for analyzing countries
# print out mean min max for all three datasets

analyze_all <- function(pattern, countryname) {
  filenames <- list.files(path = "data", pattern = pattern, full.names = TRUE)
  for (f in filenames) {
    # make a data.frame from the file
    onefile <- read.csv(f, header=TRUE)
    # get a subset of the data based on one country
    one_country2 <- subset(onefile, onefile$country == countryname)
    output1 <- c("MeanLifeExp" = mean(one_country2$lifeExp), "MinLifeExp" = min(one_country2$lifeExp), "MaxLifeExp" = max(one_country2$lifeExp))
    print(f)
    print(output1)
  }
}

analyze_all(".csv", "Uganda")
