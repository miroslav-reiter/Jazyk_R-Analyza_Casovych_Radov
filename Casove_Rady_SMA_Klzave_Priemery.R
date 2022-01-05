par(ask=TRUE)

# Vytvorenie objektu časového radu pre predaje
sales <- c(18, 33, 41,  7, 34, 35, 24, 25, 24, 21, 25, 20, 
           22, 31, 40, 29, 25, 21, 22, 54, 31, 25, 26, 35)
tsales <- ts(sales, start=c(2003, 1), frequency=12) 
tsales
plot(tsales, main = "Graf predajov od 2003 do 2004")

start(tsales) 
end(tsales)
frequency(tsales)

tsales.subset <- window(tsales, start=c(2003, 5), end=c(2004, 6))
tsales.subset

# Jednoduché kĺzavé priemery (Simple moving averages)
# Rieka Níl
library(forecast)
opar = par(no.readonly=TRUE)
par(mfrow=c(2,2))
ylim = c(min(Nile), max(Nile))
plot(Nile, main="Nespracované surové časové rady")
plot(ma(Nile, 5), main="Jednoduché kĺzavé priemery (k=5)", ylim=ylim)
plot(ma(Nile, 7), main="Jednoduché kĺzavé priemery (k=7)", ylim=ylim)
plot(ma(Nile, 15), main="Jednoduché kĺzavé priemery (k=15)", ylim=ylim)
par(opar)