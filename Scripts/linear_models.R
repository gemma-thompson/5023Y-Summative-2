library(tidyverse)
library(GGally)
library(emmeans)
library(performance)
library(emmeans)

lsmodel0 <- lm(formula = forewing_length ~ 1, data = univoltine_butterfly)
summary(lsmodel0)
mean(univoltine_butterfly$forewing_length)
#

lsmodel1 <- lm(forewing_length ~ sex, data = univoltine_butterfly)
broom::tidy(lsmodel1)
# Due to the fact that the second row shows a negative value it means that it refers to the
#difference in the mean of the two groups
univoltine_butterfly %>%
  group_by(sex) %>%
  summarise(mean=mean(forewing_length)) %>%
#

summary(lsmodel1)
#From this summary we can take that the the standard error or rain_jun is 0.143941
#and the standard error difference is 0.001527. The estimate of the intercept mean  
#is 13.723480 

broom::tidy(lsmodel1, conf.int=T)
GGally::ggcoef_model(lsmodel1,
                     show_p_values = FALSE,
                     conf.level = 0.70)
#The original hypothesis is that rain will have an effect on butterfly length 

broom::tidy(lsmodel1, conf.int = T, conf.level = 0.99)
#

means <- emmeans::emmeans(lsmodel1, specs = ~ forewing_length)
means %>%
  as_tibble() %>%
  ggplot(aes(x=forewing_length,
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

plot(lsmodel1, which=c(1,3))

#outliers
performance::check_model(lsmodel1, check="outliers")

plot(lsmodel1, which=c(4,4))



               