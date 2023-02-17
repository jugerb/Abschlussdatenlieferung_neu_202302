### Data load & save
# Skript lädt Tabellen, benennt diese um und speichert sie als .rda-Datensätze

library(tidyverse)
library(lubridate)

#### 2019 ####
# data load
setwd('O:/U5279/Routinedaten/Abschlussdatenlieferung_neu_202302/Daten/01_roh/2019_roh')

stamm01 <-  read.csv("01_stamm_2019_2023-02-10 14-35-37.csv", sep=",")
# tg02
vz03 <-  read.csv("03_vz_2019_2023-02-10 14-36-57.csv", sep=",")
vzpg04 <-  read.csv("04_vz_pg_2019_2023-02-10 14-39-02.csv", sep=",")
pl05 <-  read.csv("05_pflegeleistungen_2019_2023-02-10 14-46-14.csv", sep=",")
plart06 <-  read.csv("06_art_pg_2019_2023-02-10 15-03-57.csv", sep=",")
pg07 <-  read.csv("07_pflegegeld_2019_2023-02-10 15-39-17.csv", sep=",")
hkp08 <-  read.csv("08_hkp_2019_2023-02-10 15-55-03.csv", sep=",")
hkpgop09 <-  read.csv("09_hkp_gop_2019_2023-02-16 17-12-49.csv", sep=",")
hkpmedi09 <-  read.csv("09_gop_hkp_2019_2023-02-10 16-41-30.csv", sep=",")
sgbv10 <-  read.csv("10_sgbv_2019_2023-02-10 16-43-34.csv", sep=",")
kh11 <-  read.csv("11_KH_2019_2023-02-10 16-49-50.csv", sep=",")
kht12 <-  read.csv("12_kht_2019_2023-02-10 16-51-52.csv", sep=",")

# #hkpgops
# sum(hkpgop09$HKP_FALLNR %in% hkp08$HKP_FALLNR)
# sum(hkp08$HKP_FALLNR %in% hkpgop09$HKP_FALLNR)
# 
# #hkpmedis
# sum(hkpmedi09$HKP_FALLNR %in% hkp08$HKP_FALLNR)
# sum(hkp08$HKP_FALLNR %in% hkpmedi09$HKP_FALLNR)

# data save
setwd('O:/U5279/Routinedaten/Abschlussdatenlieferung_neu_202302/Daten/02_rdata/2019')

save(stamm01,file="stamm01.rda")
# tg02
save(vz03,file="vz03.rda")
save(vzpg04,file="vzpg04.rda")
save(pl05,file="pl05.rda")
save(plart06,file="plart06.rda")
save(pg07,file="pg07.rda")
save(hkp08,file="hkp08.rda")
save(hkpgop09,file="hkpgop09.rda")
save(hkpmedi09,file="hkpmedi09.rda")
save(sgbv10,file="sgbv10.rda")
save(kh11,file="kh11.rda")
save(kht12,file="kht12.rda")


#### 2020 ####
setwd('O:/U5279/Routinedaten/Abschlussdatenlieferung20_21/Daten/02_roh')

stamm01 <-  read.csv("01_stamm_20-21_2022-07-20 18-55-30.csv", sep=",")
tg02 <-  read.csv("02_tg2_20_21_08-04 17-31-03.csv", sep=",")
vz03 <-  read.csv("03_vz_20-21_2022-07-20 18-57-44.csv", sep=",")
vzpg04 <-  read.csv("04_vz_pg_20-21_2022-07-20 19-01-26.csv", sep=",")
pl05 <-  read.csv("05_pflegeleistungen_20-21_2022-07-21 09-25-08.csv", sep=",")
plart06 <-  read.csv("06_art_pg_20_21_2212202022-12-20 15-53-22.csv", sep=",")
pg07 <-  read.csv("07_pflegegeld_20_21_220722.csv", sep=",")
hkp08 <-  read.csv("08_hkp_20-21_2022-07-21 14-31-31.csv", sep=",")
hkpgop09 <-  read.csv("09_gop_hkp_20-21_2022-07-21 15-25-41.csv", sep=",")
sgbv10 <-  read.csv("10_sgbv_20-21_2022-07-21 15-31-46.csv", sep=",")
kh11 <-  read.csv("11_kh_20-21_2022-07-21 15-37-30.csv", sep=",")
kht12 <-  read.csv("12_kht_20-21_2022-07-21 15-41-21.csv", sep=",")


# data save
setwd('O:/U5279/Routinedaten/Abschlussdatenlieferung_neu_202302/Daten/02_rdata/2020')

# nur 2020 übrig behalten
stamm01 <- stamm01 %>% filter(V_STERBEDATUM == '' | ymd(V_STERBEDATUM) <= as.Date('2020-12-31'))
save(stamm01, file="stamm01.rda")

