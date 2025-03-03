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
## Count the number of G and C bases in FASTQ file
GC_COUNT=$(sed -n '2~4p' $FASTQ_FILE | tr -cd 'GCgc' | wc -c)
## Count the total number of bases in FASTQ file
TOTAL_BASE_COUNT=$(sed -n '2~4p' $FASTQ_FILE | tr -cd 'ATCGatcg' | wc -c)
## Calculate GC percent with awk because bc isn't recognized...
GC_PERCENT=$(awk "BEGIN {print ($GC_COUNT / $TOTAL_BASE_COUNT) * 100}")

echo "Number of reads in $FASTQ_FILE: $READ_COUNT"
echo "GC Count: $GC_COUNT"
echo "Total number of bases: $TOTAL_BASE_COUNT"
echo "GC Percent : $GC_PERCENT%"