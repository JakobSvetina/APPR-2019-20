# 2. faza: Uvoz podatkov


#Tabela 1: Namen uporabe interneta po starostnih razredih in spolu

starostni_razredi_in_spol <- read_csv2("podatki/starostni_razredi_in_spol.csv", col_names = TRUE, na="-", locale=locale(encoding="Windows-1250"))

#Tabela 2: Namen uporabe interneta po izobrazbi in spolu

izobrazba_in_spol <- read_csv2("podatki/izobrazba_in_spol.csv", col_names = TRUE, na="-", locale=locale(encoding="Windows-1250"))

#Tabela 3: Namen uporabe interneta po statusu aktivnosti

status_aktivnosti <- read_csv2("podatki/status_aktivnosti.csv", col_names = TRUE, na="-", locale=locale(encoding="Windows-1250"))

#Tabela 4: Namen uporabe interneta po stopnji urbanizacije

stopnja_urbanizacije <- read_csv2("podatki/stopnja_urbanizacije.csv", col_names = TRUE, na="-", locale=locale(encoding="Windows-1250"))

#Tabela 5: Namen uporabe interneta po starostnih razredih

starostni_razredi <- read_csv2("podatki/starostni_razredi.csv", col_names = TRUE, na="-", locale=locale(encoding="Windows-1250"))

starostni_razredi_test <- read_csv2("podatki/starostni_razredi_test.csv", col_names = TRUE, na="-", locale=locale(encoding="Windows-1250"))





# sl <- locale("sl", decimal_mark=",", grouping_mark=".")
# 
# # Funkcija, ki uvozi občine iz Wikipedije
# uvozi.obcine <- function() {
#   link <- "http://sl.wikipedia.org/wiki/Seznam_ob%C4%8Din_v_Sloveniji"
#   stran <- html_session(link) %>% read_html()
#   tabela <- stran %>% html_nodes(xpath="//table[@class='wikitable sortable']") %>%
#     .[[1]] %>% html_table(dec=",")
#   for (i in 1:ncol(tabela)) {
#     if (is.character(tabela[[i]])) {
#       Encoding(tabela[[i]]) <- "UTF-8"
#     }
#   }
#   colnames(tabela) <- c("obcina", "povrsina", "prebivalci", "gostota", "naselja",
#                         "ustanovitev", "pokrajina", "regija", "odcepitev")
#   tabela$obcina <- gsub("Slovenskih", "Slov.", tabela$obcina)
#   tabela$obcina[tabela$obcina == "Kanal ob Soči"] <- "Kanal"
#   tabela$obcina[tabela$obcina == "Loški potok"] <- "Loški Potok"
#   for (col in c("povrsina", "prebivalci", "gostota", "naselja", "ustanovitev")) {
#     if (is.character(tabela[[col]])) {
#       tabela[[col]] <- parse_number(tabela[[col]], na="-", locale=sl)
#     }
#   }
#   for (col in c("obcina", "pokrajina", "regija")) {
#     tabela[[col]] <- factor(tabela[[col]])
#   }
#   return(tabela)
# }
# 
# # Funkcija, ki uvozi podatke iz datoteke druzine.csv
# uvozi.druzine <- function(obcine) {
#   data <- read_csv2("podatki/druzine.csv", col_names=c("obcina", 1:4),
#                     locale=locale(encoding="Windows-1250"))
#   data$obcina <- data$obcina %>% strapplyc("^([^/]*)") %>% unlist() %>%
#     strapplyc("([^ ]+)") %>% sapply(paste, collapse=" ") %>% unlist()
#   data$obcina[data$obcina == "Sveti Jurij"] <- "Sveti Jurij ob Ščavnici"
#   data <- data %>% gather(`1`:`4`, key="velikost.druzine", value="stevilo.druzin")
#   data$velikost.druzine <- parse_number(data$velikost.druzine)
#   data$obcina <- parse_factor(data$obcina, levels=obcine)
#   return(data)
# }
# 
# # Zapišimo podatke v razpredelnico obcine
# obcine <- uvozi.obcine()
# 
# # Zapišimo podatke v razpredelnico druzine.
# druzine <- uvozi.druzine(levels(obcine$obcina))
# 
# # Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# # potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# # datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# # 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# # fazah.