save(tg02, file="tg02.rda")

# nur 2020 übrig behalten
vz03 <- vz03 %>% filter(ymd(V_VZ_VON) <= as.Date('2020-12-31'))
save(vz03, file="vz03.rda")

# nur 2020 übrig behalten
vzpg04 <- vzpg04 %>% filter(ymd(V_PG_VON) <= as.Date('2020-12-31'))
save(vzpg04, file="vzpg04.rda")

# PL und PL-Art gemeinsam betrachten
# PL-Art nur 2020 übrig behalten
plart06 <- plart06 %>% filter(ymd(LEISTUNG_VON) <= as.Date('2020-12-31'))
pl05 <- pl05 %>% filter(PL_RENR %in% plart06$PL_RENR)

save(pl05, file="pl05.rda")
save(plart06, file="plart06.rda")

# nur 2020 übrig behalten
pg07 <- pg07 %>% filter(ymd(LEISTUNG_VON) <= as.Date('2020-12-31'))
save(pg07, file="pg07.rda")

# nur 2020 übrig behalten
hkp08 <- hkp08 %>% filter(ymd(HKP_DATUM) <= as.Date('2020-12-31'))
save(hkp08, file="hkp08.rda")

# nur 2020 übrig behalten
hkpgop09 <- hkpgop09 %>% filter(HKP_FALLNR %in% hkp08$HKP_FALLNR)
save(hkpgop09, file="hkpgop09.rda")

# nur 2020 übrig behalten
sgbv10 <- sgbv10 %>% filter(ymd(HM_DATUM) <= as.Date('2020-12-31'))
save(sgbv10, file="sgbv10.rda")

# nur 2020 übrig behalten
kh11 <- kh11 %>% filter(ymd(KH_BEGINN_DAT) <= as.Date('2020-12-31'))
save(kh11, file="kh11.rda")

# nur 2020 übrig behalten
kht12 <- kht12 %>% filter(ymd(KT_DATUM) <= as.Date('2020-12-31'))
save(kht12, file="kht12.rda")


#### 2021 ####
setwd('O:/U5279/Routinedaten/Abschlussdatenlieferung_neu_202302/Daten/01_roh/2021_roh')

stamm01 <-  read.csv("01_stamm_2021_2023-02-14 15-27-35.csv", sep=",")
# tg02
vz03 <-  read.csv("03_vz_2021_2023-02-14 15-28-55.csv", sep=",")
vzpg04 <-  read.csv("04_vz_pg_2021_2023-02-14 15-30-14.csv", sep=",")
pl05 <-  read.csv("05_pflegeleistungen_2021_2023-02-14 15-47-03.csv", sep=",")
plart06 <-  read.csv("06_art_pg_2021_2023-02-14 16-35-34.csv", sep=",")
pg07 <-  read.csv("07_pflegegeld_2021_2023-02-14 18-02-39.csv", sep=",")
hkp08 <-  read.csv("08_hkp_2021_2023-02-14 19-36-18.csv", sep=",")
hkpgop09 <-  read.csv("09_hkp_gop_2021_2023-02-16 17-22-30.csv", sep=",")
hkpmedi09 <-  read.csv("09_gop_hkp_2021_2023-02-14 18-36-37.csv", sep=",")
sgbv10 <-  read.csv("10_sgbv_2021_2023-02-14 18-39-15.csv", sep=",")
kh11 <-  read.csv("11_kh_2021_2023-02-14 18-55-36.csv", sep=",")
kht12 <-  read.csv("12_kht_2021_2023-02-14 19-05-51.csv", sep=",")

# #hkpgops
# sum(hkpgop09$HKP_FALLNR %in% hkp08$HKP_FALLNR)
# sum(hkp08$HKP_FALLNR %in% hkpgop09$HKP_FALLNR)
# 
# #hkpmedis
# sum(hkpmedi09$HKP_FALLNR %in% hkp08$HKP_FALLNR)
# sum(hkp08$HKP_FALLNR %in% hkpmedi09$HKP_FALLNR)

# data save
setwd('O:/U5279/Routinedaten/Abschlussdatenlieferung_neu_202302/Daten/02_rdata/2021')

save(stamm01,file="stamm01.rda")
# tg02
save(vz03,file="vz03.rda")
save(vzpg04,file="vzpg04.rda")
save(pl05,file="pl05.rda")
save(plart06,file="plart06.rda")
save(pg07,file="pg07.rda")
save(hkp08,file="hkp08.rda")
save(hkpgop09,file="hkpgop09.rda")
save(sgbv10,file="sgbv10.rda")
save(kh11,file="kh11.rda")
save(kht12,file="kht12.rda")


