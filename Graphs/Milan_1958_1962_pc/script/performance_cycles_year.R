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
data_1 <- read.csv("data/cycles_year.csv")

# data <- read.csv("data/music_2.csv")

f <- list(
  family = "Arial, monospace",
  size = 14,
  color = "#7f7f7f"
)

x <- list(
  title = "Mesi",
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
p <- plot_ly(x = data_1$Mese, 
             y = data_1$Anno_1,
             type="scatter", 
             mode="markers", 
             fill = "tozeroy",
             name = "1958") 


p <- p %>% add_trace(y = data_1$Anno_2, 
                     name = "1959") 

p <- p %>% add_trace(y = data_1$Anno_3, 
                     name = "1960")

p <- p %>% add_trace(y = data_1$Anno_4, 
                     name = "1961") 

p <- p %>% add_trace(y = data_1$Anno_5, 
                     name = "1962") 


p <- p %>% layout(xaxis = x, 
                  yaxis = y, 
                  title= "Numero di eventi musicali per mese", 
                  annotations = list(a, b))

p

