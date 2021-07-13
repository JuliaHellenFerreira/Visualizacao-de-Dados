rm(list = ls()) # Limpando o "Enviroment"
options(scipen = 999)


# Pacotes -----------------------------------------------------------------

library(tidyverse)
library(readr)
library(ggplot2)
library(lubridate)
library(dplyr)

# Leitura da Base ---------------------------------------------------------

base <- readr::read_csv2("./Treino/Base_profissao.csv")


# Questao 1 ---------------------------------------------------------------

base_prof <- base |>
  count(profissao)

plot1 <- base_prof |> 
  ggplot(aes(x = reorder(profissao, n),
             y = n)) +
  geom_bar(stat = "identity") +
  labs(x = "Remuneração",
       y = "Frequência") +
  theme_grey() +
  theme(text = element_text(size=12),
        axis.text.x = element_text(angle = 45, 
                                   hjust = 1))
plot1 

# Questao 2 ---------------------------------------------------------------

plot2 <- base |>
  ggplot(mapping = aes(x = idade)) +
  geom_histogram(fill = "Red",
                 color = "White",
                 breaks = c(15,20,25,30,35,45,60))

plot2