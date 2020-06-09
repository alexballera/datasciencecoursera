## Simulating a Linear Model

## Always set your seed!
set.seed(20)
## Simulate predictor variable
x <- rnorm(100)
## Simulate the error term
e <- rnorm(100, 0, 2)
## Compute the outcome via the model
y <- 0.5 + 2*x + e

summary(y)

plot(x,y)

## What if we wanted to simulate a predictor variable x that is binary instead of having a Normal
## distribution
set.seed(10)
x <- rbinom(100, 1, 0.5)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2*x + e
summary(y)

plot(x,y)

## Poisson log-linear model
set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3 * x
y <- rpois(100, exp(log.mu))
summary(y)

plot(x,y)
