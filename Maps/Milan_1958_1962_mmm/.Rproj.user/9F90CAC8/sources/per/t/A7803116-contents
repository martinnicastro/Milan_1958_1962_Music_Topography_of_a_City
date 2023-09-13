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
library(leaflegend)
library(htmlwidgets)
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
Night_Club <- st_read('data/Night_Club/Night_Club.shp')

## Shapefile cinema
Cinema <- st_read('data/Cinema/Cinema.shp')

## Shapefile teatri
Teatri <- st_read('data/Teatri/Teatri.shp')

## Shapefile whisky
Whisky <- st_read('data/Whisky/Whisky.shp')

## Shapefile dancing
Dancing <- st_read('data/Dancing/Dancing.shp')

## Shapefile cerchie
Cerchie <- st_read('data/Cerchie/Cerchie.shp')

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

## Palette cerchie
palette_cerchie <- colorFactor(palette = c("yellow", "#F22814", "#14F297"), domain = Cerchie$nome)


##totale csv
venues_data <- read.csv("data/venues.csv")

##totale html popup
venues_content <- paste(sep = "<br/>",
                        paste0("<div class='leaflet-popup-scrolled' style='max-width:600px;max-height:400px'>"),
                        paste0("<b>", "Name: ", "</b>", venues_data$Nome),
                        paste0("<b>", "Promoter: ", "</b>", venues_data$Organizzatore),
                        paste0("<b>", "Address: ", "</b>", venues_data$Indirizzo),
                        paste0("<b>", "Category: ", "</b>", venues_data$Tipologia),
                        paste0("<b>", "Events: ", "</b>", venues_data$Eventi),
                        paste0("<b>", "Capacity: ", "</b>", venues_data$Capienza),
                        paste0(venues_data$Thumbnails),
                        paste0(venues_data$Immagini_originali),
                        paste0("<b>", "Photo date: ", "</b>", venues_data$Data_foto),
                        paste0("</div>"))
## Videomap csv

video_data <- read.csv("data/video_map.csv")


##icon list total
icons_video <- awesomeIconList (Bruno_Canino = makeAwesomeIcon (icon = 'facetime-video', markerColor = 'blue'), 
                                Enrico_Intra = makeAwesomeIcon (icon = 'facetime-video', markerColor = 'red'),
                                Gaetano_Liguori = makeAwesomeIcon (icon = 'facetime-video', markerColor = 'orange'),
                                Giacomo_Manzoni = makeAwesomeIcon (icon = 'facetime-video', markerColor = 'darkgreen'),
                                Gian_Franco_Reverberi = makeAwesomeIcon (icon = 'facetime-video', markerColor = "pink"),
                                Lino_Patruno = makeAwesomeIcon (icon = 'facetime-video', markerColor = 'beige'),
                                Natale_Massara = makeAwesomeIcon (icon = 'facetime-video', markerColor = 'purple'),
                                Paolo_Tomelleri = makeAwesomeIcon(icon = 'facetime-video', markerColor = 'gray'))



##video palette

palette_video <- colorFactor(palette = c("#5599F0", "#D41E1E", 'orange',"#5A7949", '#FFA8F7',"#F6C569","#B818AF","#716A6A"), domain = video_data$Intervistato)

                              

##today csv
today_data <- read.csv("data/milano_oggi_ok.csv")

##today html popup
today_content <- paste(sep = "<br/>",
                       paste0("<div class='leaflet-popup-scrolled' style='max-width:1000px;max-height:1000px'>"),
                       paste0("<b>", "Nome: ", "</b>", today_data$Nome),
                       paste0("<b>", "Categoria: ", "</b>", today_data$Categoria),
                       paste0("<b>", "Stato: ", "</b>", today_data$Stato),
                       paste("<style> div.leaflet-popup-content {width:auto !important;}</style>", today_data$Thumbnail),
                       paste0("<b>", "Data foto: ", "</b>", today_data$Data),
                       paste0("</div>"))

