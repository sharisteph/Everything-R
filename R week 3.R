#create a data frame
id<-c(1:10)
name<-c("John Mendes","Rob Stewart","Rachel Abrahamson","Christy Hickman", "Johnson Harper", "Candane Miller","Carlson Landy", "Pansy Jordan", "Darius Berry","Claudia Garcia")
job_title <- c("Professional", "Programmer", "Management", "Clerical", "Developer", "Programmer", "Management", "Clerical", "Developer", "Programmer")

employee <- data.frame(id, name, job_title)
print(employee)
#separate function
separate(employee,name,into=c('first_name','last_name'), sep=' ')
#use the UNITE FUNCTION
first_name<-c("John", "Rob", "Rachel", "Christy", "Johnson", "Candane", "Carlson", "Pansy", "Darius", "Claudia")
last_name<-c("Mendes","Stewart","Abrahamson","Hickman", "Harper", "Miller","Landy", "Jordan", "Berry","Garcia")
job_title <- c("Professional", "Programmer", "Management", "Clerical", "Developer", "Programmer", "Management", "Clerical", "Developer", "Programmer")
marks<-c(11:20)
employee <- data.frame(id, first_name, last_name, job_title, marks)
unite(employee,'name',first_name,last_name,sep = " ")

#mutate function to add a new variable
employee %>% 
  mutate(percent_score=marks/10)

#Working with same data different outcome
install.packages('Tmisc')
library(Tmisc)
data("quartet")
view(quartet)

#group data
quartet %>% 
  group_by(set) %>% 
  summarize(mean(x),mean(y),sd(y),cor(x,y))
# use plots to check if the data is truly similar
ggplot(quartet,aes(x,y)) + geom_point()+ geom_smooth(method=lm,se=FALSE) + facet_wrap(~set)

#woking with Bias 
install.packages("SimDesign")
library(SimDesign)
actual_temp<-c(68.3,70,72.4,71,67,70)
predicted_temp<-c(67.9,69,71.5,70,67,69)
bias(actual_temp,predicted_temp)
#another BIAS example
actual_sales <- c(150,203,137,247,116,287)
predicted_sales <- c(200,300,150,250,150,300)
bias(actual_sales,predicted_sales)