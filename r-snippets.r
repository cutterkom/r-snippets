# save to file within dplyr pipe
library(dplyr)
df %>% 
  select(cols) %>%
  write.table(., file = "path.csv")

 # copy df to clipboard on Mac OS with pipe
 library(clipr)
 df %>% write_clip(.)
