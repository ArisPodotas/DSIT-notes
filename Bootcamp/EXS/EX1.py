# Author: Aris Podotas
# For DSIT, Bioinformatics - Biomedical data
# Date: 01-10-2024
# Tabs: spaces, 4

# EX1

# Part 1

# Write a Python script to perform the following tasks on the strings:

# String1 (it is one long string!)
seq1 = '-CAGGTGGTGATGGCGGAAAGGTCACACCCGAACACATCCCGAACTCGGAAGTTAAGCTTTCCAGCGCCGATG-GTAGTTGG--GGGTTTCCCCCTGCGAGAGTAGGACGTTGCCGGGCAACGGCGGTCATAGCGGTGGGGAAACGCCCGGTCCCATCCCGAACCCGGAAGCTAAGCCCACCAGCGCCGATG-GTACTGCACTC-GTGAGGGTGTGGGAGAGTAGGACGCCGCCGGACGCTGGCGACCATAGCAAGAGTGAACCACCTGATCCCTTCCCGAACTCAGAAGTGAAACCTCTTCGCGCTGATG-GTAGTGNGG-GT-GTA-CCCATGTGA-AGTAAGTCATCGCCAGCTGTCGGTGGTCATTGCGGAGGGGGAACGCCCGGTCCCATCCCGAACCCGGAAGCTAAGCCCTCCAGCGCCGATG-GTACTGCACTC-GCCAGGGTGTGGGAGAGTAGGTCGCCGCCGACA'

# String2 (it is another one long string!)
seq2 = '--CAGGTGTGATGGCGGAAAGGTCACACCCGAACACATCCCGAACTCGGAAGTTAAGCTTTCCAGCGCCGATG-GTAGTTGG--GGGTTTCCCCCTGCGAGAGTAGGACGTTGCCGGGCAACGGCGGTCATAGCGGTGGGGAAACGCCCGGTCCCATCCCGAACCCGGAAGCTAAGCCCACCAGCGCCGATG-GTACTGCACTC-GTGAGGGTGTGGGAGAGTAGGACGCCGCCGGACGC-TGGCGACCATAGCAAGAGTGAACCACCTGATCCCTCCCGAACTCAGAAGTGAAACCTCTTCGCGCTGATG-GTAGTGNGG-GT--TA-CCCATGTGAGAGTAAGTCATCGCCAGCTGTCGGTGGTCATTGCGGAGGGGGAACGCCCGGTCCCATCCCGAACCCGGAAGCTAAGCCCTCCAGCGCCGATG-GTACTGCACTC-GCCAGGGTGTGGGAGAGTAGGTCGCCGCCGACA'

# ●	Calculate the base occurrence frequency, per string. The strings contain bases ("A", "G", "T", "C"), but also contain errors (e.g., "-", "N"). An example of the output should be like (note that these are not the results!): 

# TOTAL BASES FOR STRING 1: 100, ERRORS: 5, "A": 45, "G": 25, "T": 15, "C": 10. TOTAL BASES FOR STRING 2: 100, ERRORS: 5, "A": 35, "G": 35, "T": 10, "C": 15. 

def count_contents(seq) -> dict:
    """Returns a list of the count of each nucleotide in the sequence in order of [A, T, G, C]."""
    # Initiate a data structure
    counts = {"A": 0, "T": 0, "G": 0, "C": 0, "-": 0, "N": 0}
    # Iterates nucleotides of the sequence
    for nuc in seq:
        # Iterates over the data structure
        for ref in counts:
            # Compares the sequence and the data structure
            if nuc == ref:
                # Add 1 to the appropriate hit
                counts[ref] += 1
                # No need for a exceptin case
    # return resulting dictionary
    return counts

# Call functions into variables to not re run the function mutliple times per string
result1 = count_contents(seq1)
size1 = len(seq1)
result2 = count_contents(seq2)
size2 = len(seq2)
# Output
print(f"TOTAL BASES FOR STRING 1: {size1}, ERRORS: {result1["-"] + result1["N"]}, \"A\": {(result1["A"])}, \"G\": {result1["G"]}, \"T\": {result1["T"]}, \"C\": {result1["C"]}")
print(f"TOTAL BASES FOR STRING 2: {size2}, ERRORS: {result2["-"] + result2["N"]}, \"A\": {(result2["A"])}, \"G\": {result2["G"]}, \"T\": {result2["T"]}, \"C\": {result2["C"]}")

