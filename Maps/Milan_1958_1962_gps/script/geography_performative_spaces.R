##install.packages("leaflet")
##install.packages("sp")
##install.packages("rgdal")
##install.packages("RColorBrewer")
##install.packages("leaflet.extras")
##install.packages("leaflet.minicharts")
##install.packages("htmlwidgets")
##install.packages("raster")
##install.packages("mapview")
##install.packages("leafem")

## Call the libraries
library(leaflet)
library(sp)
library(rgdal)
library(RColorBrewer)
library(leaflet.extras)
library(leaflet.minicharts)
library(htmlwidgets)
library(leaflegend)
library(raster)
library(mapview)
library(leafem)
library(leafpop)
library(sf)
library(htmltools)
library(magrittr)


## PART 1 - IN THIS PART THE CODE READS THE FILES AND ATTRIBUTES COLORS AND ICONS TO ELEMENTS

#WMS raster 1956
wms_1956 <- "https://geoportale.comune.milano.it/arcgis/services/Cartografie_Raster/Milano_1956_JPG_CTC_GB/ImageServer/WMSServer"

#WMS raster 1965
wms_1965 <- "https://geoportale.comune.milano.it/arcgis/services/Cartografie_Raster/Milano_1965_JPG_CTC_GB/ImageServer/WMSServer"

## Shapefile night club
Night_Club <- readOGR('data/Night_Club/Night_Club.shp')

## Shapefile cinema
Cinema <- readOGR('data/Cinema/Cinema.shp')

## Shapefile teatri
Teatri <- readOGR('data/Teatri_ok/Teatri_ok.shp')

## Shapefile teatri/sale
Teatri_sale <- readOGR('data/TeatriSale/Sale.shp')

## Shapefile sale
Sale <- readOGR('data/Sale_da_concerto/Sale_da_concerto.shp')

## Shapefile palazzetti
Palazzetti <- readOGR('data/Palazzetti/Palazzetti.shp')

## Shapefile whisky
Whisky <- readOGR('data/Whisky/Whisky.shp')

## Shapefile dancing
Dancing <- readOGR('data/Dancing/Dancing.shp')

## Shapefile cerchie
Cerchie <- readOGR('data/Cerchie/cerchie.shp')

## Shapefile stazioni
Stazioni <- readOGR('data/Stazioni/stazioni.shp')



## Palette night club
palette_night_club <- colorFactor(palette = c("#f9a515"), domain = Night_Club$tipologia)

## Palette cinema
palette_cinema <- colorFactor(palette = c("green"), domain = Cinema$tipologia)

## Palette palazzetti
palette_teatri <- colorFactor(palette = c("#fd0090", "#0090fd","#0012fd", "#fd0012",  "#900C3F" ),  domain = Teatri$tipologia)

## Palette teatri
palette_teatri <- colorFactor(palette = c( "#fd0012", "#900C3F" ),  domain = Teatri_sale$tipologia)

## Palette whisky
palette_whisky <- colorFactor(palette = c("darkorchid"), domain = Whisky$tipologia)

## Palette dancing
palette_dancing <- colorFactor(palette = c("#f9ef15"), domain = Dancing$tipologia)

##totale csv
venues_data <- read.csv("data/total_marker.csv")

##totale html popup
venues_content <- paste(sep = "<br/>",
                        paste0("<div class='leaflet-popup-scrolled' style='max-width:600px;max-height:400px'>"),
                        paste0("<b>", "Nome: ", "</b>", venues_data$Nome),
                        paste0("<b>", "Organizzatore: ", "</b>", venues_data$Organizzatore),
                        paste0("<b>", "Indirizzo: ", "</b>", venues_data$Indirizzo),
                        paste0("<b>", "Categoria: ", "</b>", venues_data$Categoria),
                        paste0("<b>", "Eventi: ", "</b>", venues_data$Eventi),
                        paste0("<b>", "Capienza: ", "</b>", venues_data$Capienza),
                        paste0(venues_data$Thumbnails),
                        paste0(venues_data$Immagini_originali),
                        paste0("<b>", "Data immagine: ", "</b>", venues_data$Data_foto),
                        paste0("</div>"))

