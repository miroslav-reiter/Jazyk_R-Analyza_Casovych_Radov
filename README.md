# 📈 Jazyk R - Analýza Časovych Radov (Time Series Analysis and Forecasting)
Zdrojové kódy a materiály v jazyku R pre analýzu časových radov (Time Series Analysis and Forecasting)

## 🏷️ Metadáta
```r
# IT_Academy_Data.R

# Popis: IT Academy analýza využitia podnikových dát
# Autor: Miroslav Reiter
# Datum: 5.3.2020
```

## 📦 Inštalácia balíčkov readxl, forecast, tseries (install packages)
```r
# Inštalácia balíčka pre prácu s Excel súbormi, predpoveďami a časovými radami
# install.packages("readxl", "forecast", "tseries" )
```

## 📁 Nastavenie cesty k súboru (Set working directory)
```r
# Nastavenie cesty k súboru
setwd("C:\\Users\\Administrator\\Desktop\\")
```
## 📦 Import balíčkov pre prácu s Excel súbormi a pre prognózovanie
```r
# Import balíčkov pre prácu s Excel súbormi
library("readxl")
# Od verzie 3.5.3
library("Rcpp")
# Balíček na prognózovanie budúcich hodnôt
library(forecast)
```

## 📈 Kombinovanie viacerých grafov do jedného celkového grafu
```r
# Kombinovanie viacerých grafov do jedného celkového grafu
par(ask=TRUE)
```

## 👁️‍🗨️ Načítanie dát z Excelu
```r
# Načítanie dát z Excelu
IT_Academy_Data = read_excel("IT Academy Data.xlsx")
```

## 🌪️ Rozdelenie stĺpcov do samostatných premenných
```r
# Rozdelenie stĺpcov do samostatných premenných
roky = IT_Academy_Data[1]
roky_kodovane = IT_Academy_Data[2]
velkosti_dat = IT_Academy_Data[3]
```

## 📈 Vytvorenie časového radu
```r
# Vytvorenie časového radu
casova_rada_data = ts(data = velkosti_dat[1:9,1],start = 2012,frequency = 1)
# Vykreslenie grafu časového radu
plot(casova_rada_data, type = 'b', xlab ='Rok', col = 'blue', main ='Využitie podnikových dát',
     xlim = c(2012, 2020), ylim = c(0, 1500)) 
# grid() , panel.first=grid()
abline(v=(seq(2012, 2020, 1)), col="lightgray", lty="dotted")
abline(h=(seq(0,1500,250)), col="lightgray", lty="dotted")
abline(h=(seq(0,25,25)), col="#FF3300", lty="dotted")
abline(h=(seq(0,70,70)), col="#FF3300", lty="dotted")
abline(h=(seq(0,115,115)), col="#FF3300", lty="dotted")
abline(h=(seq(0,160,160)), col="#FF3300", lty="dotted")
abline(h=(seq(0,382,382)), col="#FF3300", lty="dotted")
abline(h=(seq(0,1029,1029)), col="#FF3300", lty="dotted")
ylabel = seq(0, 2000, by = 250)
axis(2, at = ylabel)
xlabel = seq(2012, 2020, by = 1)
axis(1, at = xlabel)

start(casova_rada_data) 
end(casova_rada_data)
frequency(casova_rada_data)
```

## 📈 Jednoduché kĺzavé priemery
```r
# Jednoduché kĺzavé priemery
opar = par(no.readonly = TRUE)
par(mfrow = c(2,2))
ylim = c(min(casova_rada_data), max(casova_rada_data))
plot(casova_rada_data, main = "Čistý časový rad", type = 'b', xlab ='Rok', col = 'blue')
xlabel = seq(2012, 2020, by = 1)
axis(1, at = xlabel)
abline(v=(seq(2012, 2020, 1)), col="lightgray", lty="dotted")
abline(h=(seq(0,1500,250)), col="lightgray", lty="dotted")
```

## 📉 Bug s prekreslením a kombinovaním grafov
```r
# Bug s prekreslením a kombinovaním grafov
plot(ma(casova_rada_data, 3), main = "Jednoduché kĺzavé priemery (MA=3)", ylim = ylim, 
ylab = 'Veľkosť dát v GB', type = 'b', xlab ='Rok', col = 'blue')
xlabel = seq(2012, 2020, by = 1)
axis(1, at = xlabel)
abline(v=(seq(2012, 2020, 1)), col="lightgray", lty="dotted")
abline(h=(seq(0,1500,250)), col="lightgray", lty="dotted")

plot(ma(casova_rada_data, 4), main = "Jednoduché kĺzavé priemery (MA=4)", ylim = ylim,
ylab = 'Veľkosť dát v GB', type = 'b', xlab ='Rok', col = 'blue')
xlabel = seq(2012, 2020, by = 1)
axis(1, at = xlabel)
abline(v=(seq(2012, 2020, 1)), col="lightgray", lty="dotted")
abline(h=(seq(0,1500,250)), col="lightgray", lty="dotted")

plot(ma(casova_rada_data, 5), main = "Jednoduché kĺzavé priemery (MA=5)", ylim = ylim,
ylab = 'Veľkosť dát v GB', type = 'b', xlab ='Rok', col = 'blue')
xlabel = seq(2012, 2020, by = 1)
axis(1, at = xlabel)
abline(v=(seq(2012, 2020, 1)), col="lightgray", lty="dotted")
abline(h=(seq(0,1500,250)), col="lightgray", lty="dotted")
par(opar)
```

