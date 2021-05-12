library(tidyverse)
library(dplyr)

iris %>% 
  arrange(Sepal.Length) %>% 
  slice(1, n())



iris %>% 
  filter(Species %in% c("setosa","versicolor")) %>% 
  group_by(Species) %>% 
  summarise(
    count = n(),
    med = median(Sepal.Width, na.rm = TRUE)
  ) %>% 
  ungroup()

remotes::install_github("apreshill/bakeoff")
library(bakeoff)
only_first_last <- ratings %>% 
  group_by(series) %>% 
  slice(1, n()) %>% 
  mutate(which_episode = ifelse(episode == 1, "First", "Last")) %>% 
  ungroup() %>% 
  mutate(series_f = as.factor(series))

View(only_first_last)

ggplot(data = only_first_last, 
       mapping = aes(x = which_episode, 
                     y = viewers_7day, 
                     group = series_f,
                     color = series_f)) +
  geom_line() +
  geom_point(size = 5)
# Mutate makes a new column. n() says to get last row in data table.
# ungroup removes group_by piece


iris %>% 
  arrange(Sepal.Length) %>% 
  slice(1:6)

iris %>% 
  arrange(Sepal.Length) %>% 
  slice_head(n=6)
