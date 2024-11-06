# Pre game

In total 15 lessons will be held

## Markdown table

| Column1 | Column2 | Column3 |
| ------------- | -------------- | -------------- |
| Item1 | Item1 | Item1 |

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


The first lesson is an introduction.

## Grades
Project, announced ussualy in november
There is an oral examination at the end. It will have to do with the project. Groups of 2 (not a requirement).
The mainidea will be to do it on time and it's not a small project (make small progress day by day).
Most of the grade comes from the project. Not much coding (small coding part). Know python and implement the nearest neighbor (algorithm). You have approximatly two months. No books for the class but there is a very good book available for the class (mmds.org/#book). The book is free. We dont follow the book entierly but we do do a few chapters. He likes the book it's from Stanford.

Recorded classes.

# Lesson 1

Getting acuanted

He is late. He being the teacher. 待っている9:25

The class will be in english

The reason we started today and not last week is because the data science masters starts today so we all start togther.

## Motivation

### Data explosion problem

There is too much data in databases

<hr>

### Data warehousing and data mining

<hr>

What is a NP complete problem? How long does it take to sort n number: $nlog(n)$ which algorithm we use to sort 10 number: quicksort. Hashing.

<hr>

There are alot of ways to collect big data... Everything is recorded, the phone, the pc the car. This was not always the case, alot of this information gets stored in big data warehouses like the cloud. The foppy disk stored something like 640 kb. Hard drives became popular sometime in the 90s, even then drives were expensive and they were relativly small. In the late 90s he was talking t osomeone who works at nasa and their storage system was just a big cabinet full of tapes and they had a automatic system that would go and pick the righ tape and bring it to the tape reader. That was the indexing method. Now something like 1 T is a few euros.

Moor's law: every 8 to 10 months the power of your computer doubles.
Expressed as the ammount of power you can get for the same amount of money.

Then people said the same for storage, and it seem'd correct at the time infact it was faster.

The early 90's is when windows became popular. Before 1980 they didn't have databases.

Thus everyone started collecting data.

So this is where this idea of mining the data came into being.

Having the data ina nd of itself is not htat useful because it takes space it costs money to keep the pc on but if i can use the data then its worth it

    Data minign is defined as "The nontrival extraction fom implicit, previously unknown and potentially ... data"

This process was named datat mining and it stuck.

### The story aobut data mining in statistics:

In computer science we meant hte collection adn analysis of data. The thing is the term data mining was used in statistics, it means that there are lies there are dumb lies and there are statistics. Esentially is the sampling theorem, take a sub section of the population and assume that it's distribution is the same as the whole's, Extrapolate. (If you take a random subset: every person in the population has the same probability to appear in the subset then the result I will get by estimating the whole in the subset is a un biased estimation of the result of the whole)

In this way bias is the degree to which your subset skews off of the real distribution. The error of the subset.

You start asking why is this bias in the subset and here we have data fishing.
Every vote is not independant of one another. They will give each sample a weight in the sample.

You can poison the data for example for a election sensus, you are being paid by the conservative party for the sensus and you know that older people vote more conservative. So you call people for the sensus early in the morning at home, becasue older people are retired and home. This is called data fishing, data dredging, data mining

<hr>

Different disciplines were far isolated, so this term want taken into account when naming the computer science version of data mining. The widepread use of machine learning has brought together new disiplines that do not interact. Just the other day the nobel in physics and chemistry were by people who know machnine learning.

## Why data mining applications

* Management and risk analysis, Forcasting, customer retention
* Market analysis
* Fraud detection and management
* Text mining
* Intelligentquery answeting

Trends leading to the data flood
* um

Major data mining tasks
* Classification
* clustering
* association
* visualization
* summarization
* deviation detection
* estimation
* link analysis
* ...

## the classifcation problem

predicting an items class, find natural groupings of things. You have a group of objects, an object is defined by a set of attributes, the question is once you have two groups, if i get a new point where do i put it.

To the clustering things we had said in the other calss he adds that maye sometimes the clusters are case by case? meaning that clustering darts is stupid. If I throw darts for 2 hours and half are blue and half are red and at the end I go to cluster them on the dart board I am running a fools errand.

<hr>
