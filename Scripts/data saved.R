univoltine_butterfly <- 
  univoltine_butterfly %>% 
   filter(rain_jun < 200)

library(ggpubr)
ggplot(univoltine_butterfly,
       aes(x = jun_mean,
           y = rain_jun,
           colour = sex))+
  geom_point()+
  labs(x = "Mean June Temperature",
       y = "Rain in June",
       title = "How the mean temperature in June affects rainfall for male and female butterflies")+
  scale_colour_manual(values = c("#CC6677",
                                 "#332288"))+
  theme(title = element_text(size = 6))+
  stat_cor(method="pearson", aes(colour=sex))

```{r plot 1}
ggplot(univoltine_butterfly,
       aes(forewing_length, rain_jun))+
  geom_boxplot(aes(colour=sex))+
  ggtitle ("The length of male and female butterfly forewings during the rain in June")+
  labs(y = "Forewing Length", x = "Rain in June")+
  theme(title = element_text(size=7))