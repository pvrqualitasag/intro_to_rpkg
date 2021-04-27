#' ---
#' title: Check Pedigree
#' date: "2021-04-27"
#' ---
#'
#'
#' ## Command Line Arguments
args <- commandArgs(trailingOnly = TRUE)
ped_file <- "inst/extdata/pedigree/test_pedigree.txt"
# ped_file <- args[1]
cat(" * Check pedigree file: ...", ped_file, "\n")


#' ## Reading Pedigree File
#'
tbl_ped <- readr::read_delim(file = ped_file, delim = "|")


#' ## Check Uniqueness of ID
#'
l_result <- list(unique_id = length(unique(tbl_ped$ID)) == nrow(tbl_ped))

#' ## Check Sex of Parents
#'
vec_sire <- unique(tbl_ped$sire)
vec_sire <- vec_sire[!is.na(vec_sire)]
vec_sire_wrong_sex <- vec_sire[tbl_ped$sex[vec_sire] != "m"]
l_result[["sire_wrong_sex"]] <- vec_sire_wrong_sex


#' ## Result
#'
print(l_result)
