### I geocoded inspection and business data through ArcGIS. I will now merge both sets and explore that merged dataset. 

library(dplyr)
library(ggplot2)
setwd("Dropbox/Documents/CMU/Classes/Fall 2019/Applied ML/Project/Data/GeoCoded/")


# Get list of unique restaurant addresses from inspection data
insp_restaurants = read.delim("Inspections_Geocoded.txt", stringsAsFactors = F) %>% select(Match_addr, USER_id)
insp_restaurants = insp_restaurants %>% rename(restaurant = USER_id) %>% distinct()

# Get business data w/unique identifiers (Match address and business ID)
business = read.delim("Businesses_Geocoded.txt", stringsAsFactors = F) %>% select(Match_addr, USER_Business_ID)

total_addresses = unique(c(inspections$Match_addr, business$Match_addr))

address_dict = data.frame(adr_id = 1:length(total_addresses), address = total_addresses)