##teatri csv
teatri_data <- read.csv("data/teatri_marker.csv")

##teatri html popup
teatri_content <- paste(sep = "<br/>",
                 paste0("<div class='leaflet-popup-scrolled' style='max-width:600px;max-height:400px'>"),
                 paste0("<b>", "Nome: ", "</b>", teatri_data$Nome),
                 paste0("<b>", "Organizzatore: ", "</b>", teatri_data$Organizzatore),
                 paste0("<b>", "Indirizzo: ", "</b>", teatri_data$Indirizzo),
                 paste0("<b>", "Categoria: ", "</b>", teatri_data$Tipologia),
                 paste0("<b>", "Eventi: ", "</b>", teatri_data$Eventi),
                 paste0("<b>", "Capienza: ", "</b>", teatri_data$Capienza),
                 paste0(teatri_data$Thumbnails),
                 paste0(teatri_data$Immagini_originali),
                 paste0("<b>", "Data immagine: ", "</b>", teatri_data$Data_foto),
                 paste0("</div>"))

##teatri sale csv
teatri_sale_data <- read.csv("data/Teatri_Sale_marker.csv")

##teatri html popup
teatri_sale_content <- paste(sep = "<br/>",
                        paste0("<div class='leaflet-popup-scrolled' style='max-width:600px;max-height:400px'>"),
                        paste0("<b>", "Nome: ", "</b>", teatri_sale_data$Nome),
                        paste0("<b>", "Organizzatore: ", "</b>", teatri_sale_data$Organizzatore),
                        paste0("<b>", "Indirizzo: ", "</b>", teatri_sale_data$Indirizzo),
                        paste0("<b>", "Categoria: ", "</b>", teatri_sale_data$Tipologia),
                        paste0("<b>", "Eventi: ", "</b>", teatri_sale_data$Eventi),
                        paste0("<b>", "Capienza: ", "</b>", teatri_sale_data$Capienza),
                        paste0(teatri_sale_data$Thumbnails),
                        paste0(teatri_sale_data$Immagini_originali),
                        paste0("<b>", "Data immagine: ", "</b>", teatri_sale_data$Data_foto),
                        paste0("</div>"))

##palazzetti csv
palazzetti_data <- read.csv("data/Palazzetti_marker.csv")

##teatri html popup
palazzetti_content <- paste(sep = "<br/>",
                             paste0("<div class='leaflet-popup-scrolled' style='max-width:600px;max-height:400px'>"),
                             paste0("<b>", "Nome: ", "</b>", palazzetti_data$Nome),
                             paste0("<b>", "Organizzatore: ", "</b>", palazzetti_data$Organizzatore),
                             paste0("<b>", "Indirizzo: ", "</b>", palazzetti_data$Indirizzo),
                             paste0("<b>", "Categoria: ", "</b>", palazzetti_data$Tipologia),
                             paste0("<b>", "Eventi: ", "</b>", palazzetti_data$Eventi),
                             paste0("<b>", "Capienza: ", "</b>", palazzetti_data$Capienza),
                             paste0(palazzetti_data$Thumbnails),
                             paste0(palazzetti_data$Immagini_originali),
                             paste0("<b>", "Data immagine: ", "</b>", palazzetti_data$Data_foto),
                             paste0("</div>"))

##palazzetti csv
sala_concerto_data <- read.csv("data/Sala_concerto_marker.csv")

##teatri html popup
sala_concerto_content <- paste(sep = "<br/>",
                            paste0("<div class='leaflet-popup-scrolled' style='max-width:600px;max-height:400px'>"),
                            paste0("<b>", "Nome: ", "</b>", sala_concerto_data$Nome),
                            paste0("<b>", "Organizzatore: ", "</b>", sala_concerto_data$Organizzatore),
                            paste0("<b>", "Indirizzo: ", "</b>", sala_concerto_data$Indirizzo),
                            paste0("<b>", "Categoria: ", "</b>", sala_concerto_data$Tipologia),
                            paste0("<b>", "Eventi: ", "</b>", sala_concerto_data$Eventi),
                            paste0("<b>", "Capienza: ", "</b>", sala_concerto_data$Capienza),
                            paste0(sala_concerto_data$Thumbnails),
                            paste0(sala_concerto_data$Immagini_originali),
                            paste0("<b>", "Data immagine: ", "</b>", sala_concerto_data$Data_foto),
                            paste0("</div>"))

