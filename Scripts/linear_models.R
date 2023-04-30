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

#The hypothesis i am creating is that sex does change the length of the butterfly wings
#The null hypothesis is that sex does not change the length of the butterfly wings 
broom::tidy(lsmodel1, conf.int=T)
GGally::ggcoef_model(lsmodel1,
                     show_p_values = FALSE,
                     conf.level = 0.70)
#This graph shows that the upper and lower bounds of the confidence intervals don't cross 
#zero, the difference in butterfly length is consistent. We can accept the hypothesis which means
#that can we reject the null hypothesis
 
broom::tidy(lsmodel1, conf.int = T, conf.level = 0.99)

#argument to support this
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

#Assumption checking - check the assumptions of the model are adequately met so we know
#if analysis can be trusted. 
performance::check_model(lsmodel1)

#Normal distribution
#checking whether the residual in the data is approximately normally distributed  
performance::check_model(lsmodel1, check = c("normality", "qq"))
plot(lsmodel1, which=c(2,2))

#Quantile-Quantile plot
plot(lsmodel1, which=c(1,3))
#the y axis is showing the distribution of the data and the x-axis is showing a theoretical normal 
#distribution.They are the same values and they meet proving that the data follows a normal distribution
#as they form a line across the middle of the plot.

plot(lsmodel1, which=c(1,3))

#outliers
performance::check_model(lsmodel1, check="outliers")
#the outliers are potentially affecting estimates of error that can be made from the data

#Cooks distance graph - Cooks distance is a measure of how much 'leverage' a single data point exerts on the model,
#if too high then it is having an outsized effect on the estimates
plot(lsmodel1, which=c(4,4))
#this shows that there are three main outliers that have been highlighted with numbers above them - these are influential 
#data points 




               