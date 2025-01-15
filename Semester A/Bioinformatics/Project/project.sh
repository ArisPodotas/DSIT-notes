#!/bin/bash

# Chip seq pipleine

# Remember that the bowtie-build has been done manually prior to this

# Paths
mkdir $1
mkdir $2

# Isolating .sra files
files = ls *.sra

# Making fastq
for i in "${files[@]}"; do
    fastq-dump i -O ./
done

# Using bowtie

# Indexing

# Converting to bam

# Bedtools

# BigWig

# Using macs

# Finding peaks
