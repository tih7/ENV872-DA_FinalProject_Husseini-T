# Set your working directory
getwd()

# Load your packages
library(tidyverse)
library(lubridate)
library(nlme)
library(lme4)
library(corrplot)
library(sf)
library(nationalparkcolors)
library(cowplot)
#library(here) #in the lubridate package

# Set your ggplot theme and colour palettes
my_theme <- theme_grey(base_size = 12) +
  theme(axis.text = element_text(color = "black"), 
        legend.position = "right")

theme_set(my_theme)

# Colour palettes
arches<- park_palette("Arches")
yosemite <- park_palette("Yosemite")
acadia <- park_palette("Acadia")
everglades <- park_palette("Everglades")
badlands <-park_palette("Badlands")

# Load dataset
caliEJscreen <- read.csv("./data/data_raw/cali_ej_screen.csv")

#Data wrangling
colnames(caliEJscreen)
summary(caliEJscreen$California.County) #2343 census tracts in LA county

## Filter census tracts in Los Angeles, Sand Diego and San Fransico county
three.cities.aq <- caliEJscreen %>% 
  select(Census.Tract, Total.Population, California.County, Ozone:Diesel.PM, Traffic, Asthma:Cardiovascular.Disease.Pctl, Education:Housing.Burden) %>% 
  filter(California.County == "Los Angeles" | California.County == "San Diego" | California.County == "San Francisco")

#Explore the data
summary(three.cities.aq)
hist(three.cities.aq$Asthma)
hist(three.cities.aq$Ozone)
hist(three.cities.aq$PM2.5)
hist(three.cities.aq$Diesel.PM)

# Visualisations
asthma.o3 <- ggplot(three.cities.aq) +
  geom_point(aes(y=Asthma, x= Ozone, colour = California.County), alpha = 0.6)
asthma.0.3

asthma.pm25 <- ggplot(three.cities.aq) +
  geom_point(aes(y=Asthma, x= PM2.5, colour = California.County), alpha = 0.6)
asthma.pm25

asthma.diesel <- ggplot(three.cities.aq) +
  geom_point(aes(y=Asthma, x= Diesel.PM, colour = California.County), alpha = 0.6)
asthma.diesel

asthma.traffic <- ggplot(three.cities.aq) +
  geom_point(aes(y=Asthma, x= Traffic, colour = California.County), alpha = 0.6) +
  xlim(0,2000) # remove outlier
asthma.traffic

#USE THIS ONE FOR VISUALISATION
asthma.poverty <- ggplot(three.cities.aq,aes(y=Asthma, x= Poverty, colour = California.County)) +
  geom_point(alpha = 0.7) +
  scale_colour_manual(values= badlands) +
  geom_smooth(method="lm", se=FALSE)
asthma.poverty


# asthma ~ poverty, CA
asthma.poverty.ca <- ggplot(caliEJscreen,aes(y=Asthma, x= Poverty)) +
  geom_point(alpha = 0.7, col = badlands[1]) +
  #scale_colour_manual(values= badlands) +
  ylab("Cardiovascular Disease (Rate)")+
  geom_smooth(method="lm", se=FALSE)
asthma.poverty.ca

#cardio ~ poverty, CA
cardio.poverty.ca <- ggplot(caliEJscreen,aes(y=Cardiovascular.Disease, x= Poverty)) +
  geom_point(alpha = 0.7, col = badlands[2]) +
  #scale_colour_manual(values= badlands) +
  geom_smooth(method="lm", se=FALSE)
cardio.poverty.ca



asthma.ling.iso <- ggplot(three.cities.aq) +
  geom_point(aes(y=Asthma, x= Linguistic.Isolation, colour = California.County), alpha = 0.6) 
asthma.ling.iso

asthma.housing <- ggplot(three.cities.aq) +
  geom_point(aes(y=Asthma, x= Housing.Burden, colour = California.County), alpha = 0.6) 
asthma.housing


# Modelling
mdl0 <- lm(data = three.cities.aq, Asthma ~ Poverty)
summary(mdl0)

mdl <- lmer(data=three.cities.aq, Asthma ~ Poverty + (1|California.County))
summary(mdl)

# asthma ~ air pollution variables
mdl1 <- lm(data = three.cities.aq, Asthma ~ Ozone + PM2.5 + Diesel.PM + Traffic)
summary(mdl)
plot(mdl1)

mdl2 <- lm(data = three.cities.aq, Asthma ~ Ozone + PM2.5 + Diesel.PM)
summary(mdl2)
plot(mdl2)

mdl3 <- lmer(data = three.cities.aq, Asthma ~ Ozone + PM2.5 + Diesel.PM + Traffic + (1|California.County))
summary(mdl3)

# asthma ~ socio-economic factors
mdl4 <-lm(data = three.cities.aq, Asthma ~ Education + Poverty + Unemployment + Housing.Burden + Linguistic.Isolation)
summary(mdl4)
plot(mdl4)
#how to test for correlation? 

mdl5 <-lm (data = three.cities.aq, Asthma ~ Education + Poverty + Housing.Burden + Linguistic.Isolation) 
summary(mdl5)

#correlation
socioeco.vars <- losangeles.aq %>% 
  select(Education, Poverty, Unemployment, Housing.Burden, Linguistic.Isolation)
cortest <-cor(socioeco.vars)
corrplot(cortest, method="ellipse")
# is it because they're not the same unit? 
  

# Geospatial 
cali.map <- st_read("./data/data_spatial/CES3June2018Update.shp")
st_crs(cali.map)

here()


