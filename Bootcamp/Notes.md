# This functions as the notes i can send others who I actually care about

# Lesson 1

# Versions

Python 2 or 3 it wont matter for the bootcamp it's only simple stuff

# Why Python

* easy
* Dynamc ( you dont need ot define your variables in the beginning
* cross platform

* Libraries
    Thousands of libraries
    - Django
    - Flask
    - Pandaas
    - Tnesor flow

Major disadvantage

- slow
    Because of the interpreter (as opposed to a compiler)
    Why is it a problem, Because it's not as fast to assembly

"By definition python is a slow programming language"


# We will start with the basic stuff

## Variables and Data types

They are containers for storing values
You reserve memory when you declarte a variable

Usually in programming languages
* int
* float
* str
* bool
* NoneType

Tradittionally you need to declare the values before you use it
Not the case in python
you just use it in a straight forwards way
This is called dynamically data typing
The type is determined at run time

## Is this an advantage ?

Python will guess it at runtime and thats slow
it can be harder to debug the program since its easy to see whats happening if all the variables are at the start of the file

# Memory managment

When you declare a variable in any progarmming language3 the compiler isloates memory and assigns it to the variable.
The problem is that if you dont reserve the type it wont know how much memory to give you.

(segment with the writing) (and printing)

# In jupyter

You create cells
Each cell might be a cell that i will type code, or maybe a cell for typing notes

## Markdown

You assign the cell a markdown type!
(example of markdown)
You must run the cell
with the run cell button

You can obviously write python code too.

The idea of having this envoiroment is that i can have notes nad pieces of code in the same time
It's a file so you can save run and send it.
These are the famous jupyter notebooks

## Type conversion

Casting
(you know the drill)
(you passed the test)

# The del keyword

I didn't know this but python has a del
x = 5
y = x
del x # Memory is managed automatically x is now free'd
y will still have its value

# Exercise in Python

bmi calculator

## The input function

We also type cast immediately

* I get to see how the input works in jupyter
* Foramt strings (They use f"" thank god)
* You can drag text in jupyter

This has been good vim practice

# Personal choice

## You are free to use whatever editor
## They use three spaces (manual entry)

# Basic operations and expressions

## Logic

Expressions return 1 and 0 for True and False respectivly

## Control flow

This is apparently a name for, for loops, while loops and if, else

### Logic

Exercise

<!--Remember to Change vim setting for space enter-->
<!--I Changed it-->

### Loops

The while loops will check the contition every time
The loop of the condition being false does not get run

Exercise

The range functuion
* range(start, stop, step) # up to stop but not including at start including the digit

Could you use a for loop by just passing the start stop step instead of the range funcion?
Range returns a list

## Break and Continue

* Both of these are bad practice!!!
- Because the break is asychronus (it says stop whatever you are doing)

# Example of programming with a biological condition

Look at mrna.py

# Menti.com

Main take aways from the lesson for me are the things we said at the start about the interpreter and everything regarding jupyter
Maybe some little things about specific functions just like the del keyword

# Lesson 2

## Go and download from teasm Class materials

Normally I would have doen this already but i cant connect they might have removed my account in the system from the sbi

# Functions

It's considered bad practicce to use the global and nonloacl keywords

The sum function and the len function

return values

list comprehentions

for num in []

Particularly they used the input function with the .split() at the end

The ':' at the end

I assume he said something about comments too but i musty have missed it beacuse he uses them but I dont rememver anything

## Jupyter

Apparently the different blocks of jupyter have a continuity within them.
I say this because a function defined in one seems to exist in another.

Progam for leap years

### This is what the control flow looks like

If a year is devisible by 4 it's a leap year, unless it's a end of century year which must also be divisible by 400

if (year % 4 == 0 and year % 100 != 0) or( year % 400 == 0):
* Above is True when its a leap year

Another example (We arent using functions yet)

Multiplication table example

Write a function that return the factorial of a number
```python
def factorial(n):
    result = 1
    for i in range(1, n + 1):
        result = i * result
    return result
```

# We moved to L2-1

## Data structures

We use them in order to organise our data and manipulate it

They are supposed to be fast

We will see a non fast one

A good programmer knows which data structure to use for which problem.
Sometimes you might not want to be fast.

"I would say that a list is an array"
* Ordered
* Different data types
* Defined by square brackets []
* You may create lists from other lists

- example : list([1,2,3])

The "list()" is the ***constructor***

### Methods

* append
* remove (a specific value
* insert(index, value) (for a specific position) <!--I like this one-->
* pop() Removes a element from al list at a position<!--I like this one-->

### Slicing

Define a start and a end and get a slice

* start is inclusive
* stop is exclusive

list[start:stop:step]

0 indexed <!--Lol get rekt lua-->

- [x] Rafail has a notebook open in vscode and it works in the app not the web browser

Example of 0 indexing

"|" is literally the cursor right now
And thus the index too

0:

|abcse
^
|
Pos 0

0:4
abcs|e
    ^
    |
    Pos 4

### Question about sort vs sorted

Tere are two issues here
when you sort you can sort in differetn ways
"I'm not sure what this sort uses"
now this sort method when you apply it in the variable it affects the variable if you dont want to affect you can just copy the variable to another and then sort it

sorted is a function
sort is a method
### Questin about the negative indexing

yes it still form the 0 position

### Post break

# Converting lists to sets

Basically the intro to sets

Example 1 I'll just skip it for now since you know what the conversion does

Example 2
Write a program that creates the first 10 squares

<!--Go read about list multiplicatiuon-->
Read syntax [0]*10 # a list with 10 elements each is 0

Otherr option is to init as a empty list and use the append method instead of writing over it

What is the problem here
With a empty list you cannot use indexing to identify positions
Pre allocated memory

What does []*10 do
 #Nothing

Short hand syntax forl ists with comprehentions

```python
list(range(1,11))
same as multiplicatin but with different values
```

# Tuples

## Immutability
: the values cannot be modified :

used in return statements

* ()

tuple unpacking
(* ???)
(No)

```python
person = ("Alice", 30, 10)
n, x, y = person
```
*(will work)

## Try and except

and errors obv

Test about execution times of different data types

### import time

* time.pref_counter()

List append time
0.0128

Tuple
```python
mytuple = ()
x = range(100000)
start = time.pref_counter()
for item in x:

    mytuple = mytuple + (item,) # the comma helps the language tell the computer its a tuple
print("Tuple: ")
```
Time: 12.1

The issue with the tuple
the "=" is an assignment
you cant assign a tuple
it creates a copy
and it assumes the type
ergo slow
around 100 times slower

```python
a = [1,3,5,7]
print(a)

b = a
b[0] = 10
print(a)
```
[10, 3, 5, 7]

This makes errors in larger code bases harder to spot
"The lesson that you can learn is that you should not use tuples in scenarios that you want to modify things"
Otherwise working with tupels might be a cause for serious delay in you program

### Assignment question

### Function return values

No a reutrn list will not give a tuple
<!--You know what that means-->

### Question about a, b = b, a

Why not both 10 after
python magic
essentialy two variable switching like the exercise i had done look in software/exercises there is an example <!--Sorry to anyone who isnt Ari but this is a local thing oops-->

Example of persons name age and prfession
and unpacking

# Dictionaries

### Post break

The concept of key value pairs

Very fast lookups
because its very easy to ask for a key to get the value

* {}
* get method (seems to have a second parameter for erros if the key is not in the list)
* update method
* keys method
* values method
* items method (returns key value pairs)

Iterating over dictionaries

You need to use two varibales when interating the dict

My question about the jupyter md backtick code segment was answered because he did it and its pretty nice looging

Exercises 1

Class average

```python
student_grades = {"Alice": 88, "Bob": 92, "Charlie": 79, "David": 85}

my_sum = 0
for i in students_grades.values():
    my_sum += i
print(my_sum / len(students_grades)
```
86 btw bros are so good
<!--Get predicted with the code-->

Other way to do the same with less writing is the sum method
Or even the stat.average method like

The pythonian way
Rafail is gonna be so mad he didn't say pythonic

Create a simple phone book program using a dictionary that allows adding, delelting and looking up phone numbers

### deleting a entry in a list

del dict[key]
Note use a if key in dict:

### Note

we like else when it is un nessaccary for printing for debugging reasons

# Counting bases in a dna string

My solution
```python
def count_contents(self):
    """Returns a list of the count of each nucleotide in the sequence."""
    counts = [["A", "T", "G", "C"], [0, 0, 0, 0]]
    for nuc in self.seq:
	for ref in range(4):
	    if nuc == counts[0][ref]:
		counts[1][ref] += 1
    a = counts[1][0]
    t = counts[1][1]
    g = counts[1][2]
    c = counts[1][3]
    counts[1] = [a, t, g, c]
    return counts[1]
```

# Sets

* union( | )
* intersection ( & )
* difference ( - )
* symmetric difference ( ^ )

* No duplicates

# Lesson 3

## L3 -1 short

File IO

```python
query = open("file", "rwxa")
query.read()
query.readlines()
query.write()
query.close()

```

* The close command is really curtial

w: write - will overwrite the content
a: append - Will just add content to the end of the file

### Example from the notebook
```python
# Writing to a file
file = open('sample.txt', 'w')
file.write('This is a sample text file.')
file.close()
```
It will write to the file in the jupyter notebook
it has access to your local files

```python
# Reading from a file
# ...
#### Start
file = open('sample.txt', 'r')
content = file.read()
print("File content: ", content)
file.close()
```
The file variable contains the file handler that hte open function returns

Now we add a line to the file sample.txt

```python
# Appending to a file
# ...
file = open('sample.txt', 'a')
file.write('\nAppending a new line.')
file.close()

```

Reading the updated file

```python
# Reading the updated file
file = open('sample.txt', 'r')
updated_content = file.read()
print("Updated file content:", updated_content)
file.close()
```

### Problem with the above

If i just call the read method and the file is huge
we leave a huge amount of your memory stuck
* In real applications this is a pain in the neck
    what we do especially in files that are structured
    we read the file line by line

### The With statement from python

Automatically close the file if you forget to

```python
with open('sample.txt', 'r') as file:
   content = file.read()
   print(content)
```

Writing with the with statement

```python
# Writing with the with statement
with open('sample.txt', 'w') as file:
    file.write('Overwriting content using the with statement.')
```

Now file content has been changed

### question about speed of re opening files

- No its not that slow

* We can re use the variable outside the loop

## Handling large files Efficiently

What we do is read it line by line

Using a `for` loop:
```python
with open('large_file.txt', 'r') as file:
    for line in file:
    print(line.strip())
```

What is `strip()`?:
    It removes the newline feed at the end of the line

### Reading chunks

This is how you can read a file line by line with a while loop and a specific number of bytes
```python
with open('large_file.txt', 'r') as file:
   chunk = file.read(1024)  # Read 1024 bytes
   while chunk:
      print(chunk)
      chunk = file.read(1024)
```

```python
# Simulating reading a large file line-by-line
with open('sample.txt', 'r') as file:
    for line in file:
        print("Line: ", line.strip())

```

### Here is a example of reading infomation to a variable

```python
# Simulating reading a large file in chunks
with open('sample.txt', 'r') as file:
    chunk = file.read(10)  # Read 10 bytes at a time
    while chunk:
        print("Chunk:", chunk)
        chunk = file.read(10)
```

If you run it the words are cut
Because usually you use this for binary files

Exercises: File I/O Operations


```python
with open('numbers.txt', 'w') as file:
    for i in range(1, 11):
        file.write(f"{i}\n")
```

Now the file numbers.txt has 1 to 10

Appending to it

```python
with open('numbers.txt', 'a') as file:
    for i in range(11, 21):
        file.write(f'{i}\n')
```

Printing contents

```python
with open('numbers.txt', 'r') as file:
    for line in file:
        print(line.strip())
```

## Frequency of occurence of sequences

I'm taking it form my solution
its the same but the data is in a file
We will use the solution from the previous lecture
I will make a little modification for file reading in the solution i gave

```python
# ... copy paste code from from previous lab, and adapt!!!
# ...
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

with open('testdna2.txt', 'r') as file:
    for line in file:
        sequence = line
        result = count_contents(sequence)
        print(f"Sequence: {line[:10:]}..., Frequencies: {result}")
```

## Ploting in matplotlib

We will use the previous piece of code

We will use the dictionary keys as x values and the values as y values


```python
import matplotlib.pyplot as plt

with open('testdna2.txt', 'r') as file:
    for line in file:
        sequence = line
        result = count_contents(sequence)
        print(f"Sequence: {line[:10:]}..., Frequencies: {result}")

        # Extract keys and values
        keys = list(result.keys())
        values = list(result.values())
        plt.figure(figsize = (8, 5))
        plt.bar(keys, values, width = 0.5)
        # Adding labels and title

        plt.title(f"Dicitonary Plot")
        plt.xlabel(f"keys")
        plt.ylabel(f"values")

        # Display the plot

        plt.show()
```

plt.plot
and plt.scatter work too
The second exercise will have plots

Why did it run faster the second time?
* inconclusive

## George enters for the biology things

Reading gata3.txt

(20 strings of length six)

This is related to the final exercise we will solve here on Friday\

It has to do with protein binding sequence motifs
gata3 is the name of the protein
(gata = GATA)

There is malleability to the sequence the transcription factor will notice

We want the motif so we aggregate the sequences the transcription factor binds to
We want to find the frequency of each nucleotide in every position

Position frequency matrix is what we call that matrix

### I just discovered that jupyter uses vim binds on accident

The list of lists

```python
sequences_file = 'gata3.txt'

# function for calculating the 2d matrix
def matrix(array) -> dict:
    """Returns a dictionary with the position frequency matrix of a list of sequences"""
    # Creating a data structure to help formatting
    # Getting the length of the sequences
    positions = len(array[0])
    # Making a list for each nucleotide that contains the amount in the positions that relates to the index of the list
    indecies = {"A": [0]*positions, "T": [0]*positions, "G": [0]*positions, "C": [0]*positions}
    # Iterating sequences (plural)
    for seq in array:
        # Iterating sequence (singular)
        for position, nuc in enumerate(seq):
            indecies[nuc.upper()][position] += 1
    return indecies

# initiate an empty list to hold the information that we will load from the file
sequences_as_list_of_lists = list()

# open a connection to the file and attach it to a file handle
with open(sequences_file, 'r') as file:
    # use the file handle as a proxy to loop through the lines of the file one-by-one
    for sequence in file.readlines():
        sequences_as_list_of_lists.append(sequence.strip()) # remove the newline character from the end of the string

result = matrix(sequences_as_list_of_lists)

print(result)

print(sequences_as_list_of_lists)

```

Their solution was obviously a little different

What is a safe application
We might have erors in the sequences
The way we write the if and else statment will add to the wron point if the nuc is a error

C like string formating

then we did the at/gc content that requires you have done the previous the same as them

Get from rafail

For rafil notes

### Why is the if elif not safe?

Becasue all 'N' and '-' characters are not going to be handles right by the srcipt

You should not use stirng concatenation with + because ugly

## Final part

Reading data from sertain types of files

# L3-2

The notorious csv
The notorious json file

Python has a tool for reading them

It's the typical read command but its adjusted a little for that data

```python
import csv

with open('data.csv', 'r') as file:
   reader = csv.reader(file)
   for row in reader:
      print(row)
```

```python
with open('output.csv', 'w', newline='') as file:
   writer = csv.writer(file)
   writer.writerow(['Name', 'Age', 'City'])
   writer.writerow(['Alice', 30, 'New York'])
```
The datatype does not matter

### Random string generator


```python

import random

def my_string_generator(numberOfLines, lengthOfLine, filename):
    chars=['A','T','G','C']
# 0 for A, 1 for T, 2 for G and 3 for C
# generate a random number X from the set [0,1,2,3],
# and get the character by using chars[3]

outputFile=open(filename,'w') # open in order to write

for line in range (numberOfLines):
    randomLine=''
    for c in range(lengthOfLine):
        key = random.randint(0,3)
        randomLine += chars[key]
    randomLine+='\n'
    outputFile.write(randomLine)
outputFile.close()
```

You get two strings and you have to find the minimum number of operations to make the first like the second and the only things you are allowed to do is change a letter and append and delete one
This is the Levenshtein distance

# Lesson 4 ありがとうガイロー

## Pandas dataframe

It's a 2d matrix

Most of the time what you have to process is a csv file

we work with house prices.csv
(jupyter opens a txt like file)

you cna use pandas to load a datafarame

apparently pandas has some powerfull methods for the data frame

(execute queries)

You can very easily ask a dataframe for rows where the hous price is higher than a value

You need to import it

Why do we need numpy?

We will also be using matplot lib

```python
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

data = pd.read_csv("houseprices.csv", sep=',') # you get a dataframe!!!

# print the first lines of data
data.head()
```
Head is a function that prints some line from the data frame
It prints out the first 5
for the first impression of wha the data set contains

You get a idea of what is inside the dataframe

How does the dataframe know the names of the columns
normally the first line in a csv is supposed to contain the names of the columns

If you want to get an overview of the data characteristics that the data frames contains and some statistical values There is a describe() method

I see a 
* count 
* mean
* std
* min
* 25 %
* 50%
* 75%
* max

We have a discrepancy of the balues in count
Some values are missing

We count how many rows have null in the price field or in the area.....

```python
# count how many rows have null in price field
data['price'].isnull().sum() # retruns 0
data['area'].isnull().sum() # -> return 5
```

isnull returns a boolian

Drop all rows with null values

```python
data.dropna()

```

The data fram still contains 189 not 184

it only displayed it on the variable 
the content of the variable hasnt changed
the file is the same
This is for viewing
The index will stay the same if you call the dropna for all the things that arent dropped so the last element if not null will remain the last with the same index

correlations

```python
data.corr()
```

Waht does it mean 
it's not quite that for every 1 incriment in 1 the other incriments by 0.5
but its close


```python
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

#%matplotlib inline

# print some scatter plots

plt.xlabel("Construction Year")
plt.ylabel("Price")
plt.title("Construction Year vs Price")
plt.scatter(data['constructionyear'], data['price'])
plt.show()
```

This gives you clusters 
you can see where most houses were built
you can see their prices per year
you can do a regression

## Onto the l4-2

Gene data

gene_table.txt

data "form" "shape"

df.shape
0 for row and 1 for columns

```python
print("DataFrame dimensions: ", df.shape)
print("DataFrame dimensions: ", df.shape[0])
print("DataFrame dimensions: ", df.shape[1])
```

So you have a dataframe and you want to extract a certain subset of row

`loc[]`
or `iloc[]`
*methods*
* they use [] brackets no ()
`loc()` can be use for the row label as index
`iloc()` is for rows using the index

```python
# retrieving DataFrame row by row index
print("Row with label 11 of DataFrame:")
print(df.loc[11])
```

if i want to retriev dataframe rows iwth the index
(0 indexed)
`iloc()` is for rows using the index

```python
print(df.loc[12])
```

We need two version because I can change the numbers and add my own

So this gives me choice its like a dict and a list in one

### Slicing a dataframe

Retrieving multiple rows

In `loc[]` inside the "[]" we define a slice

```python
 # using a slice in 'loc', returns the part of the DataFrame, between the rows given in the slice
print("Displaying rows between label 8 and 11")
print(df.loc[8:11])
```

It may be the case that i want to return rows using the index

Now i use `iloc[start:stop:step]`

```python

# using a slice in iloc, returns the part of the DataFrame, indexed by the numbers in the slice
# (same idea as in Python lists)
print("Displaying rows whose index>=8  and index<11:")
print(df.iloc[8: 11])
```

Be careful when you use `loc[]` and `iloc[]`
because they can change the indexes

```python
df.index += 10
```

This command will change all indexes by 10

This means that whatever is displayed is for `loc[]` and the literal index (irregardless of the print) is for `iloc[]`
after
```python
df.index += 10
```

`iloc[10]` gives you `loc[19]`

### Picking columns

```python
# retrieving gene_name as a key value
print(df['gene_name'])
```

### Multiple columns

```python
print(df.get('gene-name', 'No column was found'))
```

```python
 # retrieving multiple columns of a DataFrame
print(df[['gene_name', 'strand','transcript_count']])
```

You give a list (inside the list)

### Iterating

`for loop in dataframe:`

```python
#get first 3 rows of the dataframe
tinydf = df.iloc[0:3] # 0, 1, 2
#iterate over each row
# iterrows returns an index and a panda series
for rowlabel, rowdata in tinydf.iterrows():
    print("Row label: ", rowlabel)
    print("Row dat: ", rowdata)
    print("=======")
```

### Doing statistics

You can use `.attribute` for the indexes of the dataframe like `df[attribute]`

A histogram is a plot with bars that shows the distribution

```python
transcript_column.plot(kind="hist",bins=50)
# bins: refers to the number of bars that appear (configures the histogram resolution)
```
What are bins?
the sets that you use in order to classify the data so one bin would be chunks of values so lump all from 0 to 5 together then all from 6 to 10

### Sorting

we use a method

```python
# sorting DataFrame, by the number of transcripts of each gene, in descending order
df.sort_values('transcript_count', ascending=False).head(10)
```

### More advanced query processing

# L4-3

The file we work with is the transcript table.txt

We start with statistics

## Conditional calculations

`df[df.transcript_length>2433]`-> this will return the whole column list you get the rows that match the if in the brackets

```python
print("Statistics for transcript length")
print("\tMinimum CDS length: ", df.cds_length[df.cds_length!=0].min()) # != means NOT
```

While here i get the one row in the column if the if is true and that is why we use the cds length twice

You have to look and see the rest yourself
because we are going to do the exercise now

`.groupby`
pick a column
take a specific value
and the give me some statistic of another row for those factors

```python
#result = df.groupby('transcript_biotype').aggregate(pd.DataFrame.mean)['transcript_length']
result = df.groupby('transcript_biotype')['transcript_length'].mean()
print(result)
```

# EX3

### Selex seq vs chip seq lab method

we use selex

we take oligonucleotides then if the transcriotpsion factor recognizes we throw the ones that are nt relevant to the binding and we take them and we sequecne them

We categorizse the nucleotides and the contents that tthe transcription factor recognises

The PFM (How many times does that nucleotide appear in the position x for all sequences)
This is not very useful

We want probaliblity matrixes

You divide the positions number with the sum of the column (That sum we saw)

Usually you add pseudocounts to the matrix
(Avoids some problems down stream)

Meaning
```python
def matrix(array) -> dict:
    """Returns a dictionary with the position frequency matrix of a list of sequences"""
    # Creating a data structure to help formatting
    # Getting the length of the sequences
    positions = len(array[0])
    # Making a list for each nucleotide that contains the amount in the positions that relates to the index of the list
    indecies = {"A": [1]*positions, "T": [1]*positions, "G": [1]*positions, "C": [1]*positions}
    # Iterating sequences (plural)
    for seq in array:
        # Iterating sequence (singular)
        for position, nuc in enumerate(seq):
            indecies[nuc.upper()][position] += 1
    return indecies

# initiate an empty list to hold the information that we will load from the file
sequences_as_list_of_lists = list()

# open a connection to the file and attach it to a file handle
with open(sequences_file, 'r') as file:
    # use the file handle as a proxy to loop through the lines of the file one-by-one
    for sequence in file.readlines():
        sequences_as_list_of_lists.append(sequence.strip()) # remove the newline character from the end of the string

result = matrix(sequences_as_list_of_lists)

print(result)

print(sequences_as_list_of_lists)
```

Background probility = chance to find  the nucleotide in the position by chance
25%

The objective is to read sequences from a file and calculate pfms probabliity matrix and the
add the pseudocounts
