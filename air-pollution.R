setwd(choose.dir())
pm25.zip <- "pm25_data.zip"
if(!(file.exists(pm25.zip)))
    print("There is no relevant datasets in current dir")
pm25.list <- unzip(pm25.zip)
pm25.list
pm0 <- read.table(pm25.list[1],comment.char="#",header = F,sep="|",na.strings = "")
dim(pm0)
head(pm0)
cnames <- readLines(pm25.list[1],1)
cnames
cnames <- strsplit(cnames, "|", fixed=T)
names(pm0)<- make.names(cnames[[1]]) # make column names valid

x0 <- pm0$Sample.Value
class(x0)
str(x0)
summary(x0)
mean(is.na(x0))

pm1 <- read.table(pm25.list[2], comment.char = "#", header = F, na.strings = "", sep="|")
dim(pm1)
names(pm1)<-make.names(cnames[[1]])
head(pm1)

x1 <- pm1$Sample.Value
str(x1)
summary(x1)
summary(x0)
mean(is.na(x1)) # proportion of missing value

boxplot(x0,x1)
boxplot(log10(x0),log10(x1))
