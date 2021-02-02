install.packages('readr')
library(readr)
library(ggplot2)
library(dplyr)
library(tidyr)
library(hrbrthemes)
library(GGally)
library(ggpubr)

df <- read.csv('paty.csv')
str(df)
View(df)
df1 <- tibble::as_tibble(df)
df1 <- rename(df1, adre = VL_NOTA_APRD_PTL)
df1
  
df1 <- select(df1, adre, nota)
df1


df1 %>%
  ggplot(aes(x=adre, y=nota)) +
  geom_point() 
  
ggscatter(df1, x = 'adre', y = 'nota', add = 'reg.line',
          conf.int = T, cor.coef = T, cor.method = 'pearson',
          xlab = 'Aderencia', ylab = 'nota')  
  
df1 %>%
  ggplot(aes(x=nota, y=adre)) + 
  geom_point( color="#69b3a2")

df1 %>%
  ggpairs(title="Correlação Aderêrencia e nota")

df1 %>% 
  ggpairs(columns = 1:2) 

cor(df1$adre, df1$nota)
