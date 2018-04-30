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