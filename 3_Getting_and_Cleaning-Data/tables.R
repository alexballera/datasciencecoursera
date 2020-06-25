library(data.table)
DF = data.frame(x=rnorm(9), y=rep(c("a","b","c"), each=3), z=rnorm(9))
head(DF, 3)

DT = data.table(x=rnorm(9), y=rep(c("a","b","c"), each=3), z=rnorm(9))
head(DF, 3)

## Ver todas las tablas en la memoria
tables()

## Subsettings Rows
DT[2,]
DT[DT$y=="a",]
DT[DT$y=="b",]
DT[c(2,3)]

## Subsettings Col
DT[,c(2,3)]

{
    x = 1
    y = 2
}
k = {print(10); 5}

print(k)

## Calculos
DT[, list(mean(x), sum(z))]
DT[, table(y)]

## Agregando columnas
DT[,w:=z^2]
DT

DT2 <- DT
DT[,y:=2]
DT
DT2

## Múltiples operaciones
DT[,m:={tmp <- (x+z); log2(tmp+5)}]
DT
DT[,a:=x>0]
DT

DT[,b:= mean(x+w), by=a]
DT

## Variables especiales
set.seed(123)
DT <- data.table(x=sample(letters[1:3], 1E5, TRUE))
DT[, .N, by=x]

## Keys
DT = data.table(x=rep(c("a","b","c"), each=100), y=rnorm(300))
setkey(DT, x)
DT['a']

## Joins
DT1 <- data.table(x=c('a','a','b','dt1'), y=1:4)
DT2 <- data.table(x=c('a','b','dt2'), z=5:7)
setkey(DT1,x); setkey(DT2, x)
merge(DT1,DT2)
