require(graphics)

ts(1:10, frequency = 4, start = c(1959, 2)) # 2nd Quarter of 1959
print( ts(1:10, frequency = 7, start = c(12, 2)), calendar = TRUE)
# print.ts(.)
## Nastavenie júl 1954 ako počiatočného dátumu:
gnp <- ts(cumsum(1 + round(rnorm(100), 2)),
          start = c(1954, 7), frequency = 12)
# plot.ts # pre graf časových radov 
plot(gnp) 

## Viacrozmerné matice (Multivariate matrix)
z <- ts(matrix(rnorm(300), 100, 3), start = c(1961, 1), frequency = 12)
class(z)
head(z) # "matica"
plot(z)
plot(z, plot.type = "single", lty = 1:3)

## Vykreslenie časových radov
plot(nhtemp, lag(nhtemp, 1), cex = .8, col = "blue",
     main = "Graf oneskorenia teplôt v New Heaven")
