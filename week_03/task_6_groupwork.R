ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

mpg %>% 
  ggplot() +
  geom_point(mapping = aes(x = displ, y = hwy, color = class)) +
  geom_smooth(mapping = aes(x = displ, y = hwy, color = class))

mpg %>% glimpse()

mpg %>% 
  ggplot() +
  geom_boxplot(aes(x=class, y=cty)) +
  labs(y="City miles per gallon")

mpg %>% 
  ggplot() +
  geom_boxplot(aes(x=class, y=cty)) +
  labs(y="City miles per gallon") +
  coord_flip()

library(readr)
library(ggplot2)

rcw <- read_csv("https://byuistats.github.io/M335/data/rcw.csv", 
                col_types = cols(Semester_Date = col_date(format = "%m/%d/%y"), 
                                 Semester = col_factor(levels = c("Winter", "Spring", "Fall"))))
head(rcw)

ggplot(data = rcw, 
       mapping = aes(x = Semester_Date, 
                     y = Count, 
                     color = Department)) +
  geom_line() +
  geom_point()

ggplot(data = rcw, 
       mapping = aes(x = Semester_Date, 
                     fill= Department)) +
  geom_bar()

ggplot(data = rcw, 
       mapping = aes(x = Semester_Date, y=Count, 
                     fill= Department)) +
  geom_col()

str <- "How has R&CW attendance changed over time within each department?"

top_5_states_with_max_date <- 
  covid_state_data %>% 
  filter(date == max(date)) %>% 
  top_n(cases, n = 5) %>% 
  arrange(desc(cases)) %>%
  glimpse()

top_5_states <- top_5_states_with_max_date %>% 
  pull(state)

covid_state_data %>% 
  filter(state %in% top_5_states) %>% 
  ggplot(aes(x = date, y = cases, color = fct_relevel(state,top_5_states))) +
  geom_line() +
  ggrepel::geom_label_repel(
    data = top_5_states_with_max_date,
    mapping = aes(label = state)) +
  labs(color = "State") +
  theme_bw() +
  theme(legend.position = "none")

