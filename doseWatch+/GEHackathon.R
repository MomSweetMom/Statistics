install.packages('plyr')
library(plyr)

# Reading dataset dosewatch_study
data_study = read.table('dosewatch_study.csv', header = T, sep = ';', fill = T)
View(data_study)
str(data_study)
unique(data_study$ae_key) # 60
levels(data_study$hospital_name)
summary(data_study)

levels(data_study$country_name)

# Reading dataset dosewatch_serie
data_serie = read.table('dosewatch_serie.csv', header = T, sep = ',', fill = T)
View(data_serie)
str(data_serie)
summary(data_serie)
levels(data_study$ae_key)

# Create dataframe with 'Helical' series only
data_serie_helical = subset(data_serie, subset = (series_type == "Helical"))
data_serie_helical = data_serie_helical[, -c(1, 17)]
View(data_serie_helical)

# Create dataframe with specified keys 
data_study1 = data_study[, c('id','ae_key','facility_key','protocol_name',
                         'dose_length_product_total','ctdi_vol_max',
                         'total_number_of_irradiation_events')]

# Table of country-hospital key
country_hospital = data_study[, c('facility_key', 'facility_description')]
View(country_hospital)

# Number of machines
levels(data_study$ae_key)
A = unique(data_study$facility_description[0:2])
A = data_study$facility_description
View(A)

# Country + hospital


View(data_study1)
