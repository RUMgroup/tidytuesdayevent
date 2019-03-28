library(tidyverse)
board_games <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-03-12/board_games.csv")
board_games %>% ggplot(aes(x=max_players, y=average_rating))+
  geom_point()
board_games2=board_games %>%
  filter(max_players<=8,max_players>=2)
board_games_mean=board_games2 %>%
  group_by(max_players) %>%
  summarise(`Average user rating`=mean(average_rating)) %>%
  mutate(`Max players`=max_players)
board_games_mean %>% ggplot(aes(x=`Max players`, y=`Average user rating`))+
  geom_point(colour="red", size=4)+
  geom_line(colour="red", size=1.5)+
  scale_x_continuous(breaks=2:8)+
  scale_y_continuous(limits=c(6.0,6.8))+
  theme_bw()