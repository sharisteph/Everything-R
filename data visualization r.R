#DATA VISUALIZATION
#installing packages
install.packages("ggplot2")
install.packages("palmerpenguins")
#loading packages
library(ggplot2)
library(palmerpenguins)
#load and view data(View starts with caps)
data("penguins")
View(penguins)
#create a ggplot
ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g))

#create another ggplot using same syntax
ggplot(data = penguins) + geom_point(mapping = aes(x = bill_length_mm, y = bill_depth_mm))

#to learn about geop_point
?geom_point

#adding aesthetics to our plot
ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g,color=species))
ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g,shape=species))
ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g,color=species,shape=species,size=species))

#when you have a dense plot with lots of data points to keep your plot black and white with fading use alpha
ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g,alpha=species))

#to make our plot change in color
ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g),color="purple")

#change geom
ggplot(data = penguins) + geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g))

# use both line and scatter plot
ggplot(data = penguins) + geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g))+
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g)) 

#separate line by species
ggplot(data = penguins) + geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g,linetype=species))

#use the jitter function, makes points easier to find
ggplot(data = penguins) + geom_jitter(mapping = aes(x = flipper_length_mm, y = body_mass_g))

#EXPLORE BAR CHARTS USING DIAMONDS DATA SET
#note: r automatically sets y axis as count
ggplot(data=diamonds)+geom_bar(mapping = aes(x=cut))
#to add color to the outline of the bar
ggplot(data=diamonds)+geom_bar(mapping = aes(x=cut,color=cut))
# to add color to entire bar
ggplot(data=diamonds)+geom_bar(mapping = aes(x=cut,fill=cut))
#stacked bar chart
ggplot(data=diamonds)+geom_bar(mapping = aes(x=cut,fill=clarity))

#USE FACET
# To facet your plot by a single variable, use facet underscore wrap
ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species))+facet_wrap(~species)

ggplot(data=diamonds)+geom_bar(mapping=aes(x=color,fill=cut))+facet_wrap(~cut)

#to facet your plot with two variables, use the facet underscore grid function.
#Facet underscore grid will split the plot into facets vertically by the values of the first variable and horizontally by the values of the second variable.
ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species))+facet_grid(sex~species)

#LABELS AND ANNOTATIONS
ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species))+labs(title="flipperlenght by bodymass",subtitle = "sample",caption="data used to learn r")

#If we want to put text inside the grid to call out specific data points, we can use the annotate function.
ggplot(data=penguins)+
  geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species))+
  labs(title="flipperlenght by bodymass",subtitle = "sample",caption="data used to learn r")+
  annotate("text",x=220,y=3500,label="The Gentoos are the largest",color="purple",fontface="bold",size=4.5,angle=25)
#you can save using export function and ggsave()

ggplot(data = penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g,color=species))
ggsave("Three penguin species.png")
