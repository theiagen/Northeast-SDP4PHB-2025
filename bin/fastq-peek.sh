#!/bin/bash

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

# Calculate the GC content
## Count the number of G and C nucleotides within the input fastq file
GC_COUNT=$(sed -n '2~4p' "$FASTQ_FILE" | tr -cd 'GCgc' | wc -c)
## Count the total number of nucleotides within the input fastq file
TOTAL_BASE_COUNT=$(sed -n '2~4p' "$FASTQ_FILE" | tr -cd '[A-Za-z]' | wc -c)
## Calcuate GC content as a percentage
GC_PERCENT=$((100*GC_COUNT/TOTAL_BASE_COUNT))

echo "Number of reads in $FASTQ_FILE: $READ_COUNT"
echo "GC content in $FASTQ_FILE: $GC_PERCENT%"
