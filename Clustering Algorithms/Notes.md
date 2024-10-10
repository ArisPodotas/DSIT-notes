# Pre game

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
> Kostantinos Koutroumbas

# Lesson 1

Unit 1 
- General conepts 
- Problem formulation

> This is for me to formulate an opinion on the class

It seems he does all of it.

In this lesson the goal is to present not only sertain clusterin algorithms but to dig a little further in order to see the rational behind  all these consepts.

Grading
70% Final exams
20% Project
20% Homeworks (2 of them)
110%?
Bonus 10 %

The project will be given in the middle of the course. We have images and the entities are the pixels

The first homework is individual.
The second one is a lab exercise. At one of the lectures you will have to bring your laptops and work in groups of 2. You will make the basic steps and give a report.

Programming language is:
MATLAB
or octave whicch is a free matlab but it does not have everytihing it senought for us

> Can we do any other programming language for the lab?
> No

```matlab
for x in 

```

> Recorded lessons
(maybe not today)

# Clustering definition

Input: A set *E* of entities

DEF:
Grouping of the entities into "sensible" clusters (groups) so that more similar entities belong to similar clusters and less similar entities belong to different cluster. He asked us if we are ok with this definition.

Why do we do clustering?
We are surrouded by a wealth of information. The human brain is unable to study all of them.

<hr>

### Sun and human skin example

You could take ever person on earth and get the knowledge for everyone - impossible
So we cluster *similar entities* into groups and we study the groups.

<hr>

He returns to the definition.

He asks is it rigorous?
No not really
When we say sensible different people understand different things.
What kind of entities.
Clusters?

In order to define what is sensible I have to define a criteria and define more and less similar.


## Entities

They are application-dependant.
It could be anything really...

An important issue is about how we represent the entities. Usually we use numbers, we select a set of $l$ quantities (measurements - features), the same for all entities. 

### Cell exampole

I could use the area
How spheriacal it is
.
.
.

<hr>

By doing this we associate a $l$ identity vector.

We can say that a entity is a point in a vector space.

### Eye example

1 = Blue
0 = black

Athlete 1 

the axis are 
weight 
height 
eye color


### Image example

Hyperspectral images

#### We do RGB first to understand it

When I take a RGB image I take 3 sets. The identical image once for each color

<hr>

in hyperspectral images we have up to 1000 in very narrow bands.

Say 200 bands. Each pixel can be represented in a 200 dimentional space.

The key in all cases is how we select the appropriate featrures.

## Similar

I need to define a measure of proximity to talk about similarity.

There are two kinds of proximity
* similarity, The more similar the closer the vecros and the larger s($x$,$y$) the values.
* dis-similarity, The more dissimilar the farther and larger the values of d($x$,$y$).

Entities belong in the same cluster when highly similar and in different clusters when hight in dissimilarity.

* similarity is by ***inner product***
* dissimilarity is ***euclidean disatnce*** and ***manhattan distance***

Some sets are better suited for similarity and some to dissimilarity.

The notation 
small bold letters are vectors, row vectors.

<hr>

## Clusters

What is a cluster? There is no rigorous definition for the cluster, however, When we talk about clusters we have an aggrigation of points that is in a maniform or around a specific point in space.

The process of clustering in this sense is the identification of aggregations of points in a $l$ dimentional space. Meaning we can use concepts of geometry.

### Non-parametric representation

The ponts themselvces represent the cluster, in this way to know how far something is I need to check all the points.

### Parametric representation

Pick a point and represent everything in relation to it. Now i only need the distance from the representative of the class.

In general a cluster may be represented by a point, a plaine, a hyperplain in more than 3d.

> In the first case (point)
> The mean of these points
> The center

This has a big problem in that a point defines infinite circles.
This only works around ***compact groups*** (classes).

> in the second case (line)

The accuracy is defined by the distance to the representative of all ponts.


    A point is used for a compact cluster in ANY dimention.

## Sensible

This needs a criterion

This is expressed in a cost function or a set of rules

# Clustering an ill posed problem

consider the sequcne of real nubmer 

$1,4,9,16,25,...$

could be $a_n = n^2$ and $ b_n = n^2 +(n-1) \times \dots \times (n-n+1)$

The selection of the **law** is subjective.
We facor the simplest solution (not the lowest number be careful its different)

example

\[\sum_{j = 1}^m \sum_{x_i \in c_j} \Arrowvert x_i -w_j\Arrowvert ^{2}\]

in another case the selection fo the law will be subjective as to how many clusters.

<hr>