## Palette today
palette_today <- colorFactor(palette = c( "green", "#fd0012"),  domain = today_data$Stato)

## videomap popup

content_video <- paste(sep = "<br/>",
                       paste0("<div class='leaflet-popup-scrolled' style='max-width:700px;max-height:500px'>"),
                       paste0("<b>", "Venue: ", "</b>", video_data$Nome),
                       paste0("<b>", "Interviewee: ", "</b>", video_data$Intervistato),
                       paste0("<b>", "Interview date: ", "</b>", video_data$Data_intervista),
                       #paste0(video_data$Video_originale),
                       paste0(video_data$Video_player_2),
                       paste0("</div>"))



##Events palette
palette_venues <- colorNumeric("YlGn", venues_data$Eventi)
##Capacity palette
palette_capacity <- colorNumeric("YlOrRd", domain = venues_data$Capienza)


##night cerchie csv
#night_cerchie_data <- read.csv("night_cerchie.csv")

## Palette cerchie night
#palette_night_cerchie <- colorFactor(palette = c("#F7F4F4","#F22814", "#14DEF2" ), domain = night_cerchie_data$Percentuale)

## Palette cerchie
#palette_cerchie <- colorFactor(palette = c("#14DEF2", "#F22814"), domain = Cerchie$id)



## PART 2 - IN THIS PART THE CODE ADDS ELEMENT ON THE MAP LIKE POLYGONS, POINTS AND IMAGES.

m <- leaflet(options = leafletOptions(preferCanvas = TRUE)) %>%
  ## Basemap
  ##addTiles(tile)        %>%
  addProviderTiles(providers$CartoDB.Positron, options = providerTileOptions(
    updateWhenZooming = TRUE,      
    updateWhenIdle = TRUE,
    maxZoom = 18)      )  %>%
  
  
  
  ## Add a zoom reset button
  addResetMapButton() %>%
  
  ## Add a coordinates reader
  leafem::addMouseCoordinates() %>%
  ## define the view
  setView(lng = 9.18835, 
          lat = 45.4610, 
          zoom = 13 ) %>%
  

  
  
  ##Polygons cinema_2
  addPolygons(data = Cinema,
              stroke = FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = ~palette_cinema(tipologia),
              group = "Cinema",
              label = ~paste(nome)) %>%
  
  ##Polygons teatri_2
  addPolygons(data = Teatri,
              stroke = FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = ~palette_teatri(tipologia),
              group = "Teatri",
              label = ~paste(nome)) %>%
  
  ##Polygons whisky_2
  addPolygons(data = Whisky,
              stroke = FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = ~palette_whisky(tipologia),
              group = "Whisky a go-go",
              label = ~paste(nome)) %>%
  
  ##Polygons dancing_2
  addPolygons(data = Dancing,
              stroke = FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = ~palette_dancing(tipologia),
              group = "Dancing",
              label = ~paste(nome)) %>%
  
  ##Polygons Night_2 
  addPolygons(data = Night_Club,
              stroke = FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = 1,
              color = ~palette_night_club(tipologia),
              group = "Night club",
              label = ~paste(nome)) %>%
  
  
  ## Markers video
  addAwesomeMarkers(data = video_data, 
                    lng = ~Longitude,
                    lat = ~Latitude,
                    icon = ~icons_video[Intervistato_icon],
                    popup = c(content_video), 
                    group = "Videomap",
                    options = popupOptions(maxWidth = 700, maxHeight = 350),
                    label = ~paste(video_data$Intervistato),
                    clusterOptions = markerClusterOptions()
  )%>%
  
 
  
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

  ##Polygons Cerchie
  addPolygons(data = Cerchie,
              weight = 0.8,
              opacity = 0.8,
              stroke = TRUE,
              fillColor = "red",
              smoothFactor = 0.2, 
              fillOpacity = 0,
              color = ~palette_cerchie(nome),
              group = "Cerchie"
  ) %>% 
  
  ##Legend nights
  addLegend("bottomleft", 
            pal = palette_night_club, 
            values = Night_Club$tipologia,
            title = "Night Club:",
            labFormat = labelFormat(suffix = " "),
            opacity = 1,
            group = "Night Club") %>%
  
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
  
  
  ##Legend whisky
  addLegend("bottomleft", 
            pal = palette_whisky, 
            values = Whisky$tipologia,
            title = "Whisky a go-go:",
            labFormat = labelFormat(suffix = " "),
            opacity = 1,
            group = "Whisky a go-go") %>%
  
  ##Legend dancing
  addLegend("bottomleft", 
            pal = palette_dancing, 
            values = Dancing$tipologia,
            title = "Dancing:",
            labFormat = labelFormat(suffix = " "),
            opacity = 1,
            group = "Dancing") %>%
  
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
  
  ##Legend circles
  addLegend("bottomleft", 
            pal = palette_cerchie, 
            values = Cerchie$nome,
            title = "Cerchie:",
            labFormat = labelFormat(suffix = " "),
            opacity = 1,
            group = "Cerchie") %>%
  

  
  #addLegendAwesomeIcon(
    #iconSet = icons_video,
    #orientation = 'vertical',
    #title = htmltools::tags$div(
      #style = 'font-size: 14px;',
      #'Intervistati:'),
    #labelStyle = 'font-size: 12px;',
    #position = 'bottomright',
    #group = "Videomap",
    #marker = TRUE) %>%
  
