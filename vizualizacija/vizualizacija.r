# 3. faza: Vizualizacija podatkov

# # Uvozimo zemljevid.
# zemljevid <- uvozi.zemljevid("http://baza.fmf.uni-lj.si/OB.zip", "OB",
#                              pot.zemljevida="OB", encoding="Windows-1250")
# levels(zemljevid$OB_UIME) <- levels(zemljevid$OB_UIME) %>%
#   { gsub("Slovenskih", "Slov.", .) } %>% { gsub("-", " - ", .) }
# zemljevid$OB_UIME <- factor(zemljevid$OB_UIME, levels=levels(obcine$obcina))
# zemljevid <- fortify(zemljevid)
# 
# # Izračunamo povprečno velikost družine
# povprecja <- druzine %>% group_by(obcina) %>%
#   summarise(povprecje=sum(velikost.druzine * stevilo.druzin) / sum(stevilo.druzin))

require(ggplot2)
require(dplyr)
colnames(starostni_razredi) <- c("namen", "starost1", "starost2", "starost3", "starost4", "starost5", "starost6")
graf1 <- ggplot(starostni_razredi) + aes(x=namen, y= starost1) + geom_point()



neki <- c("starost1", "starost2", "starost3", "starost4", "starost5", "starost6")

st_raz_07 <- starostni_razredi[c(1:62),]

ggplot(data=st_raz_07, aes(x=namen, y=starost1, fill=starost1)) + geom_bar(stat="identity")

st_raz_08 <- starostni_razredi[c(63:124),]

ggplot(data=st_raz_08, aes(x=namen, y=starost1, fill=starost1)) + geom_bar(stat="identity")

st_raz_09 <- starostni_razredi[c(125:186),]

ggplot(data=st_raz_09, aes(x=namen, y=starost1, fill=starost1)) + geom_bar(stat="identity")