If there is so much subjectivty in clustering why do we use it?

The result must be interpreted by an expert in the fiels of application.

# Clustering stages

## Freature extraction

## Freature selection | generation

## Clustering algorithm

we need a proximity measure and a clustering criterion

The clustering algorithm tries to reaveal the clustering data for the vectors based on the similarity measure andthe adopted clustring criterion.

then we send for interpretation by a expert.

## Example of doctor snow

he plotted the location of cholera deaths on a map in the 1850's.

He noticed the locations where in points around polluted wells.

Before we move on, what are the entities? Death locations. How are they represented? By coordinates. Pick any distance. What is the form of the clusters? They seem to be compact.

Thus I use a clustering criterion able to reveal compact clusters.

<hr>

## What can we do with clustering? 
* Data reduction. That is to represent all the entities in a certain cluster C by a set of properties that are shared by the majority of entities in C.
* We can do hypothesis generation, meaning that we form a rule. This does not probe the rule. 
* We can use clustering for hypothesis testing, this is the opposite of hypothesis generation. Assume we want to ttest hte hypothesis that large compaines have activites aborad, consider a set of companies, each one represetned by its size, its ise degree of acitvites abrad it sability to complertr successful reseach projects . 
* We can use clustering to make predictions about groups. Example movie recommendations system.

# Clustering definitions

Various clustering definitions (meaning more than one meaning there is no one accepted one)

We split X into m clusters.
## A: Hard clustering case: each pont belong exclusivly to a single cluster. A set of mathematical formulations that must occur.

B (still A): A set of m function each one corresponds to a cluster (sums)
if I add all the values they must sum to one. No cluster is empty.
### Example for B

$x_1, x_2, x_3, x_4, x_5$
clusters: $C_1 = [x_1, x_2, x_3],\; C_2 = [x_4, x_5]$
thus $u_1(x_1) = 1$ and $u_2(x_1) = 0$ ... and so on to make a table.

| 0 | x1 | x2 | x3 | x4 | x5 |
| --------------- | --------------- | --------------- | --------------- | --------------- | --------------- | 
| u1 | 1 | 1 | 1 | 0 | 0 |
| u2 | 0 | 0 | 0 | 1 | 1 |


if i go to a column and i add all the values it must sum to one si what the first constraint said.
The secondconstarint said that rows must be summed to more thatn 0 and less that 5 (number of entities) $\Rightarrow$ True
if the $u_i(x_i) = 1$ the cluster belongs to that group

## A1: Probabilistic clustering: Each point belongs to a singel cluster, however, we are not certain to which cluster a adata pont belongs. Our ignorance is modified by a probabilistic framework.

No cluster is empty, the sum of the columns is 1
but instead of $u$ i have $P$ and the values of the table will be 0.2 and 0.3

| 0 | x1 | x2 | x3 | x4 | x5 |
| --------------- | --------------- | --------------- | --------------- | --------------- | --------------- | 
| P1 | 0,7 | 0.2 | 0.5 | 0.3 | 0.2 |
| P2 | 0.3 | 0.8 | 0.5 | 0.7 | 0.8 |


B: the fuzzy cluster: each point is allowed to be in more than one cluster up to some degree.

Suppose you have a box with 10 balls 5 black and 5 white and we pick a ball. We do not know in advance what the color will be, we know it will have a color. This is the probabilistic case

Suppose two colors b, w. You create a grey color 60/40. This is a fuzzy color.

C: Possibilistic clustering: the notion of belonging is gone: We measure the degree to which each point is compatible to a cluster.

We have a functionthat measures the compatibility.
Now they do not need to sum to one

<hr>

Why do we need this many definitions? You have to keep in mind when we define something new we define it for a sertain situation.

we define it different for different situations.

## Typers of freatures 

with respect oto the domain

    continuous (continuous buvset of $\mathbb{R}$)
    discreet (finite , descreet set)

With respect ot the realtive significance of the values they take.
    
    Normal 
    Ordinal
    Interval scaled (when negative values exist)
    Ratio scaled (no negative values)


## Defining similarity and not

1. dissimilarity measure in term of a vector

the measure then is a function that maps a pain of vectors to a value.

there needs to be a non negative bound of the lowest value.

\[x = \left[\begin{matrix} a \\ b \end{matrix}\right]\] \[y = \left[\begin{matrix} a \\ b \end{matrix}\right]\]
\[d(x,y) = \sqrt{(x_1 - y_1)^2 + (x_2 - y_2)^2}\]

$d(x,y)\geqq 0 = d_0$
