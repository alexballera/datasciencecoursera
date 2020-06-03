# lapply
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean)

x <- 1:4
lapply(x, runif)

x <- 1:4
lapply(x, runif, min = 0, max = 10)

# sapply
# Más simplificado de lapply

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
sapply(x, mean)

# apply

x <- matrix(rnorm(200), 20, 10)
apply(x, 2, mean)

#mapply

x <- list(rep(1,4), rep(2,3), rep(3,2), rep(4,1))
x

mapply(rep, 1:4, 4:1)