library(gapminder)
library(tidyverse)
library(ggplot2)
View(gapminder)
gapminder %>% filter(country=='Afghanistan') %>% View()
gapminder %>% distinct(country) %>% View()
gapminder %>% ggplot() +
  aes(x=year, y=lifeExp)+
  geom_smooth()+
  geom_point()+
  facet_wrap(~continent)
gapminder %>% pull(country)
gapminder %>% ggplot() +
  aes(x=year, y=lifeExp, color=continent)+
  geom_smooth()+
  geom_point()+
  labs(
    title='Hi',
    x='Year')
