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
library(raster)
library(mapview)
library(leafem)
library(leafpop)
library(sf)
library(htmltools)

## PART 1 - IN THIS PART THE CODE READS THE FILES AND ATTRIBUTES COLORS AND ICONS TO ELEMENTS

## Shapefile night club
Night_Club <- readOGR('Night_Club/Night_Club.shp')

## Shapefile cinema
Cinema <- readOGR('Cinema/Cinema.shp')

## Shapefile teatri
Teatri <- readOGR('Teatri/Teatri.shp')

## Palette night club
palette_night_club <- colorFactor(palette = "YlOrBr", domain = Night_Club$tipologia)


## Palette cinema
palette_cinema <- colorFactor(palette = "Dark2", domain = Cinema$tipologia)


## Palette teatri
palette_teatri <- colorFactor(palette = "Set1", domain = Teatri$tipologia)

##Edges palette
palette_edges <- colorNumeric(palette = "viridis", domain = NULL)


##performers csv
performers_data <- read.csv("performers.csv")
##performers popup
content_performers <- paste(sep = "<br/>",
                 paste0("<div class='leaflet-popup-scrolled' style='max-width:200px;max-height:100px'>"),
                 paste0(performers_data$Nome),
                 paste0("</div>"))

## Shapefile performers
Edges <- readOGR('Edges/Edges.shp')
                

##venues csv
venues_data <- read.csv("venues.csv")
## Create a html popup
content <- paste(sep = "<br/>",
                 paste0("<div class='leaflet-popup-scrolled' style='max-width:400px;max-height:400px'>"),
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

##Events palette
palette_venues <- colorNumeric("YlGn", venues_data$Eventi)
##Capacity palette
palette_capacity <- colorNumeric("YlOrRd", domain = venues_data$Capienza)






## PART 2 - IN THIS PART THE CODE ADDS ELEMENT ON THE MAP LIKE POLYGONS, POINTS AND IMAGES.

m <- leaflet() %>%
  ## Basemap
  ##addTiles(tile)        %>%
  addProviderTiles(providers$CartoDB.Positron)  %>%
  
  ## Add a zoom reset button
  addResetMapButton() %>%
  ## Add a Minimap to better navigate the map
  addMiniMap() %>%
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
              color = ~palette_night_club(tipologia),
              group = "Night Clubs",
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
  ## Markers with clustering options
  addAwesomeMarkers(data = venues_data, 
                    lng = ~Longitude,
                    lat = ~Latitude, 
                    popup = c(content), 
                    group = "Venues",
                    options = popupOptions(maxWidth = 100, maxHeight = 150), 
                    clusterOptions = markerClusterOptions())%>%
  ##Labels
  addLabelOnlyMarkers(data = venues_data,
                      lng = ~Longitude,
                      lat = ~Latitude,
                      label= ~paste(Nome),
                      group = "Labels",
                      labelOptions = labelOptions(noHide = TRUE, direction = 'top', textOnly = TRUE)) %>%
  ## Edges performers 
  addPolygons(data = Edges,
              stroke = FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = ~palette_edges,
              group = "Edges",) %>%
                  
  
  ## Markers performers
  addAwesomeMarkers(data = performers_data, 
                    lng = ~Longitude,
                    lat = ~Latitude, 
                    label = ~Nome, 
                    group = "Performers",
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
  ##Legend nights
  addLegend("bottomleft", 
            pal = palette_night_club, 
            values = Night_Club$tipologia,
            title = "Night Clubs:",
            labFormat = labelFormat(suffix = " "),
            opacity = 1,
            group = "Night Clubs") %>%
  ##Legend teatri
  addLegend("bottomleft", 
            pal = palette_teatri, 
            values = Teatri$tipologia,
            title = "Teatri:",
            labFormat = labelFormat(suffix = " "),
            opacity = 1,
            group = "Teatri") %>%
  ##Legend cinema
  addLegend("bottomleft", 
            pal = palette_cinema, 
            values = Cinema$tipologia,
            title = "Cinema:",
            labFormat = labelFormat(suffix = " "),
            opacity = 1,
            group = "Cinema") %>%
  
  ##Legend events
  addLegend("bottomleft", 
            pal = palette_venues, 
            values = venues_data$Eventi,
            title = "Events:",
            labFormat = labelFormat(suffix = " "),
            opacity = 1,
            group = "Events") %>%
  
  ##Legend capacity
  addLegend("bottomleft", 
            pal = palette_capacity, 
            values = venues_data$Eventi,
            title = "Capacity:",
            labFormat = labelFormat(suffix = " "),
            opacity = 1,
            group = "Capacity") %>%
  
  ## Add a legend with the credits
  addLegend("topright", 
            
            colors = c("trasparent"),
            labels=c("Martin Nicastro - nicastromartin@gmail.com"),
            
            title="Venues in Milan (1958-1962): ") %>%
  
  
  ## PART 3 - IN THIS PART THE CODE MANAGE THE LAYERS' SELECTOR
  
  ## Add the layer selector which allows you to navigate the possibilities offered by this map
  
  addLayersControl(baseGroups = c("Venues",
                                  "Empty"),
                   
                   overlayGroups = c("Night Clubs",
                                     "Teatri",
                                     "Cinema",
                                     "Events",
                                     "Capacity",
                                     "Performers",
                                     "Edges",
                                     "Labels"),
                   
                   
                   options = layersControlOptions(collapsed = TRUE)) %>%
  
  ## Hide the layers that the users can choose as they like
  hideGroup(c("Events",
              "Capacity",
              "Performers",
              "Edges",
              "Labels"))

## Show the map  
m
