# Libraries
# install.packages("ggplot2")
# install.packages("dplyr")
# install.packages("plotly")
# install.packages("hrbrthemes")

library(ggplot2)
library(dplyr)
library(plotly)
library(hrbrthemes)

# Load dataset
data_1 <- read.csv("data/cycles_total.csv")

# data <- read.csv("data/music_2.csv")

f <- list(
  family = "Arial, monospace",
  size = 14,
  color = "#7f7f7f"
)

x <- list(
  title = "Orari",
  titlefont = f
)
y <- list(
  title = "Eventi (percentuale)",
  titlefont = f
)

# annotations
a <- list(
  text = "",
  
  xref = "paper",
  yref = "paper",
  yanchor = "bottom",
  xanchor = "center",
  align = "center",
  x = 0.8,
  y = 0.985,
  showarrow = FALSE
)

b <- list(
  text = "",
  font = f,
  xref = "paper",
  yref = "paper",
  yanchor = "bottom",
  xanchor = "center",
  align = "center",
  x = 0.5,
  y = 0.95,
  showarrow = FALSE
)


# Area chart with 2 groups
p <- plot_ly(x = data_1$Orario, 
             y = data_1$Cinema_Teatro,
             type="scatter", 
             mode="markers", 
             fill = "tozeroy",
             name = "Cinema Teatro") 


p <- p %>% add_trace(y = data_1$Dancing, 
                     name = "Dancing") 

p <- p %>% add_trace(y = data_1$Night_club, 
                     name = "Night club")

p <- p %>% add_trace(y = data_1$Palazzetto, 
                     name = "Palazzetto") 

p <- p %>% add_trace(y = data_1$Sala_da_concerto, 
                     name = "Sala da concerto") 

p <- p %>% add_trace(y = data_1$Teatro_Sala_da_concerto, 
                     name = "Teatro/Sala da concerto")

p <- p %>% add_trace(y = data_1$Teatro_Sala_da_concerto_Dancing, 
                     name = "Teatro/Sala da concerto/Dancing")


p <- p %>% layout(xaxis = x, 
                  yaxis = y, 
                  title= "Numero di eventi musicali per orario di inizio", 
                  annotations = list(a, b))

p

