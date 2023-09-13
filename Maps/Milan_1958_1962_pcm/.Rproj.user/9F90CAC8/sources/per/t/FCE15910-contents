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
##install.packages("leaflegend")

## Call the libraries
library(leaflet)
library(leaflegend)
library(sp)
library(rgdal)
library(RColorBrewer)
library(leaflet.extras)
library(leaflet.minicharts)
library(htmlwidgets)
library(raster)
library(mapview)
library(leafem)
library(leafpop)
library(sf)
library(htmltools)


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
Teatri <- readOGR('data/Teatri/Teatri.shp')

## Shapefile whisky
Whisky <- readOGR('data/Whisky/Whisky.shp')

## Shapefile dancing
Dancing <- readOGR('data/Dancing/Dancing.shp')

## Shapefile cerchie
Cerchie <- readOGR('data/Cerchie/cerchie.shp')

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

## Palette night club
palette_night_club <- colorFactor(palette = c("#f9a515"), domain = Night_Club$tipologia)

## Palette cinema
palette_cinema <- colorFactor(palette = c("green"), domain = Cinema$tipologia)


## Palette teatri
palette_teatri <- colorFactor(palette = c("#fd0090", "#0090fd","#0012fd", "#fd0012",  "#900C3F" ),  domain = Teatri$tipologia)

## Palette whisky
palette_whisky <- colorFactor(palette = c("darkorchid"), domain = Whisky$tipologia)

## Palette dancing
palette_dancing <- colorFactor(palette = c("#f9ef15"), domain = Dancing$tipologia)

## Shapefile modularity 0
modularity1_data <- readOGR('data/modularity_0/modularity_0.shp')

## Shapefile modularity 1
modularity2_data <- readOGR('data/modularity_1/modularity_1.shp')

## Shapefile modularity 2
modularity3_data <- readOGR('data/modularity_2/modularity_2.shp')

## Shapefile modularity 3
modularity4_data <- readOGR('data/modularity_3/modularity_3.shp')

## Shapefile modularity 5
modularity5_data <- readOGR('data/modularity_5/modularity_5.shp')

## Shapefile modularity 6
modularity6_data <- readOGR('data/modularity_6/modularity_6.shp')

## Shapefile modularity 7
modularity7_data <- readOGR('data/modularity_7/modularity_7.shp')

## Shapefile modularity 8
modularity8_data <- readOGR('data/modularity_8/modularity_8.shp')

## Shapefile modularity 9
modularity9_data <- readOGR('data/modularity_9/modularity_9.shp')



##totale csv
venues_data <- read.csv("data/total_marker.csv")

##totale html popup
venues_content <- paste(sep = "<br/>",
                        paste0("<div class='leaflet-popup-scrolled' style='max-width:600px;max-height:400px'>"),
                        paste0("<b>", "Nome: ", "</b>", venues_data$Nome),
                        paste0("<b>", "Organizzatore: ", "</b>", venues_data$Organizzatore),
                        paste0("<b>", "Indirizzo: ", "</b>", venues_data$Indirizzo),
                        paste0("<b>", "Tipologia: ", "</b>", venues_data$Tipologia),
                        paste0("<b>", "Eventi: ", "</b>", venues_data$Eventi),
                        paste0("<b>", "Capienza: ", "</b>", venues_data$Capienza),
                        paste0(venues_data$Thumbnails),
                        paste0(venues_data$Immagini_originali),
                        paste0("<b>", "Data immagine: ", "</b>", venues_data$Data_foto),
                        paste0("</div>"))




##teatri csv
teatri_data <- read.csv("data/teatri.csv")

