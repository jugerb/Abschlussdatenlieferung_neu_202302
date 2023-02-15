### Data load & save
# Skript lädt Tabellen, benennt diese um und speichert sie als .rda-Datensätze


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
hkpgop09 <-  read.csv("09_gop_hkp_2019_2023-02-10 16-41-30.csv", sep=",")
sgbv10 <-  read.csv("10_sgbv_2019_2023-02-10 16-43-34.csv", sep=",")
kh11 <-  read.csv("11_KH_2019_2023-02-10 16-49-50.csv", sep=",")
kht12 <-  read.csv("12_kht_2019_2023-02-10 16-51-52.csv", sep=",")

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
save(sgbv10,file="sgbv10.rda")
save(kh11,file="kh11.rda")
save(kht12,file="kht12.rda")


#### 2020 ####
#to do


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
hkpgop09 <-  read.csv("09_gop_hkp_2021_2023-02-14 18-36-37.csv", sep=",")
sgbv10 <-  read.csv("10_sgbv_2021_2023-02-14 18-39-15.csv", sep=",")
kh11 <-  read.csv("11_kh_2021_2023-02-14 18-55-36.csv", sep=",")
kht12 <-  read.csv("12_kht_2021_2023-02-14 19-05-51.csv", sep=",")

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


