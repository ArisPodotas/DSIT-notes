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

# Lesson 2

Bioconductor is a R repository that has hundreds of tools for biological analysis

The other teacher Alexandros Dimopoulos

If I dont have a accound I can go to the documents and get the pdf

## GNU/Linux

It's a operating system based on unix. Unix is not free. An operatin system exist for us to talk to the computer with an interface.

How to connect to the virtual machine they provide

Linus torvalds and Richard stallman.

The GNU is the free software foundation producing the free manuals. The thing he missed is the Kernel, Linus wrote the kernel.

It's free, it's open sourse.

### Distros

(Debian is the best he says)

<hr>

### Gui vs CLI

* some things are faster in each.

<hr>

### The shell

* Not user friendly

The "$" is for the user
"#" is for the root or administrator

The "top" command: Gives information for what is running on the machine.
The "&" command: the command is executed in the background
"fg" Will bring it to the foreground. This is good for parallelization of tasks.
The "ls" command: lists all the things in this directory. -i will give you the full privilages
The "cd" command: changes directory. Empty takes me to ~.
The "pwd" command: prints current wroking directory.
Im not writing man and all this
. and .. relative notation
im not writing the mkdir things
and mv
rmdir and rm
the up and down arrow $\Uparrow \Downarrow$
cut for csvs
tr for substitution
grep for regex
gzip make a zip
zcut: cut for zip files
zless less for z files

drwxi-xr-x
^
|
link or dir l, d

drwxi-xr-x
 ^
 |

drwxi-xr-x
  ^
  |

drwxi-xr-x
   ^
   |

These are 3 for 1 group of rwx read write execute
The next 3 are the same group for another user

<hr>

### The file structure

bin = binary: executables that come innate with the operating system
dev = devices: stdout is here stdin and everything connected your gpu the things your machine needs to interact with
etc = etcetera: configuration files for most programs.
home: has user subdirectories for each user.
tmp = temporary: For everything that is temporary, everything will be deleted upon rebooting, everyone has rw acess in tmp
usr = user: For when you install 

Everything is a file

<hr>

They provide acess to a virtual machine that runs bash (Bourne again shell)

### Executable files

in windows you have a .exe

In linux you dont really have a file extention

Path enviroment variable $PATH

### Operators

">" write to file
">>" append to file
"2>" write stderror to file
"&>" Both stdout and stderror to a file
"|" redirect to another command

### SSH

Secure shell for connecting to another machine
you need a username and either a password | key
ssh key

Create a key 

ssh keygen rsa

Asks for a passfrase:
now in the file i have two things a .pub and a .priv
two keys for security and being able to send the public key to lots of people and only one person with the private key will be able to use their key to gain acess tot the public information you have uploaded

We use one such virtual machine that we use one such ssh
go to the eclass files and paste your generated public key and they will add you

Exercise 2 on eclass

# Lesson 3

if the ssh keys require the key twice it means that it has not kept you in the datbase for the keys

## SSH

ssh user#@genomics-lab.fleming.gr

scp user#@genomics-lab.fleming.gr:
scp user#@genomics-lab.fleming.gr:/tmp

if you wanna send files use filezilla

The screen command for the gui and running things when the connection is off
I like screen use it alot

screen -rx for viewing the command line at the same time from different pc's.

----------

## R

Is a programming language based on GNU/S that is not open source and is interpreted.

This interpretation fo the files means that the lines are capable of being run one at a time.

Why R?

* It's free
* large user community
* Flexible
* Graphics
* Fast
* Interface with office excel
* Can program almost anything and save and repeat

# Lesson 4 レーソン4

more R

NA - Not available

NA is propagated, meaning that any calculataion with a NA will result in NA.

Null is non propagated.

# Lesson 5 レーソン五

RNA sequencimng and next generation sequencing in general

But first we will talk about the exercise (first itib)

A little revamp on the noble prizes this year but not so much the machine learning ones like the other classes more so on the biological

Things like alphafold and the results it has begot.

If you have two spacialy close aminoacids and they are both hydrophobic if you mutate one you should mutate the other one too to maintain the interaction, data like this can be made into a map and alphafold works somewhat like this

Then the nobel prize in medicine for the new type of regulatin of genes throught microrna's.

Then the Neural Network based nobel prize.

## NGS

Running the tuxedo and trinity software and visualizing the results.

A little insight into the Sanger sequencing.

### Illumina sequencing

