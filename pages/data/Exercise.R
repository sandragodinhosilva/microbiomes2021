################################################################################



# Author: Sandra Godinho Silva (sandragodinhosilva@tecnico.ulisboa.pt)
# Last version: 15-04-2021
################################################################################

# Load necessary packages
library("dplyr")

################################################################################
# Open cog_table.csv file"
cog_table = read.csv("cog_table.csv")
head(cog_table)

remove <- c("Accession", "Name", "Descriptiom")
samples = colnames(cog_table)
cog_table[ , !names(cog_table) %in% remove] ## works as expected


# Open mapping file
cog_map = read.table("cog_mapping.tsv", sep="\t", header=TRUE)
head(cog_map)

cog_map2 = read.table("cog_mapping2.tsv", sep="\t", header=TRUE)
head(cog_map2)

merge_table = merge(cog_table, cog_map2, by.x="Accession", by.y="COG")
head(merge_table)

merge_table %>% 
  count(func)
  
  group_by(func)  %>%
  count()
