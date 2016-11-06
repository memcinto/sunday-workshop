# Pulling it all together - final project

dat_sunday2 <- read.csv('data/gapminder.csv', header=TRUE)

my3countries <- subset(dat_sunday2, dat_sunday2$country == "Libya" | dat_sunday2$country == "Egypt" | dat_sunday2$country == "France")

libya <- subset(dat_sunday2, dat_sunday2$country == "Libya")
egypt <- subset(dat_sunday2, dat_sunday2$country == "Egypt")
france <- subset(dat_sunday2, dat_sunday2$country == "France")

plot(france$year, france$gdpPercap, xlab="Year", ylab="GDP Per Capita", main="France", sub="Steadily increasing GDP in France.")

plot(libya$year, libya$gdpPercap, xlab="Year", ylab="GDP Per Capita", main="Libya", sub="Libya has a roller-coaster GDP with peak before 1980.")

plot(egypt$year, egypt$gdpPercap, xlab="Year", ylab="GDP Per Capita", main="Egypt", sub="Egypt has increasing GDP overall but pauses before/around 1990.")

# agg_data_by_continent <- aggregate(dat_sunday2, list(Continent = dat_sunday2$continent), mean)

asia_data <- subset(dat_sunday2, dat_sunday2$continent == "Asia")
africa_data <- subset(dat_sunday2, dat_sunday2$continent == "Africa")
europe_data <- subset(dat_sunday2, dat_sunday2$continent == "Europe")
oceania_data <- subset(dat_sunday2, dat_sunday2$continent == "Oceania")
americas_data <- subset(dat_sunday2, dat_sunday2$continent == "Americas")

summary(asia_data)

loop_thru_continents <- function() {
  continents <- list("Asia","Africa","Europe","Oceania","Americas")
  for (continent_one in continents) {
    this_continent <- subset(dat_sunday2, dat_sunday2$continent == continent_one)
    output3 <- c("MeanLifeExp" = mean(this_continent$lifeExp), "MinLifeExp" = min(this_continent$lifeExp), "MaxLifeExp" = max(this_continent$lifeExp))
    print(continent_one)
    print(output3)
  }
}

loop_thru_continents()