small fragments of dna ampliffied and tagged with different ends that you can glue to the glass slide in groups. Note that the glass will have the opposite end annealed tothe glass so that the sequences can be recognized. YOu cna amplify right after the annealing for clusters of the same sequence.One by one fluorecent nucleotides are added tot he dsequences and each time they give a flurescent signal that can be read with a flashlight andoutput to an image. So your final images are of a grid that in each snapshot you have a different nucleotide and each position is another cluster.
* 50 Gbp per day yield
* Max yield per day is 6000 Gbp

These are in a special format int he computer
the .fastq format sequence and corresponding quality score encoded with an ascii character.
1. Unique instrument ID and run ID
2. Flow cell ID and lane
3. Tile number within the flow cell lane
4. 'x'-coordinate of the cluster within the tile
5. 'y'-coordinate of the cluster withint he tile
6.

### emPCR

Is the same with bead annealed sequences instead of glass annealed and multiple nucleotides per run, you have pairs of nucleotides and they all have a different color

### ion torrent

Every time a nucleotide is encoded into the sequence a hydrogen proton is being generated and this proton if you have alot of them they will change the ph of the well. So you make a chip with coordinace and amplify all the wells and attach to a sphere thus when you add nucleotides you will get current in wells that correspond at that position. Remember that bigger peaks are from multiple of tha same nucleotide being added in the well.

* 8Gbp per run 100bp reads

### Nanopore

Singel dna strand that moves throuht the pore and interupts the current flowing throught it upon wich the graph will pickup a drop in the current for a period of time, this change and the dt is related to the shape of the nucleotide that is being moved throught the the pore.

* Cheap and small

Good for handheld sequencing.

By parallelizing more pores on the same membrane you can improve the sequencing horizontally.

### Pacbio

YOu have a chip with wells where dna is being held at the bottom of the well and singe nucleotides are incorporated one byu one with a fluorescent modificatino. AT the bottom is a optical signal amplifier exactly where the thing that holds the sequence in exactly the spot the polymerase is at.

### DNA Nanoball sequencing

uh

## Reconstruction of RNA sequences

Fragmaentation of the sequence library of a cell and storage gets passed throught a sequencer that produces short reads
the fastq format ahs a /1 for left to right and /2 for the opposite of hte read. You get both pairs in total but to know what maps to what.

Fastqc tool for a report of my fastq files

Phred scores are a scale of quality 

= -10log10p where p is the probability of being incorrect taht we showed earlier and is pretty easy to calculate on your own.
Each method has a phred score and the graph ends up looking a little different as a results.

For each position you get a box whisker type plot of the thicographs for each positions statistics and confidence.

The sequence content across all bases should be the same throught the seqeunce. You should compare your sequence gc content with the ideal you have a priori

We check for the N unread identifier in all the positions.

Then the sequences should all be quite unique so we check how many of our sequences are unique by a graph of numer and copies ie read once = 1000 segments

Something like the Turing test where huyou check the doubles and triples and so on of the different possible segments you have gotten.

Sequence adaptor identification. By the way removal too.

Sequece reconstruction from rna seq reads tool named tophat and assemly of the constructs by cufflinks. If you don't have a reference you can use trinity to do the assembly and gmap to align the transcripts.

Some of the algorithms adapted to the se toolls are the Burrows Wheeler Transform

## Burrows Wheeler Transform

We are not interested in a gap alingment and we just care of the map alignments. Watch the videos in the base case this is almost a constant time performance O(n). While needleman has O(n^3).

Alignments are reported to a SAM format while doing the reconstruction from the original fastq file.

this was still too large so sam was converted to BAM

The Binary format.
To use a binary format file you need a tool that knows the conventions you ve made thus samtools was made.

Then there is the assembly phase that needs a parsimonious explanation of the fragments.

We would like to assign each read to a trasncript we got and for am graph of the alternative splice events we can get or got in the transcripts fro mthe rna seq form the origina lputative sequence, here the fewer connections that solve the graph the better
Here a opimization happens with a sort of pair bond algorithm. This is the Gale Shapley algorithm also known as a the stable marriage problem. Also something you might want to implement.

Onto measuring the abundances, we need to normalize the stats becuase one seqeunceing can have more or less reads that another so some sort of relative format needs to exist. FPKM

Once we have done all of this we can visualize the data in different ways that you can look at in the slides called tview in samtools. Other wise you can use a  graphical envoiroment called IGV. Transcript structures are stored in GTF format

We do a in calss experiment on the vm with IGV.

Visualization of De results (using mainly R from what I can tell) Volcano plot and MA plot. Heatmaps Green is up regulation and red is down regulation.


