library(tidyverse)

# dataset link
board_games <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-03-12/board_games.csv")

# Board games plot 1
board_games %>% 
  filter(max_players<= 8, max_players >= 2) %>%
  group_by(max_players) %>% 
  summarise(average=mean(average_rating)) %>% 
  ggplot(aes(x=max_players, y=average, color="red")) + 
  geom_point(size=3.5) +
  geom_line(size=1.5) +
  theme(legend.position = "none") +
  labs(title ="Three players might be a sweet spot" , 
       subtitle = "Average user ratings for games by maximum number of players",
       x="Average User rating",
       y="Max players") +
  scale_x_discrete(breaks=c(2,3,4,5,6,7,8), limits=c(2,3,4,5,6,7,8))