##icon list 
total_icons <- awesomeIconList (Teatro = makeAwesomeIcon (icon = 'music', markerColor = 'blue'),
                               Teatro_Sala_concerto = makeAwesomeIcon (icon = 'music', markerColor = 'red'),
                               Teatro_Sala_Dancing = makeAwesomeIcon (icon = 'music', markerColor = 'darkred'),
                               Sala_concerto = makeAwesomeIcon (icon = 'music', markerColor = 'lightblue'),
                               Palazzetto = makeAwesomeIcon (icon = 'flag', markerColor = 'pink'),
                               Cinema_Teatro = makeAwesomeIcon (icon = 'blackboard', markerColor = 'green'),
                               Dancing = makeAwesomeIcon (icon = 'user', markerColor = 'beige'),
                               Whisky_a_gogo = makeAwesomeIcon (icon = 'volume-up', markerColor = 'purple'),
                               Night_Club = makeAwesomeIcon (icon = 'glass', markerColor = 'orange'),
                               Altro = makeAwesomeIcon (icon = 'asterisk', markerColor = 'gray'))
                                



##teatri icons
teatri_icons <-  awesomeIconList (Teatro = makeAwesomeIcon (icon = 'music', markerColor = 'blue'))

##teatri sale icons
teatri_sale_icons <- awesomeIconList (Teatro_Sala_concerto = makeAwesomeIcon (icon = 'music', markerColor = 'red'),
                                      Teatro_Sala_Dancing = makeAwesomeIcon (icon = 'music', markerColor = 'darkred'))

##sale icons
sala_concerto_icons <- awesomeIconList (Sala_concerto = makeAwesomeIcon (icon = 'music', markerColor = 'lightblue'))

##palazzetti icons
palazzetti_icons <- awesomeIconList (Palazzetto = makeAwesomeIcon (icon = 'flag', markerColor = 'pink'))



##cinema csv
cinema_data <- read.csv("data/cinema.csv")

##cinema html popup
cinema_content <- paste(sep = "<br/>",
                        paste0("<div class='leaflet-popup-scrolled' style='max-width:600px;max-height:400px'>"),
                        paste0("<b>", "Nome: ", "</b>", cinema_data$Nome),
                        paste0("<b>", "Organizzatore: ", "</b>", cinema_data$Organizzatore),
                        paste0("<b>", "Indirizzo: ", "</b>", cinema_data$Indirizzo),
                        paste0("<b>", "Tipologia: ", "</b>", cinema_data$Tipologia),
                        paste0("<b>", "Eventi: ", "</b>", cinema_data$Eventi),
                        paste0("<b>", "Capienza: ", "</b>", cinema_data$Capienza),
                        paste0(cinema_data$Thumbnails),
                        paste0(cinema_data$Immagini_originali),
                        paste0("<b>", "Data immagine: ", "</b>", cinema_data$Data_foto),
                        paste0("</div>"))

##cinema icons
cinema_icons <- awesomeIconList (Cinema_Teatro = makeAwesomeIcon(icon = 'blackboard', markerColor = 'green'))

##stazioni csv
stazioni_data <- read.csv("data/stazioni.csv")

##Stazioni html popup
stazioni_content <- paste(sep = "<br/>",
                        paste0("<div class='leaflet-popup-scrolled' style='max-width:600px;max-height:400px'>"),
                        paste0("<b>", "Nome: ", "</b>", stazioni_data$Nome),
                        paste0("</div>"))

##stazioni icons
stazioni_icons <- makeAwesomeIcon(icon = 'road', markerColor = 'darkgreen')

##dancing csv
dancing_data <- read.csv("data/dancing.csv")