# •	Calculate the number of matches (per base) and mismatches, when you align the strings. E.g., you can already see 3 matches at positions 5, 8, 9 (G<-->G, G<-->G, T<-->T), and 7 mismatches (-<-->-, C<-->-, A<-->C, G<-->A, etc) in the left area of the two strings: 

# -CAGGTGGT... (first string)
# --CAGGTGT... (second string)

# An example of the output should be like: A-A matches=10, G-G matches=20, T-T matches=15, C-C matches=5, mismatches=100.

def align(seq1, seq2) -> tuple:
    """Returns a dictionary with matches and mismatches of two sequences"""
    # Initializing variables
    matches = {"A": 0, "T": 0, "G": 0, "C": 0, "-": 0, "N": 0}
    # Iterating the first sequence
    for index, nuc in enumerate(seq1):
        # Checking match of positions with sequence 2 by indexing into the same position in the second sequence
        if nuc == seq2[index]:
            # Increasing matches
            matches[nuc] += 1
    # Everything left is a mismatch so we will calculate it once here instead of re adding 1 in an else statement
    mismatches = len(seq1) - (matches["A"] + matches["T"] + matches["C"] + matches["G"])
    return matches, mismatches

output = align(seq1, seq2)
print(f"A-A matches = {output[0]["A"]}, G-G matches = {output[0]["G"]}, T-T matches = {output[0]["T"]}, C-C matches = {output[0]["C"]}, mismatches = {output[1]}.")

# Part 2

# Here are some DNA segments that are experimentally verified sequences with high affinity to GATA3 transcription factor:

sequences = [
    'AGATAG',
    'AGATAG',
    'AGATAG',
    'AGATAG',
    'CGATAG',
    'AGATAC',
    'AGATAA',
    'GGATAC',
    'CGATTG',
    'CGATTG',
    'AGATAG',
    'AGAGAG',
    'CGATAC',
    'AGATTG',
    'CGATAG',
    'AGATAC',
    'AGATAA',
    'GGATAC',
    'CGATTG',
    'CGATTG'
]

#  Write a Python script to process those strings in order to calculate the Position Frequency Matrix (PFM). The PFM is a matrix of the form:

# Base/Position	1	2	3	4	5	6
# A	11	0	20	0	15	2
# T	...	...	...	...	...	...
# G	...	...	...	...	...	...
# C	...	...	...	...	...	...

# The values in the cells are the frequencies of bases' occurence in strings' positions. E.g., 11 means that "A" appears 11 times in the 1st position of each string, 0 means that that "A" appears 0 times in the 2nd/4th position of each string, etc. An example of the output should be like:

# A: 11, 0, 20, 0, 15, 2
# T: .........
# G: .........
# C: .........

def matrix(array):
    """Returns a dictionary with the position frequency matrix of a list of sequences"""
    # Creating a data structure to help formatting
    # Getting the length of the sequences
    positions = len(array[0])
    # Making a dictionary for each position in the sequences
    indecies = [{"A": 0, "T": 0, "G": 0, "C": 0}]*positions
    # Iterating sequences (plural)
    for seq in array:
        # Iterating sequence (singular)
        for position, nuc in enumerate(seq):
            print(position, indecies[position])
            indecies[position][nuc] += 1
            print(position, indecies[position])
    return indecies

result = matrix(sequences)
print(result)
# print(f"""Base/Position| {range(result)}
# A: {result}
# T: {result}
# G: {result}
# C: {result}
# """)

# Notes
# ●	Questions only in our Teams channel.
# ●	Prepare only one notebook, and send it to dalamag@athenarc.gr and ggeorgakilas@athenarc.gr using the subject in the exact form: PYTHON BOOTCAMP 2024 EX1 LASTNAME FIRSTNAME 
# ●	Explain your code/solutions with markdown text inside the notebook. No markdown, no pass. In any case, your notebook should work like a charm!
# ●	Deadline (Thu Oct 3 - 23:59), STRICT (really).
#
