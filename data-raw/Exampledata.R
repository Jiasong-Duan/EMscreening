## code to prepare `Exampledata` dataset goes here

load("D:/Building R package/EMscreening/data-raw/PhenotypeE.RData")
PhenotypeExample= Phenotype
load("D:/Building R package/EMscreening/data-raw/DNAmE.RData")
DNAmExample = DNAm

usethis::use_data(PhenotypeExample, DNAmExample, overwrite = TRUE)
