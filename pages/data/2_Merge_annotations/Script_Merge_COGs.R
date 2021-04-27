################################################################################
### Script to merge annotation tables from WebMGA

# This script can:
  # open cog files
  # merge results into a single table

# Author: Sandra Godinho Silva (sandragodinhosilva@tecnico.ulisboa.pt)
# Last version: 15-04-2021
################################################################################

# Install necessary package:
# If the package dplyr is already installed, comment next line (add #):
install.packages('dplyr', repos = 'https://cloud.r-project.org')

# Load package:
library("dplyr")

################################################################################
# automatically define current directory as working path:
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))


# Define directory where WebMGA files are (substitute with your path):
#setwd("path/to/directory/with/files")

# Check if in correct directory:
getwd()
################################################################################

# List .txt files in the directory (The annotation files)
list.filenamesc <- list.files(pattern=".txt$")
str(list.filenamesc)

# Removes possible output already in this directory:
list.filenamesc[!grepl("cog_file.txt", list.filenamesc)]

# Creates an empty list that will serve as a container to receive the incoming files
list.datac <-list()

# Creates a loop to read the individual files data
for (i in 1:length(list.filenamesc))
  {aux_listc<-read.table(list.filenamesc[i], 
                        sep="\t", header=TRUE, quote="", fill=FALSE)
  aux_listc<-aux_listc[,-c(4,5)]
  colnames(aux_listc)[3]<-list.filenamesc[i]
  list.datac[[i]]<-aux_listc
}

# Adds the filenames of your data to the list
names(list.datac) <- list.filenamesc
str(list.datac)
final_mergec<-list.datac[[1]]

for (i in 2:length(list.datac)){
  final_mergec <- full_join(final_mergec, list.datac[[i]], by="Accession")
  print(i)}

# Changes NA to zero
final_mergec[is.na(final_mergec)] <- 0
str(final_mergec)

NAME <- grep("Name", names(final_mergec))
DES <- grep("Description", names(final_mergec))

NAMEc <- final_mergec[, NAME]
Descriptionc <- final_mergec[, DES]

COG_only <- final_mergec[,-NAME]
DES2 <- grep("Description", names(COG_only))
COG_only <- COG_only[, -DES2]

# Add NAME
finalC <- character()
row_iC <- 1

for (row_iC in 1:nrow(NAMEc)) {
  for(col_iC in 1:ncol(NAMEc)){
    if (!is.na(NAMEc[row_iC,col_iC])){
      finalC[row_iC] <- as.character(NAMEc[row_iC,col_iC])
      break
    }
  }
}
str(finalC)

# Add Description
finalDC <- character()
row_iDC <- 1

for (row_iDC in 1:nrow(Descriptionc)) {
  for(col_iDC in 1:ncol(Descriptionc)){
    if (!is.na(Descriptionc[row_iDC,col_iDC])){
      finalDC[row_iDC] <- as.character(Descriptionc[row_iDC,col_iDC])
      break
    }
  }
}
str(finalDC)

##############################################################################
# Join everything
COG_final <- cbind(finalC, finalDC, COG_only)

# Correct column names
colnames(COG_final)[colnames(COG_final)=="finalC"] <- "Name"
colnames(COG_final)[colnames(COG_final)=="finalDC"] <- "Description"
colnames(COG_final) <- sub(".txt", "", colnames(COG_final))

# Move COG identifiers to first column
COG_final <- COG_final %>%
  select(Accession, everything())

##############################################################################
# Creates CSV (comma separated value) file
write.csv(COG_final, "cog_table.csv", row.names = FALSE, quote=TRUE)