##dancing html popup
dancing_content <- paste(sep = "<br/>",
                        paste0("<div class='leaflet-popup-scrolled' style='max-width:600px;max-height:400px'>"),
                        paste0("<b>", "Nome: ", "</b>", dancing_data$Nome),
                        paste0("<b>", "Organizzatore: ", "</b>", dancing_data$Organizzatore),
                        paste0("<b>", "Indirizzo: ", "</b>", dancing_data$Indirizzo),
                        paste0("<b>", "Tipologia: ", "</b>", dancing_data$Tipologia),
                        paste0("<b>", "Eventi: ", "</b>", dancing_data$Eventi),
                        paste0("<b>", "Capienza: ", "</b>", dancing_data$Capienza),
                        paste0(dancing_data$Thumbnails),
                        paste0(dancing_data$Immagini_originali),
                        paste0("<b>", "Data immagine: ", "</b>", dancing_data$Data_foto),
                        paste0("</div>"))
##dancing icons
dancing_icons <- awesomeIconList (Dancing = makeAwesomeIcon (icon = 'user', markerColor = 'beige'))


##night csv
night_data <- read.csv("data/night.csv")

##night html popup
night_content <- paste(sep = "<br/>",
                         paste0("<div class='leaflet-popup-scrolled' style='max-width:600px;max-height:400px'>"),
                         paste0("<b>", "Nome: ", "</b>", night_data$Nome),
                         paste0("<b>", "Organizzatore: ", "</b>", night_data$Organizzatore),
                         paste0("<b>", "Indirizzo: ", "</b>", night_data$Indirizzo),
                         paste0("<b>", "Tipologia: ", "</b>", night_data$Tipologia),
                         paste0("<b>", "Eventi: ", "</b>", night_data$Eventi),
                         paste0("<b>", "Capienza: ", "</b>", night_data$Capienza),
                         paste0(night_data$Thumbnails),
                         paste0(night_data$Immagini_originali),
                         paste0("<b>", "Data immagine: ", "</b>", night_data$Data_foto),
                         paste0("</div>"))
##dancing icons
night_icons <- awesomeIconList (Night_Club = makeAwesomeIcon(icon = 'glass', markerColor = 'orange'))

##whisky csv
whisky_data <- read.csv("data/whisky.csv")

##whisky html popup
whisky_content <- paste(sep = "<br/>",
                       paste0("<div class='leaflet-popup-scrolled' style='max-width:600px;max-height:400px'>"),
                       paste0("<b>", "Nome: ", "</b>", whisky_data$Nome),
                       paste0("<b>", "Organizzatore: ", "</b>", whisky_data$Organizzatore),
                       paste0("<b>", "Indirizzo: ", "</b>", whisky_data$Indirizzo),
                       paste0("<b>", "Tipologia: ", "</b>", whisky_data$Tipologia),
                       paste0("<b>", "Eventi: ", "</b>", whisky_data$Eventi),
                       paste0("<b>", "Capienza: ", "</b>", whisky_data$Capienza),
                       paste0(whisky_data$Thumbnails),
                       paste0(whisky_data$Immagini_originali),
                       paste0("<b>", "Data immagine: ", "</b>", whisky_data$Data_foto),
                       paste0("</div>"))

##whisky icons
whisky_icons <- awesomeIconList (Whisky_a_gogo = makeAwesomeIcon(icon = 'volume-up', markerColor = 'purple'))



##Events palette
palette_venues <- colorNumeric("YlGn", venues_data$Eventi)
##Capacity palette
palette_capacity <- colorNumeric("YlOrRd", domain = venues_data$Capienza)


## Palette cerchie
palette_cerchie <- colorFactor(palette = c("yellow", "#F22814", "#14F297"), domain = Cerchie$nome)


## PART 2 - IN THIS PART THE CODE ADDS ELEMENT ON THE MAP LIKE POLYGONS, POINTS AND IMAGES.

