# Find out, which __year__ was the __most terrific__ for portfolio you have identified as __most profitable__ during the lesson and 
# show it on the chart using `ggplot2` package. Write an explanation about your findings into the code as comment.
# __Commit__ it to your repository into `Lessons/Lesson2/Homework`.

## Code
# 

library(dplyr)
library(ggplot2)

dt_KPI_raw <- read.csv("data/lesson2_KPI.csv")

dt_KPI_raw %>% 
  mutate(Premium = ifelse(Premium < 0, 0, Premium))

dt_KPI_raw %>%  mutate(UWR = Premium - Expenses - Losses) %>% 
  group_by(Year) %>% 
  summarize(UWR = sum(UWR, na.rm = TRUE)) %>% 
  arrange(UWR)

dt_KPI_raw %>% 
  mutate(UWR = Premium - Expenses - Losses) %>% 
  group_by(Year) %>% 
  summarize(UWR = sum(UWR, na.rm = TRUE)) %>% 
  ggplot(aes(x = reorder(Year, UWR), y = UWR)) + 
  geom_col()

# neviem preco, ale neviem z mojho R-studia push-nut kod na git, ked som ho sem vlozila a v R-studiu som dala pull vsetko zbehlo ako malo, 
# ked som nasledne spravila zmeny v R-studiu a dala push, vypisalo mi ze je vsetko up to date, ale na gite ziadne zmeny nespravil
# 




# Your Explanation about analysis:
# 
Vycistenie dat -> roztriedenie po rokoch -> porovnanie s Underwriting Result
Najmensie UWR v roku 2015 -> 2015 najhorsi rok
# 
# 
