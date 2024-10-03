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

