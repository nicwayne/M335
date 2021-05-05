#install.packages('pacman')
#pacman::p_load(tidyverse)
#p_load loads tidyverse as the code below does as well
#install.packages('tidyverse')
#library(tidyverse)

#To access the github data, raw has to be included
#On github, you need to find the raw button and copy that link
#You can also stick a /?raw=true at the end of the normal github link as well
covid_url <- "https://raw.githubusercontent.com/nytimes/covid-19-data/master/us.csv"

covid_data <- 
  read_csv(covid_url) %>% 
  glimpse()

covid_data %>% 
  ggplot(aes(x = date, y = cases)) +
  geom_line()
  

covid_data %>% 
  mutate(daily_new_cases = cases - lag(cases)) %>% 
  ggplot() +
  geom_line(aes(x = date, y = daily_new_cases))

glimpse(covid_data)

daily_sum_data <- covid_data %>% 
  mutate(daily_new_cases = cases - lag(cases))

daily_sum_data %>% 
  ggplot() +
  aes(x=date, y=daily_new_cases)+
  geom_line()

mpg %>% glimpse()
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = class)

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")
