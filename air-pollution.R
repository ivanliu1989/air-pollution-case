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

x0 <-