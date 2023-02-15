library(epiDisplay)
library(tidyverse) #alle tidy-packages auf einmal
library(lubridate)
library(stringr)
library(psych)
library(dplyr)
library(dlookr)
library(readxl)
library(janitor)
library(openxlsx)


setwd("O:/U5279/Routinedaten/Abschlussdatenlieferung20_21/Daten")
load("data11.Rda")


ausschluss_pg <- read_excel("O:/U5279/Routinedaten/Abschlussdatenlieferung20_21/Daten/ausschluss_pg.xlsx") 
ausschluss_hkp <- read_excel("O:/U5279/Routinedaten/Abschlussdatenlieferung20_21/Daten/ausschluss_hkp.xlsx") 



#*************
#Start Bereinigung TG1 

# IDs mit TG1 filtern
help1 <- data11 %>% filter(TG=="TG1") %>% 
  group_by(V_ID) %>% 
  summarise(n=n())

help2 <- left_join(data11, help1,by=c("V_ID"))

help3 <- help2 %>% filter(!(is.na(n)))

#*************
#Bereinigung fehlende Daten April

## filter Ende März
help4 <- help3 %>% filter(END_DATE=="2021-03-31")

## filter Beginn Juni
help5 <- help3 %>% filter(START_DATE=="2021-05-01") %>% select(V_ID,TG,START_DATE, END_DATE  )

## wieder verbinden, nun eine Zeile pro Versicherten
help6 <- left_join(help4, help5, by=c("V_ID", "TG"))
help7 <- help6 %>% rowwise() %>%  mutate(START_DATE=min(START_DATE.x, START_DATE.y),
                                         END_DATE=max(END_DATE.x, END_DATE.y)) %>% 
  dplyr::select(-c(START_DATE.x, START_DATE.y,END_DATE.x, END_DATE.y ))

# In Data 11 die 3 irrelevanten alten Intervalle entfernen
help8 <- help7 %>% select(V_ID) %>% mutate(marker=1)

data11a <- left_join(data11, help8,by=c("V_ID"))

data11b <- data11a %>% filter((marker==1 & (END_DATE=="2021-03-31"|START_DATE=="2021-04-01"|START_DATE=="2021-05-01"))) %>% 
  dplyr::select(V_ID,START_DATE, END_DATE,marker ) 

data11c <- left_join(data11,data11b, by=c("V_ID","START_DATE", "END_DATE"))

data11d <- data11c %>% filter(is.na(marker))

# neuen Intervalle einfügen
data11e <- bind_rows(data11d, help7) %>% dplyr::select(-c(n, marker))


#*************
#Bereinigung fehlende Daten Juli
# IDs mit TG1 filtern (schon mit neuem Datensatz)
help11 <- data11e %>% filter(TG=="TG1") %>% 
  group_by(V_ID) %>% 
  summarise(n=n())

help12 <- left_join(data11e, help11,by=c("V_ID"))

help13 <- help12 %>% filter(!(is.na(n)))

## filter Ende Juni
help14 <- help13 %>% filter(END_DATE=="2021-06-30")

## filter Beginn August
help15 <- help3 %>% filter(START_DATE=="2021-08-01") %>% select(V_ID,TG,START_DATE, END_DATE  )

## wieder verbinden, nun eine Zeile pro Versicherten
help16 <- left_join(help14, help15, by=c("V_ID", "TG"))
help17 <- help16 %>% rowwise() %>%  mutate(START_DATE=min(START_DATE.x, START_DATE.y),
                                         END_DATE=max(END_DATE.x, END_DATE.y)) %>% 
  dplyr::select(-c(START_DATE.x, START_DATE.y,END_DATE.x, END_DATE.y ))

# In Data 11 die 3 irrelevanten alten Intervalle entfernen
help18 <- help17 %>% select(V_ID) %>% mutate(marker=1)

data11f <- left_join(data11e, help18,by=c("V_ID"))