##Legend video
addLegend("bottomright", 
          pal = palette_video, 
          values = video_data$Intervistato,
          title = "Intervistato:",
          labFormat = labelFormat(suffix = " "),
          opacity = 1,
          group = "Videomap") %>%
  
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
  
  ## Circle markers today
  addCircleMarkers(data = today_data, 
                   lng = ~Longitude,
                   lat = ~Latitude,
                   fillColor = ~palette_today(Stato),
                   color = "black",
                   weight = 1.5,
                   radius = 6,
                   stroke = TRUE,
                   fillOpacity = 1,
                   group = "Milan today",
                   popup = c(today_content),
                   label = ~paste(today_data$Nome 
                   )) %>%
  
  ##Legend today
  addLegend("bottomleft", 
            pal = palette_today, 
            values = today_data$Stato,
            title = "Stato:",
            labFormat = labelFormat(suffix = ""),
            opacity = 1,
            group = "Milan today") %>%
  
  ## Add a legend with the credits
  addLegend("topright", 
            
            colors = c("trasparent"),
            labels=c("Milan 1958-1962: Music Topography of a City")) %>%
  
  addLegend("topright", 
            
            colors = c("trasparent"),
            labels=c("Music Memories Map - nicastromartin@gmail.com")) %>%
  
  addLegend("topright", 
            
            colors = c("trasparent"),
            labels=c("Realized with the support of Small Grants AIUCD 2022")) %>%
  
  ## PART 3 - IN THIS PART THE CODE MANAGE THE LAYERS' SELECTOR
  
  ## Add the layer selector which allows you to navigate the possibilities offered by this map
  
  addLayersControl(baseGroups = c("1965",
                                  "1956",
                                  "Empty layer"),
                   
                   overlayGroups = c(  "Cinema",
                                       "Dancing",
                                       "Night Club",
                                       "Teatri",
                                       "Whisky a go-go",
                                       "Events",
                                       "Capacity",
                                       "Videomap",
                                       "Heatmap",
                                       "Cerchie",
                                       "Milan today"),
                   
                   
                   options = layersControlOptions(collapsed = TRUE)) %>%
  
  ## Hide the layers that the users can choose as they like
  hideGroup(c("Events",
              "Capacity",
              "Heatmap",
              "Cerchie",
              "Milan today"))





## Show the map  
m
