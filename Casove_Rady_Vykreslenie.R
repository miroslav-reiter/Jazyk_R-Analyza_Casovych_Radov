# Uloženie číselného vektor obsahujúceho 72 mesačných pozorovaní
# Od januára 2009 do decembra 2014 ako objekt časového radu
myts <- ts(myvector, start=c(2009, 1), end=c(2014, 12), frequency=12)

# Podmnožina (subset) časového radu (jún 2014 až december 2014)
myts2 <- window(myts, start=c(2014, 6), end=c(2014, 12))

# Vykreslenie časových radov
plot(myts)