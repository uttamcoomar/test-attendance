# Load libraries
library(tidyverse)

# Define all batches
all_batches <- paste0("EP", 1:16)

# Function to get absent batches (one-liner style)
get_absent <- function(file) {
  setdiff(all_batches, unique(trimws(unlist(strsplit(read_csv(file, show_col_types = FALSE)$Section, "[,\\s]+")))))
}

# Get absent batches for each quiz
absent_list <- list(
  Quiz1 = get_absent("MEM251_Quiz_Even Sem_2025_2026_E1_Responses.csv"),
  Quiz2 = get_absent("MEM251_Quiz_EvenSem_2025_2026_E2_Responses.csv"),
  Quiz3 = get_absent("MEM251_Quiz_EvenSem_2025_2026_E3_Responses.csv"),
  Quiz5 = get_absent("MEM251_Quiz_EvenSem_2025-2026_E5_Responses.csv")
)

for (quiz in names(absent_list)) {
  cat("\n", quiz, "absent batches:\n", sep = "")
  cat(paste(absent_list[[quiz]], collapse = ", "), "\n")
}

# View results
# print(absent_list)

# Find batches absent from all quizzes
# print(Reduce(intersect, absent_list))


