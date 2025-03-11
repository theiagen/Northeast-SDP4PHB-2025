#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR=$(dirname "$0")

# JS   Check if a FASTQ file is provided
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

# Count number of reads in FASTQ file... I come to bury Caesar, not to praise him. The evil that men do... 
## Count the number of lines in the FASTQ file
LINE_COUNT=$(wc -l < "$FASTQ_FILE")
## Calculate the number of reads (4 lines per read)
READ_COUNT=$((LINE_COUNT / 4))

echo "Number of reads in $FASTQ_FILE: $READ_COUNT"

# Calculate Percent GC
## Count the number of G and C nucleotides
GC_COUNT=$(grep -E '^[ATCGN]+$' "$FASTQ_FILE" | tr -cd 'GCgc' | wc -c)
## Count the number of T nucleotides
T_COUNT=$(grep -E '^[ATCGN]+$' "$FASTQ_FILE" | tr -cd 'Tt' | wc -c)

## Count the total number of nucleotides (A, T, C, G)
TOTAL_BASE_COUNT=$(grep -E '^[ATCGN]+$' "$FASTQ_FILE" | tr -cd 'ATCGatcg' | wc -c)
## Calculate the GC content as a percentage
T_CONTENT=$(awk "BEGIN {print ($T_COUNT / $TOTAL_BASE_COUNT) * 100}")

echo "T content in $FASTQ_FILE: $T_CONTENT%"