m <- leaflet(options = leafletOptions(preferCanvas = TRUE)) %>%
  ## Basemap
  ##addTiles(tile)        %>%
  addProviderTiles(providers$CartoDB.Positron, options = providerTileOptions(
    updateWhenZooming = FALSE,      
    updateWhenIdle = TRUE,
    maxZoom = 18) )  %>%
  

  
  ## Add a zoom reset button
  addResetMapButton() %>%
  
  ## Add a coordinates reader
  leafem::addMouseCoordinates() %>%
  ## define the view
  setView(lng = 9.18835, 
          lat = 45.4610, 
          zoom = 13 ) %>%
  
  
  
  ##Polygons Night 
  addPolygons(data = Night_Club,
              stroke = FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = "goldenrod",
              group = "Night Club",
              label = ~paste(nome)) %>%
  
  ##Polygons cinema
  addPolygons(data = Cinema,
              stroke = FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = ~palette_cinema(tipologia),
              group = "Cinema",
              label = ~paste(nome)) %>%
  
  ##Polygons teatri
  addPolygons(data = Teatri,
              stroke = FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = ~palette_teatri(tipologia),
              group = "Teatri",
              label = ~paste(nome)) %>%
  
  ##Polygons palazzetti
  addPolygons(data = Palazzetti,
              stroke = FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = "#fd0090",
              group = "Palazzetti",
              label = ~paste(nome)) %>%
  
  ##Polygons teatri
  addPolygons(data = Teatri,
              stroke = FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = "#0012fd",
              group = "Teatri",
              label = ~paste(nome)) %>%
  
  
  ##Polygons teatri sale
  addPolygons(data = Teatri_sale,
              stroke = FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = "#fd0012",
              group = "Teatri/Sale da concerto",
              label = ~paste(nome)) %>%
  
  ##Polygons sale
  addPolygons(data = Sale,
              stroke = FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = "#0090fd",
              group = "Sale da concerto",
              label = ~paste(nome)) %>%
  
  ##Polygons whisky
  addPolygons(data = Whisky,
              stroke = FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = ~palette_whisky(tipologia),
              group = "Whisky a go-go",
              label = ~paste(nome)) %>%
  
  ##Polygons dancing
  addPolygons(data = Dancing,
              stroke = FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = ~palette_dancing(tipologia),
              group = "Dancing",
              label = ~paste(nome)) %>%
  ##Polygons Night 
  addPolygons(data = Night_Club,
              stroke = FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = ~palette_night_club(tipologia),
              group = "Night Club",
              label = ~paste(nome)) %>%
  
  
  ##Polygons cinema_2
  addPolygons(data = Cinema,
              stroke = FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = ~palette_cinema(tipologia),
              group = "Total",
              label = ~paste(nome)) %>%
  
  ##Polygons teatri_2
  addPolygons(data = Teatri,
              stroke = FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = ~palette_teatri(tipologia),
              group = "Total",
              label = ~paste(nome)) %>%
  
  ##Polygons whisky_2
  addPolygons(data = Whisky,
              stroke = FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = ~palette_whisky(tipologia),
              group = "Total",
              label = ~paste(nome)) %>%
  
  ##Polygons dancing_2
  addPolygons(data = Dancing,
              stroke = FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = ~palette_dancing(tipologia),
              group = "Total",
              label = ~paste(nome)) %>%
  
  ##Polygons Night_2 
  addPolygons(data = Night_Club,
              stroke = FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = ~palette_night_club(tipologia),
              group = "Total",
              label = ~paste(nome)) %>%
  
  ##Polygons teatri
  addPolygons(data = Teatri,
              stroke = FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = ~palette_teatri(tipologia),
              group = "Total",
              label = ~paste(nome)) %>%
  
  ##Polygons palazzetti
  addPolygons(data = Palazzetti,
              stroke = FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = "#fd0090",
              group = "Total",
              label = ~paste(nome)) %>%
  
  ##Polygons teatri
  addPolygons(data = Teatri,
              stroke = FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = "#0012fd",
              group = "Total",
              label = ~paste(nome)) %>%
  
  
  ##Polygons teatri sale
  addPolygons(data = Teatri_sale,
              stroke = FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = "#fd0012",
              group = "Total",
              label = ~paste(nome)) %>%
  
  ##Polygons sale
  addPolygons(data = Sale,
              stroke = FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = "#0090fd",
              group = "Total",
              label = ~paste(nome)) %>%
  
  
  ##Linee stazioni
  addPolygons(data = Stazioni,
              weight = 1,
              opacity = 1,
              stroke = TRUE,
              fillColor = "black",
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = "black",
              group = "Cinema"
  ) %>%
  
  
  
  
  
  ## Markers totale
  addAwesomeMarkers(data = venues_data, 
                    lng = ~Longitude,
                    lat = ~Latitude,
                    popup = c(venues_content),
                    icon = ~total_icons[Tipologia],
                    group = "Total",
                    options = popupOptions(maxWidth = 100, maxHeight = 150), 
                    clusterOptions = markerClusterOptions())%>%
  
  
  ## Markers teatri
  addAwesomeMarkers(data = teatri_data, 
                    lng = ~Longitude,
                    lat = ~Latitude,
                    icon = ~teatri_icons[Categoria],
                    popup = c(teatri_content), 
                    group = "Teatri",
                    options = popupOptions(maxWidth = 100, maxHeight = 150), 
                    clusterOptions = markerClusterOptions())%>%
  ## Markers sale teatri
  addAwesomeMarkers(data = teatri_sale_data, 
                    lng = ~Longitude,
                    lat = ~Latitude,
                    icon = ~teatri_sale_icons[Categoria],
                    popup = c(teatri_sale_content), 
                    group = "Teatri/Sale da concerto",
                    options = popupOptions(maxWidth = 100, maxHeight = 150), 
                    clusterOptions = markerClusterOptions())%>%
  
  ## Markers palazzetti
  addAwesomeMarkers(data = palazzetti_data, 
                    lng = ~Longitude,
                    lat = ~Latitude,
                    icon = ~palazzetti_icons[Categoria],
                    popup = c(palazzetti_content), 
                    group = "Palazzetti",
                    options = popupOptions(maxWidth = 100, maxHeight = 150), 
                    clusterOptions = markerClusterOptions())%>%
  
  ## Markers sale da concerto
  addAwesomeMarkers(data = sala_concerto_data, 
                    lng = ~Longitude,
                    lat = ~Latitude,
                    icon = ~sala_concerto_icons[Categoria],
                    popup = c(sala_concerto_content), 
                    group = "Sale da concerto",
                    options = popupOptions(maxWidth = 100, maxHeight = 150), 
                    clusterOptions = markerClusterOptions())%>%
  
  
  
  
  
  
  
  ## Markers cinema
  addAwesomeMarkers(data = cinema_data, 
                    lng = ~Longitude,
                    lat = ~Latitude,
                    icon = ~cinema_icons[Tipologia],
                    popup = c(cinema_content), 
                    group = "Cinema",
                    options = popupOptions(maxWidth = 100, maxHeight = 150), 
                    clusterOptions = markerClusterOptions())%>%
  
  ## Markers stazioni
  addAwesomeMarkers(data = stazioni_data, 
                    lng = ~Longitude,
                    lat = ~Latitude,
                    icon = stazioni_icons,
                    popup = c(stazioni_content), 
                    group = "Cinema",
                    options = popupOptions(maxWidth = 100, maxHeight = 150), 
                    clusterOptions = markerClusterOptions())%>%
  
  ## Markers dancing
  addAwesomeMarkers(data = dancing_data, 
                    lng = ~Longitude,
                    lat = ~Latitude,
                    popup = c(dancing_content), 
                    icon = ~dancing_icons[Categoria],
                    group = "Dancing",
                    options = popupOptions(maxWidth = 100, maxHeight = 150), 
                    clusterOptions = markerClusterOptions())%>%
  
  ## Markers night
  addAwesomeMarkers(data = night_data, 
                    lng = ~Longitude,
                    lat = ~Latitude,
                    icon = ~night_icons[Categoria],
                    popup = c(night_content), 
                    group = "Night Club",
                    options = popupOptions(maxWidth = 100, maxHeight = 150), 
                    clusterOptions = markerClusterOptions())%>%
  
  
  ## Markers whisky
  addAwesomeMarkers(data = whisky_data, 
                    lng = ~Longitude,
                    lat = ~Latitude,
                    icon = ~whisky_icons[Categoria],
                    popup = c(whisky_content), 
                    group = "Whisky a go-go",
                    options = popupOptions(maxWidth = 100, maxHeight = 150), 
                    clusterOptions = markerClusterOptions())%>%
  
  ## Circles markers events
  addCircleMarkers(data = venues_data, 
                   lng = ~Longitude,
                   lat = ~Latitude,
                   fillColor = ~palette_venues(Eventi),
                   color = "black",
                   weight = 1,
                   radius = ~sqrt(venues_data$Eventi),
                   stroke = TRUE,
                   fillOpacity = 0.5,
                   group = "Events",
                   label = ~paste(venues_data$Eventi 
                   )) %>%
  
  ## Circle markers capacity
  addCircleMarkers(data = venues_data, 
                   lng = ~Longitude,
                   lat = ~Latitude,
                   fillColor = ~palette_capacity(Capienza),
                   color = "black",
                   weight = 1,
                   radius = ~sqrt(venues_data$Capienza) - 10,
                   stroke = TRUE,
                   fillOpacity = 0.5,
                   group = "Capacity",
                   label = ~paste(venues_data$Capienza 
                   )) %>%
  ##Heatmap
  addHeatmap(data = venues_data,
             lng = ~Longitude,
             lat = ~Latitude, 
              group = "Heatmap",
                minOpacity = 0.05, 
                max = 1, 
                radius = 15,
                blur = 15,
                intensity = 0.6,
                cellSize = 10,
                ) %>%
                
  ##Polygons Cerchie
  addPolygons(data = Cerchie,
              weight = 1,
              opacity = 1,
              stroke = TRUE,
              fillColor = "red",
              smoothFactor = 0.2, 
              fillOpacity = 0,
              color = ~palette_cerchie(nome),
              group = "Cerchie"
  ) %>%
  
  
  ##Legend cerchie
  addLegend("bottomright", 
            pal = palette_cerchie, 
            values = Cerchie$nome,
            title = "Cerchie:",
            labFormat = labelFormat(suffix = ""),
            opacity = 1,
            group = "Cerchie") %>%
  

  
  ##WMS 1965 
  addWMSTiles(
    wms_1965,
    layers = "0",
    group  = "1965",
    options = WMSTileOptions(format = "image/png", transparent = FALSE)
  )%>%
  
  addLegendAwesomeIcon(iconSet = total_icons,
                       orientation = 'vertical',
                       title = htmltools::tags$div(
                         style = 'font-size: 14px;',
                         'Categories'),
                       labelStyle = 'font-size: 12px;',
                       position = 'bottomleft',
                       marker = TRUE,
                       group = "Total"
                    ) %>%

  
  
  addLegendAwesomeIcon(iconSet = teatri_icons,
                       orientation = 'vertical',
                       title = htmltools::tags$div(
                         style = 'font-size: 14px;',
                         'Categories'),
                       labelStyle = 'font-size: 12px;',
                       position = 'bottomleft',
                       marker = TRUE,
                       group = "Teatri"
  ) %>%
  
  addLegendAwesomeIcon(iconSet = teatri_sale_icons,
                       orientation = 'vertical',
                       title = htmltools::tags$div(
                         style = 'font-size: 14px;',
                         'Categories'),
                       labelStyle = 'font-size: 12px;',
                       position = 'bottomleft',
                       marker = TRUE,
                       group = "Teatri/Sale da concerto"
  ) %>%
  
  addLegendAwesomeIcon(iconSet = palazzetti_icons,
                       orientation = 'vertical',
                       title = htmltools::tags$div(
                         style = 'font-size: 14px;',
                         'Categories'),
                       labelStyle = 'font-size: 12px;',
                       position = 'bottomleft',
                       marker = TRUE,
                       group = "Palazzetti"
  ) %>%
  
  addLegendAwesomeIcon(iconSet = sala_concerto_icons,
                       orientation = 'vertical',
                       title = htmltools::tags$div(
                         style = 'font-size: 14px;',
                         'Categories'),
                       labelStyle = 'font-size: 12px;',
                       position = 'bottomleft',
                       marker = TRUE,
                       group = "Sale da concerto"
  ) %>%
  
  
  addLegendAwesomeIcon(iconSet = cinema_icons,
                       orientation = 'vertical',
                       title = htmltools::tags$div(
                         style = 'font-size: 14px;',
                         'Categories'),
                       labelStyle = 'font-size: 12px;',
                       position = 'bottomleft',
                       marker = TRUE,
                       group = "Cinema"
  ) %>%
  
  addLegendAwesomeIcon(iconSet = dancing_icons,
                       orientation = 'vertical',
                       title = htmltools::tags$div(
                         style = 'font-size: 14px;',
                         'Categories'),
                       labelStyle = 'font-size: 12px;',
                       position = 'bottomleft',
                       marker = TRUE,
                       group = "Dancing"
  ) %>%
  
  addLegendAwesomeIcon(iconSet = whisky_icons,
                       orientation = 'vertical',
                       title = htmltools::tags$div(
                         style = 'font-size: 14px;',
                         'Categories'),
                       labelStyle = 'font-size: 12px;',
                       position = 'bottomleft',
                       marker = TRUE,
                       group = "Whisky a go-go"
  ) %>%
  
  
  addLegendAwesomeIcon(iconSet = night_icons,
                       orientation = 'vertical',
                       title = htmltools::tags$div(
                         style = 'font-size: 14px;',
                         'Categories'),
                       labelStyle = 'font-size: 12px;',
                       position = 'bottomleft',
                       marker = TRUE,
                       group = "Night Club"
  ) %>%

  ##Legend events
  #addLegend("bottomleft", 
            #pal = palette_venues, 
            #values = venues_data$Eventi,
            #title = "Events:",
            #labFormat = labelFormat(suffix = " "),
            #opacity = 1,
            #group = "Events") %>%
  
  
  ##Legend capacity
  #addLegend("bottomleft", 
            #pal = palette_capacity, 
            #values = venues_data$Eventi,
            #title = "Capacity:",
            #labFormat = labelFormat(suffix = " "),
            #opacity = 1,
            #group = "Capacity") %>% 
  
  
  
  ##addMinicharts(
    #cerchie_charts_data$Latitude, 
    #cerchie_charts_data$Longitude,
    #chartdata = select(cerchie_charts_data, Teatri, Night, Cinema, Whisky, Dancing),
    #colorPalette = palette__cerchie_charts,
    #group = "Cerchie",
    #width = 45, 
    #height = 45
  #)  %>%
  
