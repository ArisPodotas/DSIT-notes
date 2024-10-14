# Pre game

Please test you netrwork before finishing

There is a presentation in teams that uses code (I don't know what language)

You upload a txt that say the calss name and the assignment (You pick a name)

Non mandatory absences

Some of you grade is part of engagement in the class

> Teachers
> More than one
> Papageorgiou
> ms....
> akalovou@di.uoa.gr

There is a penalty if you don't pass the project in the first seciotn but you can still do it after

Don't use a project that exists. Add a touch of character to the project.

If you don't get a passing grade on the project there is a examination the next september.

### Structure

The grading scheme

* Problem descriptin 5/5
* Describe datase3t 15/15
* describe other models inthe same area 5/5
* describe model 15 15
* descrive experiments 15/15
* resutls 20/20
* future work 5/5
* deliverables 5/5

Your project should ***always*** describe and use a baseline model.

# Lesson 1

## Methods of obtaining data for your projects

Data
Data...
Data...

Obtain ***good*** quality data.

Task 1 do some research

1. Make a list that contains 5 websites worldwide where you can find free datatsets (of any kind, but write down the type of data)
* I said NCBI
She gave
> * kaggle
> * huggingface Pre trained models
> * datasetsearch
> * github/awesomedata

2. What if the data i want is not available
* use an API

3. Create a realistic scenario

4. Try downloading

5. What about facebook?

use:
zenodo, inventory clarin, european langauge grid catalogue

Twitter example

<hr>

## Idea for our project
She prefers images

Maybe make a random dataset customly?....
Maybe I can parse my own messages???...
Ramadan
Virology
Terrorism
The snails thing nick did (ecology)
Gyms
Museums
Traffic to w3 githubn from the example repo
Law
sign language
car accidents and old people in the neighborhood
Light per acre and mutations
Anything that has to do with the cicadas in america now
Foregn language speaking and duolingo
necklace and behavior
Nordic priesta ned the ir family trees (because they keep a record)
orphaneges
23 and me and dna data
Lie detection
Git projects and emplyment
jobs, anthing to do with employment
Most traveld path on google maps

* species delimination based on images

That one discord that made a new language becuse of the rules
make the ai interact with these rules btw ^^^

twitch
object trajectory prediction in a short video

<hr>

Papers with code

<hr>

We use tensorflow
Everyone uses pytorch
jupyter notebooks

How much data is good to get any worth while results?
You need ***Alot***.
For tweets you would need 1 million

imdb 100 thousand is enough

Cheeky little code snippets

<hr>

## Numpy

## Seaborn

## Yhat's ggplot

## Altiar

### Following the example in the lab from the local repo here

Download dataset

Import in drive

make a new notebook in colab

run:
```python
import pandas as pd
from google.colab import drive
drive.mount('/content/drive')
```

Now the drive and the colab are linked and you can use your files and paths from the local pc

Example:
```python
path = '/content/drive/MyDrive'
data = pd.read_csv(path + '/Black Friday Dataset.csv')
```

Handle the NaN

You dont want to throw out ```drop()``` the data that has none in it.

When the data has a date you can take a ```datetime``` object in python

For the next lesson we will learn the scikitlearn library (next lab)

Next week is theorey upstairs
