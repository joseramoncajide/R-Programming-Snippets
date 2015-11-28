# sample data
write.csv(data.frame(a=c("1.234,56","1.234,56"),
                     b=c("1.234,56","1.234,56")),
          "test.csv",row.names=FALSE,quote=TRUE)

#define your own numeric class
setClass('myNum')
#define conversion
setAs("character","myNum", function(from) as.numeric(gsub(",","\\.",gsub("\\.","",from))))

#read data with custom colClasses
read_data=read.csv("test.csv",stringsAsFactors=FALSE,colClasses=c("myNum","myNum"))

#read
read_data[1,1]*2

#[1] 2469.12