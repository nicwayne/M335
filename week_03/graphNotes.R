library(tidyverse)
covid_state_data %>% 
  filter(state %in% c("Utah","Idaho","Colorado")) %>% 
  ggplot(aes(x = date, y = cases, color = state)) +
  geom_line()

top_5_states <- 
  covid_state_data %>% 
  filter(date == max(date)) %>% 
  select(state,cases) %>% 
  arrange(desc(cases)) %>% 
  slice(1:5) %>% 
  pull(state) %>%
  glimpse()

covid_state_data %>% 
  filter(state %in% top_5_states) %>% 
  ggplot(aes(x = date, y = cases, color = state)) +
  geom_line()

#Can we link the legend so it's not in alphabetical?
covid_state_data %>% 
  filter(state %in% top_5_states) %>% 
  ggplot(aes(x = date, y = cases, color = fct_relevel(state,top_5_states))) +
  geom_line()

covid_state_data %>% 
  filter(state %in% top_5_states) %>% 
  ggplot(aes(x = date, y = cases, color = factor(state,top_5_states))) +
  geom_line() +
  labs(color = "State")

covid_state_data %>% 
  filter(state %in% top_5_states) %>% 
  ggplot(aes(x = date, y = cases, color = fct_relevel(state,top_5_states))) +
  geom_line() +
  labs(color = "State",
       x="Date",
       y="Cases")

covid_state_data %>% 
  filter(state %in% top_5_states) %>% 
  ggplot(aes(x = date, y = cases, color = fct_relevel(state,top_5_states))) +
  geom_line() +
  labs(color = "State") +
  theme_bw()

covid_state_data %>% 
  filter(state %in% c("Utah","Idaho","Colorado")) %>% 
  ggplot(aes(x = date, y = cases, color = state)) +
  geom_line() +
  coord_flip()

covid_state_data %>% glimpse()

covid_state_data %>% 
  filter(state %in% c("Utah","Idaho","Colorado")) %>% 
  ggplot(aes(x = date, y = as.integer(cases), color = state)) +
  geom_line() +
  coord_flip()

#options(scipen=999)
covid_state_data %>% 
  mutate(int_cases = as.integer(cases)) %>% 
  filter(state %in% c("Utah","Idaho","Colorado")) %>% 
  ggplot(aes(x = date, y = int_cases, color = state)) +
  geom_line() +
  coord_flip()
  
covid_state_data %>% 
  filter(state %in% c("Utah","Idaho","Colorado")) %>% 
  ggplot(aes(x = date, y = cases, color = state)) +
  geom_line() +
  scale_y_log10()

covid_state_data %>% 
  filter(state %in% c("Utah","Idaho","Colorado")) %>% 
  ggplot() +
  geom_point(aes(x = date, y = cases, color = state)) +
  geom_line(aes(x = date, y = cases, group = state))
  
covid_state_data %>% 
  filter(state %in% c("Utah","Idaho","Colorado")) %>% 
  ggplot() +
  geom_line(aes(x = date, y = cases, group = state)) +
  geom_point(aes(x = date, y = cases, color = state))
  

covid_state_data %>% 
  filter(state %in% c("Utah","Idaho","Colorado")) %>% 
  ggplot(aes(x = date, y = cases, color = state)) +
  geom_point(aes(color = state)) +
  geom_line()

covid_state_data %>% 
  filter(state %in% c("Utah","Idaho","Colorado")) %>% 
  ggplot(aes(x = date, y = cases, group = state)) +
  geom_point(aes(color = state)) +
  geom_line()