##teatri html popup
teatri_content <- paste(sep = "<br/>",
                        paste0("<div class='leaflet-popup-scrolled' style='max-width:600px;max-height:400px'>"),
                        paste0("<b>", "Nome: ", "</b>", teatri_data$Nome),
                        paste0("<b>", "Organizzatore: ", "</b>", teatri_data$Organizzatore),
                        paste0("<b>", "Indirizzo: ", "</b>", teatri_data$Indirizzo),
                        paste0("<b>", "Tipologia: ", "</b>", teatri_data$Tipologia),
                        paste0("<b>", "Eventi: ", "</b>", teatri_data$Eventi),
                        paste0("<b>", "Capienza: ", "</b>", teatri_data$Capienza),
                        paste0(teatri_data$Thumbnails),
                        paste0(teatri_data$Immagini_originali),
                        paste0("<b>", "Data immagine: ", "</b>", teatri_data$Data_foto),
                        paste0("</div>"))
##teatri icons
teatri_icons <- makeAwesomeIcon(icon = 'music', markerColor = 'blue')


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
cinema_icons <- makeAwesomeIcon(icon = 'blackboard', markerColor = 'green')


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
dancing_icons <- makeAwesomeIcon(icon = 'user', markerColor = 'beige')


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
night_icons <- makeAwesomeIcon(icon = 'glass', markerColor = 'orange')

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
whisky_icons <- makeAwesomeIcon(icon = 'volume-up', markerColor = 'purple')





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
    updateWhenIdle = TRUE)      )  %>%
  

  
  ## Add a zoom reset button
  addResetMapButton() %>%
  
  ## Add a coordinates reader
  leafem::addMouseCoordinates() %>%
  ## define the view
  setView(lng = 9.18835, 
          lat = 45.4610, 
          zoom = 13 ) %>%
  
  ## Edges modularity_1
  addPolylines(data = modularity1_data,
               stroke = TRUE, 
               smoothFactor = 0.2, 
               fillOpacity = 1,
               opacity = 1,
               color = "#0FEA00",
               weight = (modularity1_data$weight_2),
               group = "Network_1",
               label = (modularity1_data$weight)) %>%
  
  ## Edges modularity_2
  addPolylines(data = modularity2_data,
               stroke = TRUE, 
               smoothFactor = 0.2, 
               fillOpacity = 0.7,
               opacity = 1,
               color = "#1F4CC4",
               weight = (modularity2_data$weight_2),
               group = "Network_2",
               label = (modularity2_data$weight)) %>%
  
  ## Edges modularity_3
  addPolylines(data = modularity3_data,
               stroke = TRUE, 
               smoothFactor = 0.2, 
               fillOpacity = 1,
               opacity = 0.8,
               color = "#F1950B",
               weight = (modularity3_data$weight_2),
               group = "Network_3",
               label = (modularity2_data$weight)) %>%
  
  ## Edges modularity_4
  addPolylines(data = modularity4_data,
               stroke = TRUE, 
               smoothFactor = 0.2, 
               fillOpacity = 1,
               opacity = 1,
               color = "#14C4B3",
               weight = (modularity4_data$weight_2),
               group = "Network_4",
               label = (modularity4_data$weight)) %>%
  
  
  ## Edges modularity_5
  addPolylines(data = modularity5_data,
               stroke = TRUE, 
               smoothFactor = 0.2, 
               fillOpacity = 1,
               opacity = 1,
               color = "#0C8E0C",
               weight = (modularity5_data$weight_2),
               group = "Network_5",
               label = (modularity5_data$weight)) %>%
  
  ## Edges modularity_6
  addPolylines(data = modularity6_data,
               stroke = TRUE, 
               smoothFactor = 0.2, 
               fillOpacity = NULL,
               opacity = 1,
               color = "#0C4773",
               weight = (modularity6_data$weight_2),
               group = "Network_6",
               label = (modularity6_data$weight)) %>%
  
  ## Edges modularity_7
  addPolylines(data = modularity7_data,
               stroke = TRUE, 
               smoothFactor = 0.2, 
               fillOpacity = NULL,
               opacity = 1,
               color = "#9DA176",
               weight = (modularity7_data$weight_2),
               group = "Network_7",
               label = (modularity7_data$weight)) %>%
  
  ## Edges modularity_8
  addPolylines(data = modularity8_data,
               stroke = TRUE, 
               smoothFactor = 0.2, 
               fillOpacity = NULL,
               opacity = 1,
               color = "#1FEEEF",
               weight = (modularity8_data$weight_2),
               group = "Network_8",
               label = (modularity8_data$weight)) %>%
  
  ## Edges modularity_9
  addPolylines(data = modularity9_data,
               stroke = TRUE, 
               smoothFactor = 0.2, 
               fillOpacity = NULL,
               opacity = 1,
               color = "#600576",
               weight = (modularity9_data$weight_2),
               group = "Network_9",
               label = (modularity9_data$weight)) %>%
  
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
              group = "Venues",
              label = ~paste(nome)) %>%
  
  ##Polygons teatri_2
  addPolygons(data = Teatri,
              stroke = FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = ~palette_teatri(tipologia),
              group = "Venues",
              label = ~paste(nome)) %>%
  
  ##Polygons whisky_2
  addPolygons(data = Whisky,
              stroke = FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = ~palette_whisky(tipologia),
              group = "Venues",
              label = ~paste(nome)) %>%
  
  ##Polygons dancing_2
  addPolygons(data = Dancing,
              stroke = FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = ~palette_dancing(tipologia),
              group = "Venues",
              label = ~paste(nome)) %>%
  
  ##Polygons Night_2 
  addPolygons(data = Night_Club,
              stroke = FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = ~palette_night_club(tipologia),
              group = "Venues",
              label = ~paste(nome)) %>%
  
  
  
  
  ## Markers total
  addAwesomeMarkers(data = venues_data, 
                    lng = ~Longitude,
                    lat = ~Latitude,
                    icon = ~total_icons[Tipologia],
                    popup = c(venues_content), 
                    group = "Venues",
                    options = popupOptions(maxWidth = 100, maxHeight = 150), 
                    clusterOptions = markerClusterOptions())%>%

  
  
  ## Markers teatri
  addAwesomeMarkers(data = teatri_data, 
                    lng = ~Longitude,
                    lat = ~Latitude,
                    icon = teatri_icons,
                    popup = c(teatri_content), 
                    group = "Teatri",
                    options = popupOptions(maxWidth = 100, maxHeight = 150), 
                    clusterOptions = markerClusterOptions())%>%
  ## Markers cinema
  addAwesomeMarkers(data = cinema_data, 
                    lng = ~Longitude,
                    lat = ~Latitude,
                    icon = cinema_icons,
                    popup = c(cinema_content), 
                    group = "Cinema",
                    options = popupOptions(maxWidth = 100, maxHeight = 150), 
                    clusterOptions = markerClusterOptions())%>%
  

  
  ## Markers dancing
  addAwesomeMarkers(data = dancing_data, 
                    lng = ~Longitude,
                    lat = ~Latitude,
                    popup = c(dancing_content), 
                    icon = dancing_icons,
                    group = "Dancing",
                    options = popupOptions(maxWidth = 100, maxHeight = 150), 
                    clusterOptions = markerClusterOptions())%>%
  
  ## Markers night
  addAwesomeMarkers(data = night_data, 
                    lng = ~Longitude,
                    lat = ~Latitude,
                    icon = night_icons,
                    popup = c(night_content), 
                    group = "Night Club",
                    options = popupOptions(maxWidth = 100, maxHeight = 150), 
                    clusterOptions = markerClusterOptions())%>%
  
  
  ## Markers whisky
  addAwesomeMarkers(data = whisky_data, 
                    lng = ~Longitude,
                    lat = ~Latitude,
                    icon = whisky_icons,
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
  
  addLegendAwesomeIcon(iconSet = total_icons,
                       orientation = 'vertical',
                       title = htmltools::tags$div(
                         style = 'font-size: 14px;',
                         'Categories'),
                       labelStyle = 'font-size: 12px;',
                       position = 'bottomleft',
                       marker = TRUE,
                       group = "Venues"
  ) %>%
  
  ##Legend nights
  #addLegend("bottomleft", 
            #pal = palette_night_club, 
            #values = Night_Club$tipologia,
            #title = "Night Club:",
            #labFormat = labelFormat(suffix = ""),
            #opacity = 1,
            #group = "Venues") %>%
  
  ##Legend teatri
  #addLegend("bottomleft", 
            #pal = palette_teatri, 
            #values = Teatri$tipologia,
            #title = "Teatri:",
            #labFormat = labelFormat(suffix = " "),
            #opacity = 1,
            #group = "Venues") %>%
  
  ##Legend cinema
  #addLegend("bottomleft", 
            #pal = palette_cinema, 
            #values = Cinema$tipologia,
            #title = "Cinema:",
            #labFormat = labelFormat(suffix = " "),
            #opacity = 1,
            #group = "Venues") %>%
  
  
  ##Legend whisky
  #addLegend("bottomleft", 
            #pal = palette_whisky, 
            #values = Whisky$tipologia,
            #title = "Whisky a go-go:",
            #labFormat = labelFormat(suffix = " "),
            #opacity = 1,
            #group = "Venues") %>%
  
  ##Legend dancing
  #addLegend("bottomleft", 
            #pal = palette_dancing, 
            #values = Dancing$tipologia,
            #title = "Dancing:",
            #labFormat = labelFormat(suffix = " "),
            #opacity = 1,
            #group = "Venues") %>%
  
  ##Legend events
  #addLegend("bottomleft", 
            #pal = palette_venues, 
            #values = venues_data$Eventi,
            #title = "Eventi:",
            #labFormat = labelFormat(suffix = " "),
            #opacity = 1,
            #group = "Eventi") %>%
  
  ##Legend capacity
  #addLegend("bottomleft", 
            #pal = palette_capacity, 
            #values = venues_data$Eventi,
            #title = "Capienza:",
            #labFormat = labelFormat(suffix = " "),
            #opacity = 1,
            #group = "Capienza") %>%
  
  ##WMS 1956 
  addWMSTiles(
    wms_1956,
    layers = "0",
    group  = "1956",
    options = WMSTileOptions(format = "image/png", transparent = FALSE)
  )%>%
  
  ##WMS 1965 
  addWMSTiles(
    wms_1965,
    layers = "0",
    group  = "1965",
    options = WMSTileOptions(format = "image/png", transparent = FALSE)
  )%>%
  


  
  
  
  ## Add a legend with the credits
  addLegend("topright", 
            
            colors = c("trasparent"),
            labels=c("Milan 1958-1962: Music Topography of a City")) %>%
  
  addLegend("topright", 
            
            colors = c("trasparent"),
            labels=c("Performative Circuits Map - nicastromartin@gmail.com")) %>%
  
  
  ## PART 3 - IN THIS PART THE CODE MANAGE THE LAYERS' SELECTOR
  
  ## Add the layer selector which allows you to navigate the possibilities offered by this map
  
  addLayersControl(baseGroups = c("1965",
                                  "1956",
                                  "Empty layer"),
                   
                   overlayGroups = c("Venues",
                                     "Events",
                                     "Capacity",
                                     "Cerchie",
                                     "Network_1",
                                     "Network_2",
                                     "Network_3",
                                     "Network_4",
                                     "Network_5",
                                     "Network_6",
                                     "Network_7",
                                     "Network_8",
                                     "Network_9"),
                   
                   
                   options = layersControlOptions(collapsed = TRUE)) %>%
  
  ## Hide the layers that the users can choose as they like
  hideGroup(c("Night Club",
               "Teatri",
               "Cinema",
               "Dancing",
              "Whisky a go-go",
               "Events",
              "Capacity",
              "Network_1",
              "Network_2",
              "Network_3",
              "Network_4",
              "Network_5",
              "Network_6",
              "Network_7",
              "Network_8",
              "Network_9"))
              
              
              
              

## Show the map  
m
