# Pulling it all together - final project

dat_sunday2 <- read.csv('data/gapminder.csv', header=TRUE)

my3countries <- subset(dat_sunday2, dat_sunday2$country == "Libya" | dat_sunday2$country == "Egypt" | dat_sunday2$country == "France")

libya <- subset(dat_sunday2, dat_sunday2$country == "Libya")
egypt <- subset(dat_sunday2, dat_sunday2$country == "Egypt")
france <- subset(dat_sunday2, dat_sunday2$country == "France")

plot(france$year, france$gdpPercap, xlab="Year", ylab="GDP Per Capita", main="France", sub="Steadily increasing GDP in France.")

plot(libya$year, libya$gdpPercap, xlab="Year", ylab="GDP Per Capita", main="Libya", sub="Libya has a roller-coaster GDP with peak before 1980.")

plot(egypt$year, egypt$gdpPercap, xlab="Year", ylab="GDP Per Capita", main="Egypt", sub="Egypt has increasing GDP overall but pauses before/around 1990.")