## Add a legend with the credits
addLegend("topright", 
          
          colors = c("trasparent"),
          labels=c("Milan 1958-1962: Music Topography of a City")) %>%
  
  addLegend("topright", 
            
            colors = c("trasparent"),
            labels=c("Geography of Performative Spaces - nicastromartin@gmail.com")) %>%
  
  
  ## PART 3 - IN THIS PART THE CODE MANAGE THE LAYERS' SELECTOR
  
  ## Add the layer selector which allows you to navigate the possibilities offered by this map
  
  addLayersControl(baseGroups = c(
                                  "Total",
                                  "Teatri/Sale da concerto",
                                  "Teatri",
                                  "Palazzetti",
                                  "Sale da concerto",
                                  "Night Club",
                                  "Cinema",
                                  "Dancing",
                                  "Whisky a go-go",
                                  "Empty layer"),
    
                 overlayGroups = c(  "1965",
                                     "Events",
                                     "Capacity",
                                     "Cerchie",
                                     "Heatmap"),
                   
                   
                   options = layersControlOptions(collapsed = TRUE)) %>%
  
  ## Hide the layers that the users can choose as they like
  hideGroup(c("Teatri",
              "Night Club",
              "Cinema",
              "Dancing",
              "Whisky a go-go",
              "Events",
              "Capacity",
             
              "Heatmap"))
              
              
              
              

## Show the map  
m
