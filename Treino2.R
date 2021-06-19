rm(list = ls()) # Limpando o "Enviroment"
options(scipen = 999)


# Pacotes -----------------------------------------------------------------

library(tidyverse)
library(readr)

# Leitura da Base ---------------------------------------------------------

base <- read_table2("./Treino/Base vendas.txt",
                    locale = locale(decimal_mark = ","))

# Analise -----------------------------------------------------------------

base_mod <- base %>% 
  gather(key = "Meses", # Nome da coluna que tera os meses
         value = "Vendas", # Nome da coluna dos valores de venda
         JAN:DEZ) # Intervalo onde esta os meses e os valores empilhados

