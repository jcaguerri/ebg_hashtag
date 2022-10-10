
library(tidyverse)
library(tidytext)
ebg <- readRDS("ebg.rds")
mostusedwords <- ebg %>%
  unnest_tokens(word, text) %>%
  filter(!word %in% stop_word)

mostusedwords %>% filter(word== "motherfucker") %>% group_by(status_id)
mostusedwords %>% filter(word== "bitch") %>% filter(is_retweet== FALSE)
mostusedwords %>% filter(word== "murderer") %>% group_by(user_id)
mostusedwords %>% filter(word== "jews")
mostusedwords %>% filter(word== "gold")
mostusedwords %>% filter(word== "karen") %>% group_by(user_id)
mostusedwords %>% filter(word== "black")
#most used words general
mostusedwords %>% count( word, sort = TRUE) %>%
  mutate(word = factor(word, levels = rev(unique(word)))) %>% 
  top_n(50) %>%
  ggplot(aes(word, n)) +
  geom_col(show.legend = FALSE) +
  labs(x = NULL, y = "n") +
  coord_flip()