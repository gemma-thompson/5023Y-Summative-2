library(tidyverse)
library(GGally)
library(emmeans)
library(performance)

lsmodel0 <- lm(formula = rain_jun ~ 1, data = univoltine_butterfly)
mean(univoltine_butterfly$rain_jun)

lsmodel1 <- lm(forewing_length ~ rain_jun, data = univoltine_butterfly)
broom::tidy(lsmodel1)
# Due to the fact that the second row shows a negative value it means that it refers to the
#difference in the mean of the two groups
univoltine_butterfly %>%
  group_by(rain_jun) %>%
  summarise(mean=mean(rain_jun)) %>%
  print(n= 42)

summary(lsmodel1)

univolutine_butterfly %>%
  ggplot(aes(x=forewing_length,
             y=rain_jun,
             colour=forewing_length))+
  geom_jitter(aplha=0.5,
              width=0.1)+
  stat_summary(fun=mean,
               size=1.2)+
  theme_bw()



