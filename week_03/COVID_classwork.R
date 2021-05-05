pacman::p_load(tidyverse)
covid_state_url <- "https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv"

covid_state_data <- 
  read_csv(covid_state_url) %>% 
  glimpse()

covid_state_data %>% 
  filter(state %in% c("Idaho","Utah")) %>% 
  ggplot(aes(x = date, y = cases)) +
  geom_line() +
  facet_grid(. ~ state)

covid_state_data %>% 
  filter(state %in% c("Idaho","Utah")) %>% 
  ggplot(aes(x = date, y = cases, color=state)) +
  geom_line()
