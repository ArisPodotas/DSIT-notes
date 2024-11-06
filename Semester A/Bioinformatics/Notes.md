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
