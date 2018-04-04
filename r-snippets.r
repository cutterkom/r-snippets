# save to file within dplyr pipe
library(dplyr)
df %>% 
  select(cols) %>%
  write.table(., file = "path.csv")