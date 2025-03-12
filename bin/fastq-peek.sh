#!/bin/bash

# # Get the directory of the current script
# SCRIPT_DIR=$(dirname "$0")

# # Check if a FASTQ file is provided
# if [ "$#" -ne 1 ]; then
#     echo "Usage: $0 <fastq_file>"
#     exit 1
# fi

# FASTQ_FILE=$1

# # Check if the provided file exists
# if [ ! -f "$FASTQ_FILE" ]; then
#     echo "Error: File '$FASTQ_FILE' not found!"
#     exit 1
# fi

# echo "Processing FASTQ file: $FASTQ_FILE"

# # Count number of reads in FASTQ file
# LINE_COUNT=$(awk "NR % 4 == 2" ${1} | wc -l)

# # count the non-ATCG bases
# TOTAL_BASE_COUNT=$(awk "NR % 4 == 2" ORS="" ${1} | tr -d "Nn" | wc -c)

# # get the GC count
# GC=$(awk "NR % 4 == 2" ORS="" ${1} | tr -dc "GgCc" | wc -c)

# # then as a percentage
# # this doesnt actually work because there is no bc in the venv
# GC_PERCENT=$(echo "scale=2; ${GC} / ${TOTAL_BASE_COUNT} * 100" | bc)

# echo "In sample, ${1}, there are ${LINE_COUNT} reads with ${TOTAL_BASE_COUNT} bases with a GC content in ${GC_PERCENT}%"

# Get the directory of the current script
SCRIPT_DIR=$(dirname "$0")

# Check if a FASTQ file is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <fastq_file>"
    exit 1
fi

FASTQ_FILE=$1

# Check if the provided file exists
if [ ! -f "$FASTQ_FILE" ]; then
    echo "Error: File '$FASTQ_FILE' not found!"
    exit 1
fi

echo "Processing FASTQ file: $FASTQ_FILE"

# Count number of reads in FASTQ file
## Count the number of lines in the FASTQ file
LINE_COUNT=$(wc -l < "$FASTQ_FILE")
## Calculate the number of reads (4 lines per read)
READ_COUNT=$((LINE_COUNT / 4))

echo "Number of reads in $FASTQ_FILE: $READ_COUNT"

# Calculate Percent GC
## Count the number of G and C nucleotides
GC_COUNT=$(grep -E '^[ATCGN]+$' "$FASTQ_FILE" | tr -cd 'GCgc' | wc -c)
## Count the total number of nucleotides (A, T, C, G)
TOTAL_BASE_COUNT=$(grep -E '^[ATCGN]+$' "$FASTQ_FILE" | tr -cd 'ATCGatcg' | wc -c)
## Calculate the GC content as a percentage
GC_CONTENT=$(awk "BEGIN {print ($GC_COUNT / $TOTAL_BASE_COUNT) * 100}")

echo "GC content in $FASTQ_FILE: $GC_CONTENT%"