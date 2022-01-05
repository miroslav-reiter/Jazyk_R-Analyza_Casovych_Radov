# Graf diskrétneho rozdelenia
plot(table(rpois(100, 5)), type = "h", col = "red", lwd = 2,
     main = "rpois(100, lambda = 5)")

# Jednoduché kvantily/ECDF
# Mrkni na ecdf() {library(stats)} pre lepšie riešenie
plot(x <- sort(rnorm(47)), type = "s", main = "plot(x, type = \"s\")")
points(x, cex = .5, col = "dark red")
