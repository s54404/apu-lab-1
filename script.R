print("A")
a <- 20/log(2.78)
b <- 3 * a
min(a, b)

print("B")
help(abs)

print("C")
a <- 8:75
kwadraty <- a^2
mean(kwadraty)

print("D")
apropos("plot")

print("E")
setwd("C:/Users/adrian/Desktop/APU_LAB1")
a <- "tablet"
write.table(a, file = "zmienna_a.txt")
rm(a)
print(a)
a <- read.table("zmienna_a.txt")
print(a)

print("F")
install.packages("gridExtra")
library(gridExtra)
grid.table(head(volcano, 10))

print("G")
wektor <- seq(1000, 200, by = -8)

print("H")
a <- 50:30
b <- 4:50
d <- c(b, a)
print(d)

print("I")
nazwa <- c("Apple iPad 2021 - 10.2","Apple iPad Air 2022 Szary","Apple iPad (10gen) 2022","Apple iPad Air 2022 Niebieski","Apple iPad Pro 2022","Apple iPad Air 2019","Apple iPad Air 2022 Niebieski","Apple iPad Pro 2022","Apple iPad mini 2021","Apple iPad Pro 2022")
modem <- c("LTE","5G","5G","5G","5G","WiFi","5G","5G","5G","5G")
wyświetlacz <- c(10.2,10.9,10.9,10.9,12.9,10.5,10.9,11,8.3,12.9)
pamięć_RAM <- c(8,8,8,8,8,3,8,16,8,8)
pamięć_wbudowana <- c(64,64,64,64,128,256,256,2000,64,256)
cena <- c(1719,3299,3199,3299,6019,3699,4649,10369,2669,6699)
liczba_opinii <- c(76,23,2,10,7,4,14,0,20,1)
tablety <- data.frame(nazwa, modem, wyświetlacz, pamięć_RAM, pamięć_wbudowana, cena, liczba_opinii)
print(tablety)
srednia_cena <- mean(tablety$cena)
cat("Średnia cena tabletów: ", srednia_cena, "\n")

print("J")

nowy_tablet <- data.frame(
  nazwa = "iPad Air 3",
  modem = "LTE",
  wyświetlacz = "10.5 cala",
  pamięć_RAM = "3 GB",
  pamięć_wbudowana = "64 GB",
  cena = 599,
  liczba_opinii = 250
)
tablety <- rbind(tablety, nowy_tablet)
print(tablety)


srednia_cena <- mean(tablety$cena)
cat("Średnia cena tabletów: ", srednia_cena, "\n")

print("k")
tablety$ocena_klientów <- seq(0, 5, by = 0.5)
tablety$ocena_klientów <- factor(tablety$ocena_klientów)
print(tablety)
srednie_ceny_ocen <- tapply(tablety$cena, tablety$ocena_klientów, mean)
cat("Średnie ceny dla każdej oceny:\n")
print(srednie_ceny_ocen)

print("l")
nowe_tablety <- data.frame(
  nazwa = c("iPad Pro 11", "iPad Pro 12.9", "iPad Mini 5", "iPad 9"),
  modem = c("LTE", "LTE", "LTE", "LTE"),
  wyświetlacz = c("11 cali", "12.9 cali", "7.9 cali", "10.2 cala"),
  pamięć_RAM = c("4 GB", "6 GB", "3 GB", "3 GB"),
  pamięć_wbudowana = c("128 GB", "256 GB", "64 GB", "32 GB"),
  cena = c(799, 999, 399, 299),
  liczba_opinii = c(150, 250, 100, 50),
  ocena_klientów = factor(c(4.5, 4.0, 4.0, 3.5))
)

tablety <- rbind(tablety, nowe_tablety)

print(tablety)
install.packages("ggplot2")
library(ggplot2)
ggplot(tablety, aes(x = ocena_klientów)) +
  geom_bar() +
  xlab("Ocena klientów") +
  ylab("Liczba reprezentantów") +
  ggtitle("Liczba reprezentantów według ocen klientów")

print("m")
udzial_ocen <- prop.table(table(tablety$ocena_klientów)) * 100
pie(udzial_ocen, labels = paste(udzial_ocen, "%"), main = "Procentowy udział ocen klientów")

barplot(udzial_ocen, main = "Procentowy udział ocen klientów", ylab = "Procent")


print("n")
tablety$status_opinii <- ifelse(tablety$liczba_opinii == 0, "nie ma",
                                ifelse(tablety$liczba_opinii < 50, "mniej 50 opinii",
                                       ifelse(tablety$liczba_opinii <= 100, "50-100 opinii",
                                              "więcej 100 opinii")))

tablety$status_opinii <- factor(tablety$status_opinii)

print(tablety)

udzial_statusu_opinii <- prop.table(table(tablety$status_opinii)) * 100

pie(udzial_statusu_opinii, labels = paste(udzial_statusu_opinii, "%"), main = "Procentowy udział tabletów o konkretnym statusie opinii")

print("o")
zdania_o_tabletach <- paste(tablety$nazwa, "ma ocenę klientów", tablety$ocena_klientów, "bo ma liczbę opinii", tablety$liczba_opinii)

for (zdanie in zdania_o_tabletach) {
  cat(zdanie, "\n")
}

print("p")
write.csv(tablety, file = "tablety.csv", row.names = FALSE)
wczytana_ramka <- read.csv("tablety.csv")

