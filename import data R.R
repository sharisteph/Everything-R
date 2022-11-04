
library(tidyverse)
#load these datasets in R
data()
#If you run the data function without an argument, R will display a list of
#the available datasets
#for a specific dataset in R
data("mtcars")
mtcars
# to import data using readr
#The readr package comes with some sample files from built-in datasets that you can use for example code
readr_example()
# to read the mtcars csv file
read_csv(readr_example("mtcars.csv"))

#To import spreadsheet data into R, you can use the readxl package. The readxl package makes it easy to transfer data from Excel
#into R.Readxl supports both the legacy .xls file format and the modern xml-based .xlsx file format.
#The readxl package is part of the tidyverse but is not a core tidyverse package, so you need to load readxl in R by using the library()
library(readxl)
#Read a .csv file with readxl
#1st see the list then read
readxl_example()
read_excel(readxl_example("type-me.xlsx"))

#You can use the excel_sheets() function to list the names of the individual sheets.
excel_sheets(readxl_example("type-me.xlsx"))
#You can also specify a sheet by name or number. Just type “sheet =” followed by the name or number of the sheet. For example,
#you can use the sheet named “numeric_coercion” from the list above.
read_excel(readxl_example("type-me.xlsx"), sheet = "numeric_coercion")
