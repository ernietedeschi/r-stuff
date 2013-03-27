# Grants-in-Aid to State and Local Governments 2012
require(zipcode)
require(ggplot2)

setwd("C:/Users/tedeschie/Desktop/Grants")


data(zipcode)
data.raw <- read.csv("grants2012.csv")
data <- data.frame(data.raw$AssistanceType, 
                   data.raw$ContractingAgency, 
                   data.raw$DollarsObligated, 
                   data.raw$ProjectDescription, 
                   data.raw$RecipientCountyName, 
                   data.raw$RecipientType, 
                   data.raw$RecipientZipCode)
# 

data$recipientTypeCode <- as.numeric(gsub(":.*","", data$data.raw.RecipientType))
data$recipientCleanZip <- substr(data$data.raw.RecipientZipCode,1,5)
save(data, file="grants2012data.Rdata")
map.data <- zipcode
map.data$totalObligated <- aggregate(data$data.raw.DollarsObligated, by=list(zip=data$recipientCleanZip), FUN=sum)
