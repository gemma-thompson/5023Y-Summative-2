#Introduction on the background of data and plan --------
#The univoltine_butterfly data is looking at different male and female butterflies,
#and there wing size in the month of June depending on the rainfall, therefore when
#doing my R.Markdown fie I am going to present data that shows how the rainfall in June
#affected the males and females wings forewing_length, whether their age had anything to do 
#with whether the wings were affected more or less, and whether their sex had anything to do with
#them being affected more or less

#Through the use of different graphs i aim to clearly show whether either sex or age has the most affect on 
#forewing_length during the rain in June

#In the linear_models script different statistical analysis tests are performed, i have set out a hypothesis and 
#a null hypothesis in order to see then which the data supports through these tests. 
#Hypothesis: Rain will affect the wing length of the butterflies
#Null Hypothesis: Rain will not affect the wing length of the butterflies 

#The idea behind plotting the graphs in the linear_models script and exploratory_data_analysis script is to get a better
#understanding of the data that i am working with to then be able to build a hypothesis and null hypothesis for my R markdown
#file. 

#When completing my R Markdown document the hypothesis i am going to be investigating is:
#The temperature and rainfall in the month of June over the period of 1880 - 1973 doesn't have an effect
#on the forewing length of both male and female butterflies?
#Null Hypothesis
#The temperature and the rainfall in the month of June over the period of 1880 - 1973 doesn't have an effect 
#on the forewing length of both male and female butterflies 


```{r plot ?  }
ggplot(univoltine_butterfly,
       aes(forewing_length, rain_JUN))+
  geom_boxplot(aes(colour=sex))+
  ggtitle ("The length of male and female butterfly forewings during the rain in June")+
  labs(y = "Forewing Length", x = "Rain in June")+
  theme(title = element_text(size=7))
geom_boxplot(aes(colour=sex))+
  ggtitle ("The length of male and female butterfly forewings during the rain in June")+
  labs(y = "Forewing Length", x = "Rain in June")+
  theme(title = element_text(size=7))