# save to file within dplyr pipe
library(dplyr)
df %>% 
  select(cols) %>%
  write.table(., file = "path.csv")

# copy df to clipboard on Mac OS with pipe
library(clipr)
df %>% clipr::write_clip(.)

# import several csv files as one data frame with map_df from purrr
df <- list.files(path = "path/") %>% 
	purrr::map_df(~read.csv(paste0("path/", .), header=TRUE, sep="\t"))

# set workspace in .rmd file in subfolder to .rproject
knitr::opts_knit$set(root.dir = rprojroot::find_rstudio_root_file())

# create ranking variable with mutate/dplyr
df %>% mutate(rank = dense_rank(desc(col)))

# remove rows where all variables are NA using dplyr
# count number of columns and number of columns with NA --> if 0, then all values are NA
df %>% filter(ncol(.) - rowSums(is.na(.)) != 0)

# remove rows where all variables are NA using dplyr (except id row)
# count number of columns and number of columns with NA --> if 1, then all values, except one (id) are NA
df %>% filter(ncol(.) - rowSums(is.na(.)) != 1)

# say, which values are NAs
read.csv(..., na.strings = c("","NA"))

# dataMaid package
library(dataMaid)
data("toyData")
# make pdf report
makeDataReport(toyData)
# check specific columns
check(toyData$events)
# all check functions
allCheckFunctions()


# create variable with mutate and pass the name in the function
# first a dummy column_name has to be created and then be renamed
# important: the naming must be done like !!quo_name(column_name) := dummy_name
create_var <- function(column_name) { 
  df <- df %>% 
    mutate(dummy_name = sum(some_column) %>%
    rename(!!quo_name(column_name) := dummy_name)
}  


# web scraping - rvest: check if attribute exists -> if: scrape, else: NA
library(rvest)
page <- read_html(path)
if (length(html_node(page)) > 0) {
    var <- html_node(page)
} else {
    var <- NA
}


# download HTML pages (bulk)
for (i in links) {
  download_html(url = paste0(BASE_URL, i), file = paste0("path_to_save", i, ".html"), mode = "wb")
}

# nested list to dataframe with list names as column values
library(jsonlite)
library(tidyverse)
jsonlite::fromJSON("data.json") %>% 
  bind_rows(., .id = 'column_name')

# bulk copying files 
copy_files <- function(from, to, file_type) {
  files <- list.files(from, file_type, full.names = TRUE)
  file.copy(files, to)
}

copy_files("../from_path", "../to_path", ".json")