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
data_1 <- read.csv("data/cycles_week.csv")

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
  title = "Eventi",
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
             y = data_1$Lunedi,
             type="scatter", 
             mode="markers", 
             fill = "tozeroy",
             name = "Lunedì") 


p <- p %>% add_trace(y = data_1$Martedi, 
                     name = "Martedì") 

p <- p %>% add_trace(y = data_1$Mercoledi, 
                     name = "Mercoledì")

p <- p %>% add_trace(y = data_1$Giovedi, 
                     name = "Giovedì") 

p <- p %>% add_trace(y = data_1$Venerdi, 
                     name = "Venerdì") 

p <- p %>% add_trace(y = data_1$Sabato, 
                     name = "Sabato")

p <- p %>% add_trace(y = data_1$Domenica, 
                     name = "Domenica")


p <- p %>% layout(xaxis = x, 
                  yaxis = y, 
                  title= "Numero di eventi musicali per giorno della settimana", 
                  annotations = list(a, b))

p

