library(tidyverse)
library(tidyr)
library(readr)
library(ggplot2)
library(dplyr)
library(knitr)
library(here)
library (kableExtra)

# exploring the data further than just the basic tidying allows us to visualize it

#visualization of the data
univoltine_butterfly %>%
  ggplot(aes(x= sex,
             y= year)) +
  geom_point(colour="purple")

# the production of this graph highlighted the typos in the sex as males were sometimes spelt incorrectly and females were written singular and plural   
#code to fix error to name two variables: "Male" and "Female"
unique(univoltine_butterfly$sex)
summary(univoltine_butterfly$sex)
sum(is.na(univoltine_butterfly$sex))

univoltine_butterfly$sex[univoltine_butterfly$sex=="Females"] <- "Female"
univoltine_butterfly$sex[univoltine_butterfly$sex=="Maes"] <- "Male"
univoltine_butterfly$sex[univoltine_butterfly$sex=="Males"] <- "Male"
  
table(univoltine_butterfly$sex)

#corrected graph displayed
#visualization of the data
univoltine_butterfly %>%
  ggplot(aes(x= sex,
             y= year)) +
  geom_point(colour="purple")

#comparing groups 
summary<- univoltine_butterfly %>%
  group_by(sex) %>%
  summarise(mean=mean(forewing_length),
            sd=sd(forewing_length)) %>% 
  rename("forewing_length" = "mean")

#From these summary statistics a graph can be made
#make a new object 
univoltine_butterfly %>%
  ggplot(aes(x=sex,
             y=forewing_length))+
  geom_pointrange(data = summary, aes(ymin=forewing_length-sd, ymax=forewing_length+sd))+
  theme_bw()

# the kable extra functions makes a nicer table 
univoltine_butterfly %>%
  kbl(caption="Summary statistics of Male and Female butterflies born in years ranging from 1880 - 1973") %>%
  kable_styling(bootstrap_option = "striped", full_width = T, position = "left")

# taking a closer look at the sex and the jun_mean
univoltine_butterfly %>%
  ggplot(aes(x=sex,
             y=jun_mean,))+
  geom_point(aes(colour=sex))+
  geom_smooth(method="lm",
              se=FALSE,
              aes(colour=sex))

#taking a closer look at sex and rain_jun
ggplot(data = univoltine_butterfly, aes(x = sex, y = rain_jun)) +
  geom_boxplot(aes(fill = sex),
               width = 0.5,
               show.legend = FALSE)+
  geom_jitter(aes(colour=sex),
              width=0.2)+
  theme(legend.position="none")

# All of these graphs are produced by looking at the sex and the different numerical 
#data that is displayed in the data set, the point of producing these graphs was to make sure that
#all the data is presented correctly and that there are no visual errors that can be seen when they are 
#displayed. The only error that i came across was that the sex was written out incorrectly as there were four 
#different columns, when the data should ideally be presented with just two as it is now. The variables were: Maes, Males,
#Female, Females and are now correctly Male and Female. 

#Differences and uncertainty in the data
#
univoltine_butterfly_wide <- univoltine_butterfly %>%
  pivot_wider(names_from = forewing_length, values_from = rain) %>%
  mutate(difference = forewing_length -rain_jun)




