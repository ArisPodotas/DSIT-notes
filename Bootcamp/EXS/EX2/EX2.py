# EX2
# Background. The Levenshtein distance is a metric that measures string similarity by counting the minimum number of single-character edits required to transform one string into another. These edits can include insertions, deletions, or substitutions of characters. For example, the Levenshtein distance between "kitten" and "sitting" is 3 because we need to substitute 'k' with 's', change 'e' to 'i', and insert 'g' at the end. 
# Here's how to use the Levenshtein Python library to calculate this distance:
# First, install the python library (if you haven't already): pip install python-Levenshtein
# Then, use the following code to calculate the distance:
#
# What you have to do:
# •	Generate (see Lab 3)
# 1.	5 random DNA strings of length X, 
# 2.	5 random DNA strings of length 5*X, 
# 3.	5 random DNA strings of length 10*X, 
# 4.	5 random DNA strings of length 50*X, 
# 5.	5 random DNA strings of length 100*X, 
# 6.	5 random DNA strings of length 500*X, 
# 7.	5 random DNA strings of length 1000*X,
# 8.	...etc
#       till N.
# ... and write them (see Lab 3) to file file1.txt. You should select N and X, depending on your laptop/RAM setup. If you use large X, say 1000000, you may experience serious delays with the execution of Levenshtein.distance(). We suggest trying with X=100 (or 1000), and N=7 to start with and adjust appropriately, if needed.
# •	Repeat previous step (use same X and N as before), and write the strings to file file2.txt. 

# Importing libraries
from Levenshtein import distance as dist
import matplotlib.pyplot as plt
from os import remove
import random
from time import time, perf_counter

def timeit(func):
    """Wrapper function definition for printing how long a function took to run"""
    def wrapper(*args, **kwargs):
        start_time = time()  # Record the start time
        result = func(*args, **kwargs)  # Execute the function
        end_time = time()  # Record the end time
        elapsed_time = end_time - start_time  # Calculate the duration
        print(f"Function '{func.__name__}' executed in {elapsed_time:.4f} seconds")
        return result
    return wrapper

@timeit
def generator(lines, length, filename, mode):
    """Generates a file that has random contents with defined lines and line lengths"""
    chars = ['A','T','G','C'] # Define files content list
    query = open(filename, mode) # Open in order to write
    output = '' # Initializing variables
    for line in range(lines): # Height of file
        for char in range(length): # Width of file
            output += random.choice(chars) # Choose randomly form the options
        output += '\n' # formatting
    query.write(output) # Writing to file
    query.close() # Don't forget to close ;)

# This was for testing
# generator(3, 4, 'file1.txt', 'w')

@timeit
def caller(times, x, filename, mode):
    """Calls the generator function with a algorythm for the requirements"""
    factors = [] # To keep the values for the plot in the later question
    for batch in range(times):
        if batch == 0: # Base case
            factor = 1
        elif batch % 2 == 0: # For every even loop number
            factor *= 2 # Modify the factor such that the line length is correct
        else: # For every odd loop
            factor *= 5 # Modify the factor such that the line length is correct
        characters = factor * x # Taking the function input and the factor multiplication and defining the line legth
        factors.append(characters)
        generator(lines = 5, length = characters, filename = filename, mode = mode) # Calling generator with all the new parameters
    return factors

# Initializng files (also to empty them)

with open('file1.txt', 'w') as file:
    pass
with open('file2.txt', 'w') as file:
    pass
# Making the script a little more interactive
inp1 = int(input(f'How many characters should the first line have?'))
inp2 = int(input(f'How many batches do you want written?'))
sizes = caller(x = inp1, times = inp2, filename = "file1.txt", mode = 'a')
caller(x = inp1, times = inp2, filename = "file2.txt", mode = 'a')

# •	Measure the execution time of Levenshtein.distance() for string pairs: one string from file1.txt and one from file2.txt as follows: 1st line of file1.txt with 1st line of file2.txt, 2nd line of file1.txt with 2nd line of file2.txt, 3rd line of file1.txt with 3rd line of file2.txt etc...

@timeit
def measure():
    # Reading input
    query = open('file1.txt', 'r')
    requery = open('file2.txt', 'r')
    # Begining calculations
    element = requery.readlines()
    size = len(element)
    table = [0.0]*size # Initialize a data structure that fits the length of the files in lines
    pairs = [0.0]*size # Initialize a data structure that fits the length of the files in lines
    # Calculating distances
    for index, line in enumerate(query.readlines()):
        sequence = element[index]
        start = perf_counter()
        holder = dist(line.strip(), sequence.strip()) # Levenstein distance (look at imports)
        stop = perf_counter()
        pairs[index] = holder
        table[index] = stop - start
    return table, pairs

# Checking output

times, values = measure()
print(times)
print(len(times))
print(values)
print(len(values))

# •	Calculate average (AVG) execution time for strings of same length.

def average(data):
    sum = 0
    for thing in data:
        sum += thing
    return sum / len(data)

entries = len(times)
averages = [0.0]*int(entries/5)
for i in range(0, entries, 5):
    slice = times[i:i + 5:]
    averages[int(i / 5)] = average(slice)

# •	Plot a graph (see Lab 3) to show the performance: AVG execution time (Y-axis) vs string length (X-axis). Check here for a nice plot tutorial: https://matplotlib.org/stable/tutorials/pyplot.html
# Notes                           visual = plt.plot(sizes, averages, marker = 'o')

plt.plot(sizes, averages, marker = 'o')
plt.ylabel('Average time')
plt.title('Levenstein distances')
plt.xlabel("String size")
plt.show()

# ●	Questions only in our Teams channel.
# ●	Prepare only one notebook + the txt files, and send them to dalamag@athenarc.gr and ggeorgakilas@athenarc.gr using the subject in the exact form: PYTHON BOOTCAMP 2024 EX2 LASTNAME FIRSTNAME 
# ●	Explain your code/solutions with markdown text/comments inside the notebook. No markdown/comments, no pass. In any case, your notebook should work like a charm!
# ●	Deadline (Wed Oct 9 - 23:59), STRICT (really).
#
