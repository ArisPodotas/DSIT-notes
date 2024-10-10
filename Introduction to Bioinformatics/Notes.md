# Pre game

In total 15 lessons will be held

## Formulas to paste

Matrix:

\[\left[\begin{matrix} 1 & 1 & 1 \\ 1 & 1 & 1 \end{matrix}\right]\]

Vector:

Horizontal:

\[\left[\begin{matrix} a & b & c \end{matrix}\right]\]

Vertical:

\[\left[\begin{matrix} a \\ b \\ c \end{matrix}\right]\]

Integral:

\[\int\]

Derivative:

\[\]

Sum:

\[\displaystyle \sum\]

Inline
$\sum$

> Teacher name
> Martin reczko
> Alexandros Dimopoulos

# Lesson 1

> Martin reczko
1st lesson

> next 3
> Alexandros Dimopoulos

Go to https://tinyurl.com/suzfj6y4 for an accound on their machine and to be able to do the final exercise

## Syllabus and grading

These are the classes we will do
* Introduction
* Linux shell ssh
* R 
* R(2) 
* qcRNAseq
* Bedtoools/victools/smatrixs
* Denovo
* Exome/SNP calling
* ChipSeqChirp
* Presentations
* Presentaiton
* Metabolomics 
* Final project support

grade 30 % is the presentaton and 50 % is the exercise and the rest is tht exams in the end.

### Biology

The cell

Check notes from other classes because this is a little 15 minute thing to introduce us.

### For bioinformaticians

* decipher information contained in biological sequenceds
* duplicate the decoding

Computer speed and storage capacity is doubling every 18 months (moore's law).
Data growth in life sciences seems to be doulbing every 12 months.

~1800 molecular biology data resources

Incoming data size classes:

Organism | Number of chormosomes | Number of base pairs
Bacteria | 1 | 400000

42% of genes have unknown function

In bioinfo we go from 
Proteins | Genomes -> structute prediction -> molecular interactions -> biochemical netwroks -> chips: comparison of 

### Homology modeling
* Proteins with similar sequences tend to fold into similar structures

* a query sequecne Q, databe of protein structures

* do:
find protein P such that 
* structure of P is known
* P has a

Boyrer Moore string search algorithmn *unix grep*

Aligning text strings

definitions:

    Global alignemnt is two sequences S and T  of roughly the same length 
    Q: what is the maximum similarity between them
    find the best alignment

    local aligment input two sequences s and t 
    Q: What is the maximum similarity between a subsequence of S and a subsequence of T

    definition: A gap is the marimal contigroup

There is a graphical solution to this its the dot plot.

Needleman wunsch algorithm

Dynamic programming is a typical method for optimization

Best solutins up to n, then upon having a new node add the part of n to the end (the new best n).

Dynamic programming ideas

Kye idea in dynamic programmin the best alignement that ends at a given part i of position i and j in the the 2 sequences

#### Dayhoff's acceptable point mutations (PAMs)
The higher the number is in the matrix the more similar the sequences are.

In dynamic programming

1. Initialize a matrix (1 and None)

2. Do summation operation (move throught the matrix and change the values based on relevant data)

3. Traceback to find the maximum path

Read the needleman winsch again

Introduction to novel sequence learning algorithms (BLSTM)

Alphafold and alphafold 2 ( there is a database of things you can use form thir predictions)

Dome ml website

install x2go
access to virtueal machine

exercise 1

send solution to  mareczko@di.uoa.ge
pdf file