data11g <- data11f %>% filter((marker==1 & (END_DATE=="2021-06-30"|START_DATE=="2021-07-01"|START_DATE=="2021-08-01"))) %>% 
  dplyr::select(V_ID,START_DATE, END_DATE,marker ) 

data11h <- left_join(data11e,data11g, by=c("V_ID","START_DATE", "END_DATE"))

data11i <- data11h %>% filter(is.na(marker))

# neuen Intervalle einfügen
data11j <- bind_rows(data11i, help17) %>% dplyr::select(-c(n, marker))


#*************
#Datencheck

# IDs mit TG1 filtern
help21 <- data11j %>% filter(TG=="TG1") %>% 
  group_by(V_ID) %>% 
  summarise(n=n())

help22 <- left_join(data11j, help21,by=c("V_ID"))

help23 <- help22 %>% filter(!(is.na(n)))

# erste Zusammenfassung
data11j<- data11j%>% dplyr::mutate(intervalldauer = as.double(END_DATE - START_DATE +1))
sum1 <- data11j %>% group_by(TG) %>% 
  summarise(n= n_distinct(V_ID),
            bt= sum(intervalldauer))

sum1a <- data11j %>% ungroup() %>% 
  summarise(n= n_distinct(V_ID),
            bt= sum(intervalldauer))%>%  mutate(TG="alle")

sum1 <- bind_rows(sum1, sum1a)

#*************
# Ausschluss Altersgruppen unter 60 Jahren 
table(data11j$V_ALTER)
data11j2 <- data11j %>% filter(!(V_ALTER==1 | V_ALTER==2))
table(data11j2$V_ALTER)

sum2 <- data11j2 %>% group_by(TG) %>% 
  summarise(n= n_distinct(V_ID),
            bt= sum(intervalldauer))

sum2a <- data11j2 %>% ungroup() %>% 
  summarise(n= n_distinct(V_ID),
            bt= sum(intervalldauer))%>%  mutate(TG="alle")

sum2 <- bind_rows(sum2, sum2a)


#*************
# Auschluss a.G. von Pflegegeld
data11k <- left_join(data11j2,ausschluss_pg, by=c("V_ID"))
data11k <- data11k %>% filter(is.na(exkl)) %>% dplyr::select(-c("exkl"))

sum3 <- data11k %>% group_by(TG) %>% 
  summarise(n= n_distinct(V_ID),
            bt= sum(intervalldauer))

sum3a <- data11k %>% ungroup() %>% 
  summarise(n= n_distinct(V_ID),
            bt= sum(intervalldauer))%>%  mutate(TG="alle")

sum3 <- bind_rows(sum3, sum3a)

#*************
# Auschluss a.G. von HKP
data11l <- left_join(data11k,ausschluss_hkp, by=c("V_ID"))
data11l <- data11l %>% filter(is.na(exkl))%>% dplyr::select(-c("exkl"))

sum4 <- data11l %>% group_by(TG) %>% 
  summarise(n= n_distinct(V_ID),
            bt= sum(intervalldauer))

sum4a <- data11l %>% ungroup() %>% 
  summarise(n= n_distinct(V_ID),
            bt= sum(intervalldauer)) %>%  mutate(TG="alle")

sum4 <- bind_rows(sum4, sum4a)


#*************
# Daten speichern

# Dauer des Intervalls
data11_neu <- data11l%>% dplyr::mutate(intervalldauer = as.double(END_DATE - START_DATE +1))

save(data11_neu,file="O:/U5279/Routinedaten/Abschlussdatenlieferung20_21/Daten/data11_neu.Rda")


setwd("O:/U5279/Routinedaten/Abschlussdatenlieferung20_21/Ergebnisse/Excel/")
list_of_datasets <- list("sum1" =sum1,"sum2" =sum2,"sum3" =sum3,"sum4" =sum4)

write.xlsx(list_of_datasets, file = "02b_Fallzahlen.xlsx")