## 📉 Sezónna dekompozícia
```r
# Sezónna dekompozícia, pre naše dáta nepoužiteľné, keďže neobsahujú sezónnu zložku
# fit = stl(casova_rada_data, s.window="period")
# plot(fit)
```

## 🥇 Exponenciálne modely
```r
# Exponenciálne modely
# Jednoduchý exponenciálny - modeluje Alphu
fit = HoltWinters(casova_rada_data, beta = FALSE, gamma = FALSE)
fit
accuracy(forecast(fit))
```

## 🥈 Dvojitý exponenciálny model - modeluje Alphu a trendovú zložku
```r
# Dvojitý exponenciálny model - modeluje Alphu a trendovú zložku
fit = HoltWinters(casova_rada_data, gamma = FALSE)
fit
accuracy(forecast(fit))
```

## 🥉 Trojitý exponenciálny model - modeluje priemerné hodnoty v rade, trendovú a sezónnu zložku
```r
# Trojitý exponenciálny model - modeluje priemerné hodnoty v rade, trendovú a sezónnu zložku
# Potrebné aspoň 2 periódy
# fit = HoltWinters(casova_rada_data)
# fit
# accuracy(forecast(fit))
```

## 💹 Výpočet chýb predikcií a prognóz (ME, RMSE, MAE, MPE, MAPE, MASE, ACF1)
```r
# Výpočet chýb predikcií a prognóz (ME, RMSE, MAE, MPE, MAPE, MASE, ACF1)
# accuracy(casova_rada_data)
```

## 💹 Prognóza na najbližšie 3 roky (Forecast)
```r
# Prognóza na najbližšie 3 roky
forecast(casova_rada_data, 3)
accuracy(forecast(casova_rada_data))
```

## 💹 Vykreslenie grafu s prognózou na najbližšie 3 roky
```r
# Vykreslenie grafu s prognózou na najbližšie 3 roky
par(ask=FALSE)
par(mfrow = c(1,1))
fit = HoltWinters(casova_rada_data,gamma = FALSE)
accuracy(forecast(fit))
forecast(fit,3)
plot(forecast(fit, 3), type = 'b', xlab ='Rok', col = 'blue', main ='Prognóza využitia podnikových dát',
     ylab = 'Veľkosť dát v GB', xlim = c(2012, 2023), ylim = c(0, 3500))
ylabel = seq(0, 3500, by = 500)
axis(2, at = ylabel)
xlabel = seq(2012, 2023, by = 1)
axis(1, at = xlabel)
abline(v=(seq(2012, 2023, 1)), col="lightgray", lty="dotted")
abline(h=(seq(0,3500,500)), col="lightgray", lty="dotted")
```

## 💹 Automatická prognóza s pomocou exponenciálneho modelu (ETS a fit)
```r
# Automatická prognóza s pomocou exponenciálneho modelu
fit2 = ets(casova_rada_data)
fit2
plot(fit2)
forecast(fit2, 3)
accuracy(fit2)
```

## 💲 Automatická prognóza ARIMA
```r
# Automatická prognóza ARIMA
fit2 = auto.arima(casova_rada_data)
fit2
forecast(fit2, 3)
accuracy(fit2)
```

## 📦 Balíček funkcií Technical Trading Rules (Package TTR)
```r
# Balíček funkcií Technical Trading Rules 
# Zabudované funkcie pre kĺzavé priemery
library("TTR")
casova_rada_dataSMA3 = SMA(casova_rada_data,n=3)
plot.ts(casova_rada_dataSMA3)
casova_rada_dataSMA5 = SMA(casova_rada_data,n=5)
plot.ts(casova_rada_dataSMA5)

casova_rada_data_predpovede <- HoltWinters(casova_rada_data, beta = FALSE, gamma = FALSE)
casova_rada_data_predpovede
```

## 💣 Výpočet Error Sum of Squares
```r
# Výpočet Error Sum of Squares
casova_rada_data_predpovede$SSE
plot(casova_rada_data_predpovede)
```
