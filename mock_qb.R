library("tidyverse")

setwd("~/Desktop/mock qb draft")
dataset = read.csv('nfl_stats.csv')

qb_model <- lm(weighted_avg ~ big_time_throws + turnover_worthy_plays +
                 scrambles + hit_as_threw, data = dataset)
summary(qb_model)


setwd("~/Desktop/mock draft")
new_qbs1 = read.csv("qb_mock.csv")
names(new_qbs)[24] = 'Senior.Year.Grades'
predict(qb_model, newdata = new_qbs1)
new_qbs1 = new_qbs1 %>% 
  select(player) %>% 
  mutate(projected_average = predict(qb_model, newdata = new_qbs1))





