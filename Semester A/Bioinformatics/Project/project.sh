#!/bin/bash

# Chip seq pipleine

# Installing the sra toolkit
# wget --output-document sratoolkit.tar.gz https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-ubuntu64.tar.gz
# tar -vxzf sratoolkit.tar.gz

# Downloading files
# prefetch SRR452931
# mv ./SRR452931/SRR452931.sra ./
# rm ./SRR452931/
# fastq-dump -v --split-3 SRR452931
# prefetch SRR524934
# mv ./SRR524934/SRR524934.sra ./
# rm ./SRR524934/
# fastq-dump -v --split-3 SRR524934
# prefetch SRR524936
# mv ./SRR524936/SRR524936.sra ./
# rm ./SRR524936/
# fastq-dump -v --split-3 SRR524936
# prefetch SRR524939
# mv ./SRR524939/SRR524939.sra ./
# rm ./SRR524939/
# fastq-dump -v --split-3 SRR524939

# Getting the genome
# wget -a https://hgdownload.cse.ucsc.edu/goldenpath/hg18/bigZips/hg18.chrom.sizes
# wget -a https://hgdownload.cse.ucsc.edu/goldenpath/hg18/bigZips/hg18.fa.gz
#gzip -d hg18.fa.gz

# bowtie-build hg18.fa hg18

# Paths
mkdir $1
mkdir $2

# Converting to bam

# Bedtools

# BigWig

# Using macs

# Finding peaks
