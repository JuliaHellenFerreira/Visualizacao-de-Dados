rm(list = ls()) # Limpando o "Enviroment"
options(scipen = 999)


# Pacotes -----------------------------------------------------------------

library(tidyverse)
library(readr)
library(ggplot2)
library(lubridate)
library(dplyr)

# Leitura da Base ---------------------------------------------------------

base <- readr::read_table2("./Treino/Base_ligacoes_roubos.txt")

# Manipulação -------------------------------------------------------------

base$Data <- lubridate::dmy(base$Data)

# Questão 1 ---------------------------------------------------------------

## Crie um gráfico de dispersão entre a data e o número de casos:

plot1 <- base |> 
  ggplot2::ggplot(mapping = aes(x = Data, y = Casos)) +
  geom_point()

plot1

# Questão 2 ---------------------------------------------------------------

## Plote uma reta de regressão considerando todo o período:

plot2 <- plot1 +
  geom_smooth(method = "lm",
              se = FALSE,
              size = 1,
              color = "red")
plot2

# Questão 3 ---------------------------------------------------------------

## Plote uma reta de regressão para cada mês, isto é, uma reta
## considerando somente os dados de janeiro e outra para
## fevereiro.

plot3 <- plot2 +
  geom_smooth(data = base |> 
                dplyr::filter(Data < lubridate::dmy("01/02/2021")),
              method = "lm",
              se = FALSE,
              size = 1,
              color = "blue") +
  geom_smooth(data = base |> 
                dplyr::filter(Data >= lubridate::dmy("01/02/2021")),
              method = "lm",
              se = FALSE,
              size = 1,
              color = "green")

plot3

# Questão -----------------------------------------------------------------

## Existe outra forma de plotar as retas de regressão por mês? Sim

plot4 <- base |> 
  dplyr::mutate(Mes = as.factor(lubridate::month(Data))) |> 
  ggplot2::ggplot(mapping = aes(x = Data, y = Casos,
                                color = Mes)) +
  geom_point() +
  geom_smooth(method = "lm",
              se = FALSE,
              size = 1) +
  theme_grey() +
  scale_y_log10(breaks = seq(0, 150, 10)) ## Serah que foi?

plot4


