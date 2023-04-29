library(tidyverse)
library(GGally)
library(emmeans)
library(performance)
library(emmeans)

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

broom::tidy(lsmodel1, conf.int=T)
GGally::ggcoef_model(lsmodel1,
                     show_p_values = FALSE,
                     conf.level = 0.95)
#

broom::tidy(lsmodel1, conf.int = T, conf.level = 0.99)
#

means <- emmeans::emmeans(lsmodel1, specs = ~ rain_jun)
means %>%
  as_tibble() %>%
  ggplot(aes(x=rain_jun,
             y=emmean))+
  geom_pointrange(aes(
    ymin=lower.CL,
    ymax=upper.CL
  ))
#

#Assumption checking
performance::check_model(lsmodel1)

#Normal distribution
performance::check_model(lsmodel1, check = c("normality", "qq"))
plot(lsmodel1, which=c(2,2))

