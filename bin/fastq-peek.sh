#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR=$(dirname "$0")

# Check for the --gc-content flag
CALCULATE_GC=false
if [[ "$1" == "--gc-content" ]]; then
    CALCULATE_GC=true
    shift  # Remove the flag from the argument list
fi

# Check if a FASTQ file is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 [--gc-content] <fastq_file>"
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
LINE_COUNT=$(wc -l < "$FASTQ_FILE")
READ_COUNT=$((LINE_COUNT / 4))

echo "Number of reads in $FASTQ_FILE: $READ_COUNT"

# Calculate Percent GC only if the flag is set
if [ "$CALCULATE_GC" = true ]; then
    GC_COUNT=$(grep -E '^[ATCGN]+$' "$FASTQ_FILE" | tr -cd 'GCgc' | wc -c)
    TOTAL_BASE_COUNT=$(grep -E '^[ATCGN]+$' "$FASTQ_FILE" | tr -cd 'ATCGatcg' | wc -c)

    # Prevent division by zero
    if [ "$TOTAL_BASE_COUNT" -eq 0 ]; then
        GC_CONTENT=0
    else
        GC_CONTENT=$(awk "BEGIN {printf \"%.2f\", ($GC_COUNT / $TOTAL_BASE_COUNT) * 100}")
    fi

    echo "GC content in $FASTQ_FILE: $GC_CONTENT%"
fi
