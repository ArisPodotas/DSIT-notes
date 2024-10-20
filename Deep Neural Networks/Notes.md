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

# Lesson 1 (lab 1)

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

Numpy

Seaborn

Yhat's ggplot

Altiar

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

# Lesson 2

The official lesson and not the lab like last time

Introduction to deep learning

> Teacher
> Haris papageorgiou
> From the institute at Athena for languages.

Introduction

Meltemy (from the institution in the Athena ceter

Listing reasons we use AI and what it means to us
* Language learner
* Discovery
* Coding
* Dialogue system
* Music
* Images
* Recomended
* Google lenz
* Summarization (stanford tool)
* Text to speech (speech synthesis, speech recognition)
* MRI example
* Clustering
* Predicting protein structure
* AI opponents in games

What is supervised learning?

    You have labeled data that you train a model on, and then you use it to make predictions on someother data.

These are Dialogue systems. It seems like there is alot we expect from them... We should be careful becasue of false positives and false negatives in medical diagnosis.

These program are probabilistic, instead of deterministics nad reliable like the other programs we write most of the time like a scrip that will make the same output all the time. This has implication. Who is responsible for treatemen when it's produced bu a ai? This brings up questions about responsibility Explainability Trustworthyness Ethics and Interpretations. 

Notice the explosion in AI now, even thought it existed way before this. The question is, why now?

## Representations

### The housing price example

We need data to find relationships of *features* and the price. Essentially the *features* give us a good representation of the house for the specific task of house price preditciton.

What we call this entire area for all the freatures and the way they affect is *Domain knowledge* and for this we need *Domain experts*. They will give us the features that are a good fit for the psecific task. One of the amazing things that hapened is that we managed to get data to begin the automization of these predictions.

Heres the thing however, these *features* somehow are connected, we cannot claim that they are independant variables. This becomes a representation problem in the math. We can play with polynomials to represent these corralations $x_1x_2 + b_1 \times x_4^2x_3 = y \text{ (price)}$.

In the last decate we have abstrated the hidden layer of calculations that the polynomial represents into the black box method of a neural network.

The hidden layer of the neyral network represents the things humans do not see we cannot expirience, what it tries to do is capture the dymanics of the interplay of the features.

> The exammple given is as *fully connected network* because all the inputs have a arrow that goes to each hidden unit.

> How do I know how many hidden layers I need: no answer it's automated by the machine through trial and error.
 
> Chat gpt has 7 billion of these parameters or features. The combinations are immense. Can we devise small large language models? to fit it within a device. This is called *small language models*. Since humans already do have better outcomes with less data points.

My question: Is it the same to add more layers and more units?
The ways we add cdomplexity to the network is:
* more hidden layers
* more hidden units
* 

Little idea here, make a netrowk without data just the grid and make all the possible combiantions that the numbers you have made can combine to and then, for a aspecific problem take the set and find the one that is best for it.

Data is definatly very important when it coems to differentiating siri to chat gpt, is it the only thing? Definatly not (Graph of performance and data).

<hr>

## Primitives

We like having very primitive representations.

Logistic regression and the cat vs not cat exampole

Given $x$ the vector of the feature the algorithm will evaluate the probability of a cat being in the image.

\[\text{Given } x,\; y = P(y=1|x) \text{ where } 0 \leq y \leq 1\]

6 rules apply (slide)

$x \in \mathbb{R}^{n_x} \text{ where } x_n \text{ is the number of featrues}$
$y \in \text{ 0, 1}$
$w \in \mathbb{R}^{n_x}$
$b \in \mathbb{R}$
$\text{ The output} y=\sigma(w^Tx+b) = s(z)= \frac{1}{1 e^{-x}}$

Why a sigmoid? It outputs between 0 and 1.

The weights are the models

We call the loss (error) function: The loss function computes the error for a single trainig example. The definition depends on our understanding on how to solve the problem.

The loss function

\[L(y,\; \hat{y}) = (y \times \log{(\hat{y})}) + (1- y) \times (\log{(1- \hat{y})})\]

The cost function: 

\[J(w, b) = -\frac{1}{m} \sum_{i=1}^m L(\hat{y^i}, y^i) = -\frac{1}{m} \sum_{i=1}^{m}(y^i \times \log{(\hat{y^i})}) + (1- y^i) \times (\log{(1- \hat{y^i})})\]

We want to find the w's that minimize the cost function.
It's an iterative function and each time it does something better.
We like convex functions with single solutions.

my $z$ is the line with pairs of weight times features, I make my sigmoid from $z$ and I calculate the loss function $L(y, \hat{y})$, I take the derivative of the loss funciton, then I use the derivative to calculate new w's. Take it form the top again using the new weights. some w's might remain the same from epoch to epoch.

A new $w$ looks like this. same position of the line last $w$ used to make the new one along with the derivative of the loss function.

\[w_1 = w_1 - adw_1\]

Every iteration is called a new epoch.

To get the derivative for each w. We calculate the derivatives of the cost function (loss function) then the derivative of the sigmoid and then the derivative of the line for each of its w's.
