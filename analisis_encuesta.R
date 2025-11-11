# Analisis de encuesta a estudiantes y graduades de Cs. Biologicas en UMAI
# Uso de R y otras tecnologias de analisis estadistico en las materias Biometria I y II

# Trabajo presentado en LatinR 2025
# Russo M.G., Arencibia V., del Castillo D.

library(readxl)
library(tidyr)
library(dplyr)
library(likert)

datos <- as.data.frame(read_xlsx("uso_R_UMAI.xlsx"))
#colnames(datos)

likert_1 <- datos[,14:21]
#unique(likert_1[,2])
niveles <- c("Muy en desacuerdo", "En desacuerdo", "Algo de acuerdo", "De acuerdo", "Muy de acuerdo")

likert_1 <- likert_1 %>% 
  mutate(across(1:8, factor, levels=niveles))
str(likert_1)

plot_1 <- likert(likert_1, nlevels = 5)
plot(plot_1)

likert_2 <- datos[,22:31]
likert_2 <- likert_2 %>% 
  slice(-6, -11) %>% # filtrado de personas que no utilizaron R
  drop_na() 

niveles2 <- c("Muy en desacuerdo", "En desacuerdo", "No sé", "Algo de acuerdo", "De acuerdo", "Muy de acuerdo")

likert_2 <- likert_2 %>% 
  mutate(across(1:10, factor, levels=niveles2))
str(likert_2)

plot_2 <- likert(likert_2, nlevels = 6)
plot(plot_2)
