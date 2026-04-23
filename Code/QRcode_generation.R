# install.packages("qrcode")

setwd("C:/Users/mirko/Downloads")

library(qrcode)

url <- "https://github.com/mirkoferretti1"

qr <- qr_code(url)
 
png("github_profile_qr.png", width = 1000, height = 1000)
plot(qr)
dev.off()
