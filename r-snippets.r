# save to file within dplyr pipe
library(dplyr)
df %>% 
  select(cols) %>%
  write.table(., file = "path.csv")

 # copy df to clipboard on Mac OS with pipe
 library(clipr)
 df %>% write_clip(.)

 # import several csv files as one data frame with map_df from purrr
 df <- list.files(path = "path/") %>% 
  map_df(~read.csv(paste0("path/", .), header=TRUE, sep="\t"))
