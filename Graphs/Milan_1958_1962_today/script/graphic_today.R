# Creazione del dataframe con i dati
dati <- data.frame(
  percentuale = c(42.86, 57.14, 0, 100, 5.13, 94.87, 0, 100, 44.12, 55.88, 0, 100, 46.67, 53.33, 0, 100, 0, 100, 28, 89),
  stato = c("attivo", "non attivo", "attivo", "non attivo", "attivo", "non attivo", "attivo", "non attivo", "attivo", "non attivo", "attivo", "non attivo", "attivo", "non attivo", "attivo", "non attivo", "attivo", "non attivo", "attivo", "non attivo"),
  categoria = c("Cinema Teatro", "Cinema Teatro", "Dancing", "Dancing", "Night club", "Night club", "Palazzetto", "Palazzetto", "Sala da concerto", "Sala da concerto", "Teatro", "Teatro", "Teatro/Sala da concerto", "Teatro/Sala da concerto", "Teatro/Sala da concerto/Dancing", "Teatro/Sala da concerto/Dancing", "Whisky a go-go", "Whisky a go-go", "Totale", "Totale")
)

# Definizione dell'ordine personalizzato delle categorie
ordine_categorie <- c("Totale",
  "Teatro", "Cinema Teatro", "Dancing", "Night club", "Palazzetto", 
  "Sala da concerto", "Teatro/Sala da concerto", "Teatro/Sala da concerto/Dancing", "Whisky a go-go"
)


# Creazione di un nuovo fattore con l'ordine personalizzato delle categorie
dati$categoria <- factor(dati$categoria, levels = ordine_categorie)

#Definizione dei colori personalizzati
colori_personalizzati <- c("attivo" = "green", "non attivo" = "red")


# Trasparenza dei colori
trasparenza <- 0.5  # Imposta il valore di trasparenza desiderato

# Installazione e caricamento della libreria ggplot2 (se non è già installata)
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}
library(ggplot2)

# Creazione dell'istogramma doppio con colori personalizzati
istogramma <- ggplot(dati, aes(x = categoria, y = percentuale, fill = stato)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_manual(values = alpha(colori_personalizzati, alpha = trasparenza)) +  
  labs(x = NULL, y = "Percentuale (%)", title = NULL) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Visualizzazione dell'istogramma
print(istogramma)


#







