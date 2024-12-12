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
> No (octive the free matlab)

```matlab
for x in 

```

> Recorded lessons
(maybe not today)

# Clustering definition

Input: A set *E* of entities

Definition: Grouping of the entities into "sensible" clusters (groups) so that more similar entities belong to similar clusters and less similar entities belong to different cluster. He asked us if we are ok with this definition.

Why do we do clustering?
We are surrouded by a wealth of information. The human brain is unable to study all of them.

<hr>

### Sun and human skin example

You could take every person on earth and get the knowledge for everyone - impossible
So we cluster *similar entities* into groups and we study the groups.

<hr>

He returns to the definition.

He asks is it rigorous?
No not really
When we say sensible different people understand different things.
What kind of *entities*, clusters?

In order to define what sensible is I have to define a criteria and define the terms more and less similar. By the end of the lecture these will be defined.

## Entities

They are application-dependant. It could be anything really...

An important issue is about how we represent the *entities*. Usually we use numbers, we select a set of $l$ quantities (measurements - features), the same for all *entities*. 

### Cell example

I could use the area of a cell to represent the *entity*, the how spheriacal it is.
.
.
.

<hr>

By doing this we associate a $l$ identity vector.

We can say that a *entity* is a point in a vector space.

### Eye example

We can define:
1 = Blue
0 = black

### Image example

Hyperspectral images

#### We do RGB first to understand it

When I take a RGB image I take 3 sets. The identical image once for each color

<hr>

in hyperspectral images we have up to 1000 in very narrow bands.

Say 200 bands. Each pixel can be represented in a 200 dimentional space.

The key in all cases is how we select the appropriate featrures.

## Similarity

I need to define a measure of proximity to talk about similarity.
> [!NOTE]
> This is not a definition of what more and less similar means we do that later

There are two kinds of proximity
* similarity, The more similar the closer the vecros and the larger s($x$,$y$) is.
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

The ponts themselves represent the cluster, in this way to know how far something is I need to check all the points.

### Parametric representation

Pick a point and represent everything in relation to it. Now I only need the distance from the representative of the class.

In general a cluster may be represented by a point, a plaine, a hyperplain in more than 3D.

> In the first case (point)
> The mean of these points
> The center

This has a big problem in that a point defines infinite circles.
This only works around ***compact groups*** (classes).

    A point is used for a compact cluster in ANY dimention.

> in the second case (line)

The accuracy is defined by the distance to the representative of all ponts.

## Sensiblility

This needs a criterion

This is expressed in a cost function or a set of rules

# Clustering, an ill posed problem

Consider the sequcne of real numbers:

$1,4,9,16,25,...$

This could be $a_n = n^2$ and $ b_n = n^2 +(n-1) \times \dots \times (n-n+1)$

The selection of the **law** is subjective.
We favor the simplest solution (not the lowest number be careful its different)

Example:

\[\sum_{j = 1}^m \sum_{x_i \in c_j} \Arrowvert x_i -w_j\Arrowvert ^{2}\]

in another case the selection of the law will be subjective as to how many clusters.

<hr>

If there is so much subjectivty in clustering why do we use it?

The result must be interpreted by an expert in the field of application.

# Clustering stages

## Freature extraction

## Freature selection | generation

## Clustering algorithm

This requires a *proximity* measure and a ***clustering criterion***.

The clustering algorithm tries to reaveal the clustering data for the vectors based on the similarity measure and the adopted clustring criterion.

Then we send the results for interpretation by a expert.

## Example of doctor Snow

He plotted the location of *V. cholera* deaths on a map in the 1850's.

He noticed the locations where in points around polluted wells.

Before we move on, what are the entities? Death locations. How are they represented? By coordinates. Pick any distance. What is the form of the clusters? They seem to be compact.

Thus I use a clustering criterion able to reveal compact clusters. (more on that later)

<hr>

## What can we do with clustering? 

* Data reduction. That is to represent all the entities in a certain cluster $C$ by a set of properties that are shared by the majority of entities in $C$.
* We can do hypothesis generation, meaning that we form a rule. This does not prove the rule. 
* We can use clustering for hypothesis testing, this is the opposite of hypothesis generation. Assume we want to test the hypothesis that large compaines have activites aborad, consider a set of companies, each one represented by its size, it's use degree of acitvites abroad. It's ability to complete successful reseach projects then is indicative of more activity abroad.
* We can use clustering to make predictions about groups. Example movie recommendations system.

# Clustering definitions

Various clustering definitions (meaning more than one, meaning there is no one accepted one)

We split $N$ occurences or *entities* from a vector space $X$: $X = \{x_1, x_2, \dots, x_N\}$ into $m$ clusters, named $R$ (for all cases essentially).

## A: Hard clustering case:

Each pont belong exclusivly to a single cluster.

### Rules

The set of mathematical formulations that must occur. These rules stem directly from the way we just defined hard clustering.

\[1. \quad C_i \neq \varnothing, \; i = 1,2,\dots,N\]

\[2. \quad \bigcup_{i=1}^{m} C_i = X \qquad \]

\[3. \quad Ci \cap Cj = \varnothing, \; i \neq j, \; i,j = 1, 2, \dots, m\]

\[\begin{cases} 1. & \qquad \text{ No cluster is empty} \\ 2. & \qquad \text{ All the elements inside all the clusters equate to X the set of all the entities. Meaning that there is no unclustered entity} \\ 3. & \qquad \text{ There is no comminality between the clusters, any } x_i \text{ belongs to only one cluster} \end{cases}\]

### Alternative definition

B: A set of m function each one corresponds to a cluster (sums). If I add all the values they must sum to one. No cluster is empty.

\[1. \qquad u_j: x \to \{0,1\}, \qquad j=1,\dots,m\]

\[2. \quad \sum_{j=1}^{m} u_j(x_i) = 1, \qquad i = 1, \dots, N \]

\[3. \quad 0 < \sum_{i = 1}^{N} u_j(x_i) < N, \qquad j = 1, 2, \dots, m \]

\[\begin{cases} 1. & \qquad \text{ $u_j(x)$ is a membership funcion for one cluster, like a boolean operation. Outputs true or false (1, 0)} \\ 2. & \qquad \text{ For one } x \text{ if you use all the cluster's membership function only one will be 1 and the others 0. } x \text{ belongs to one cluster} \\ 3. & \qquad \text{ For one clusters } u_j, \text{ the sum of all } x \text{'s in the function is less than the whole set. Each cluster is then not empty and we have more than one cluster} \end{cases}\]

The only thing that existed in the previous definition that we dont have here is that the union of all the clusters is $X$.

$x_1, x_2, x_3, x_4, x_5$
clusters: $C_1 = [x_1, x_2, x_3],\; C_2 = [x_4, x_5]$
thus $u_1(x_1) = 1$ and $u_2(x_1) = 0$ ... and so on to make a table.

| 0 | x1 | x2 | x3 | x4 | x5 |
| --------------- | --------------- | --------------- | --------------- | --------------- | --------------- | 
| u1 | 1 | 1 | 1 | 0 | 0 |
| u2 | 0 | 0 | 0 | 1 | 1 |

If I go to a column and I add all the values it must sum to one is what the first rule said.
The secondcond rule said that rows must be summed to more than 0 and less that 5 (number of entities) $\Rightarrow$ True
If the $u_i(x_i) = 1$ the cluster belongs to that group

## B: Probabilistic clustering:

Each point belongs to a single cluster, however, we are not certain to which cluster a data ponit belongs. Our ignorance is modified by a probabilistic framework.

### Rules

\[1. \quad \sum_{j=1}^{m} P_j(x_i) = 1, \qquad i = 1, \dots, N \]

\[2. \quad 0 < \sum_{i = 1}^{N} P_j(x_i) < N, \qquad j = 1, 2, \dots, m \]

\[\begin{cases} 1. & \qquad \text{ For one } x \text{ if you use all the cluster's P function they sum to all of x. } x \text{ is completly covered} \\ 2. & \qquad \text{ For one clusters } u_j, \text{ the sum of all } x \text{'s in the function is less than the whole set. Each cluster is then not empty and we have more than one cluster} \end{cases}\]

No cluster is empty, the sum of the columns is 1
but instead of $u$ I have $P$ and the values of the table will be 0.2 and 0.3

| Cluster\Entity | x1 | x2 | x3 | x4 | x5 |
| --------------- | --------------- | --------------- | --------------- | --------------- | --------------- | 
| P1 | 0,7 | 0.2 | 0.5 | 0.3 | 0.2 |
| P2 | 0.3 | 0.8 | 0.5 | 0.7 | 0.8 |

## C: Fuzzy cluster:

Each point is allowed to be in more than one cluster up to some degree.

Suppose you have a box with 10 balls 5 black and 5 white and we pick a ball. We do not know in advance what the color will be, we know it will have a color. This is the probabilistic case

Suppose two colors b, w. You create a grey color 60/40. This is a fuzzy color.

### Rules

\[1. \qquad u_j: x \to [0,1], \qquad j=1,\dots,m\]

\[2. \quad \sum_{j=1}^{m} u_j(x_i) = 1, \qquad i = 1, \dots, N \]

\[3. \quad 0 < \sum_{i = 1}^{N} u_j(x_i) < N, \qquad j = 1, 2, \dots, m \]

\[\begin{cases} 1. & \qquad \text{ $u_j(x)$ is a belonging funcion for one cluster, outputs a degree of belonging.} \\ 2. & \qquad \text{ For one } x \text{ if you use all the cluster's membership function only one will be 1 and the others 0. } x \text{ belongs to one cluster} \\ 3. & \qquad \text{ For one clusters } u_j, \text{ the sum of all } x \text{'s in the function is less than the whole set. Each cluster is then not empty and we have more than one cluster} \end{cases}\]

## D: Possibilistic clustering:

The notion of belonging is gone: We measure the degree to which each point is compatible to a cluster.

We have a function that measures the compatibility.
Now they do not need to sum to one

### Rules

\[1. \qquad u_j: x \to (0,1], \qquad j=1,\dots,m\]

\[2. \quad 0 < \sum_{i = 1}^{N} u_j(x_i) < N, \qquad j = 1, 2, \dots, m \]

\[\begin{cases} 1. & \qquad \text{ $u_j(x)$ is a membership funcion for one cluster, like a boolean operation. Outputs true or false (1, 0)} \\ 3. & \qquad \text{ For one clusters } u_j, \text{ the sum of all } x \text{'s in the function is less than the whole set. Each cluster is then not empty and we have more than one cluster} \end{cases}\]

u outputs a degree of compatibility.

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


## Defining Dis-similarity

1. dissimilarity measure in term of a vector

the measure then is a function that maps a pain of vectors to a value.

there needs to be a non negative bound of the lowest value.

\[x = \left[\begin{matrix} a \\ b \end{matrix}\right]\] \[y = \left[\begin{matrix} a \\ b \end{matrix}\right]\]
\[d(x,y) = \sqrt{(x_1 - y_1)^2 + (x_2 - y_2)^2}\]

\[d(x,y)\geq 0 = d_0\]

# Lesson 2

We will proceed with some other basic ideas before we go to the main issue (the clusterin algorithm)

Little reminder that in clustering we alsway have in mind a set of entities represented by a $l$ dimentional vector. The function that takes as input a pair of vectors and returns a numver is the dissimilarity measure we defined last time.

## Defining similarity

The function that takes vector pairs and returns a number

### Criteria

It must have the following properties

1. \[\]

Examples inner product, cosine similarity...

#### Exercise for at home

Do

## Within set proximity measure

We always have a set of data points and we consider all possible subsets of $x$ $\text{let} D_i subset X, i = 1, \dots , k and U = \{D_1 \dots, D_K\}$ (find the symbol for subset)

In ordert odefine the proximity between sets we should first define the proximity between a point and a set.

For this we have

1. The non parametric way (all the sets points)
2. The parametric case (you use a representative of the set). Meaning:
    * Mean vector
    * Mean cetner 
    * Median center

So here we go

The first case

All the points of the set (cluster)

We define a max, min and average function for the data points and we look at what they would look like for similarity and disimilarity together

\[\]

the mean vector case

\[m_p = \frac{1}{n_c} \sum_{y\in C} y\]

you take the average of all the x's and the average of all the y's and that is the coordinates of the representative

<hr>

The mean center case

\[m_c \in C : \sum_{y \in C} d(m_c, y) \leq \sum_{y \in C} d(z, y), \forall z \in C\]

For each data point the sum from the data point to all others

<hr>

The meadian center

\[M_{med} \in C: med(d(m_{med}, y | y \in C) \leq med(d(z,y)|y \in C), \forall z \in C\]

For each data point the distances from all others. Meaning you do the calculation fro mteh mean center and write them increasing and find the meadian

<hr>

Discreet features are more fitted to mean center and meadian. We want both in cases where we have outcast entities. It's just like statistical analysis.

Non discreet (continous) are more fitted to the mean vector.

<hr>

### Linear shaped clusters

In this case a hyperplane is a better representation. For a hyperplane

\[\sum_{j=1}^l a_jx_j + a_0 = a^Tx+a_0 = 0\]

<hr>

### Hyperspherical clusters

The representative is a circle

\[(x-c)^T\times (x-c) = r^2\]

The distance form a point to a circle is the distance of the point to the center minus the radious if outside the cirle and r-d() for inside it (absolute)

<hr>

Thus back to the original question

Distance of a set and a set.

Non parametric:
We define the same 3 functions

For the max if d(D1, D2) = 0 then we have 1 point, otherwise it's $\neq 0$
For the min d(D1,D2) = 0 means they have at leas 1 common point

Parametric
Point representatives then the distance of the sets is the distance of the representatives
We take the cardinalitty

----------

# Lesson 3

> [!NOTE]
> Remember last lecture that the distances were defined from points and sets and all combinations.
> The representativbe of a cluster and all the different ways to redefine them.

We had only gone over 2 of the 3 discreet proximity measures

## More distances

### Between vectors, for mixed valued vectors.

> This is defined as some of the features being discreet and some being real continous values

In this case what we do is:
* Simply adopt a measure that is suitable for continous values and treet the discreet values as continous.
* Map the continous values to discreet ones and use a discreet measure
* Ration scaled

For ratio scaled we define a $w_k$ for 0 and 1 outputs where if atleast one of the $x_k$ and $y_k$ is undefined we set 0.

* Non ordinal case $\begin{cases} 1, \text{if } x_k = y_k = 1 \text{ (or } x_k = y_k \text{ )} \\ 0, \text{otherwise} \end{cases}$
* Ordinal case$\begin{cases} 1, \text{if } x_k = y_k = 1 \text{ (or } x_k = y_k \text{ )} \\ 0, \text{otherwise} \end{cases}$
* Continous case $ 1 - \frac{|x_k - y_k|}{r_k}$ $r_k$ is the distance from the max and the min in the frature.

This is coherent becuase the values are from 0 to 1.

If one was unavailable then the values of the numerator will be the same but he denomenator will change and we cannot compare their sizes

----------

### Fuzzy measures

A l dimentional unit space is considered and we do not have measurements we have degree of compatibility.

In this case we define the s() and the distance of a vector to itself relies other than just on itself on the distance from the center. Look at the slides.

----------

### Dynamic similarity measures

This is for vectors that have different lengths. (words)
Or even... sequences

----------

### The missing data case

Some of my coordinates are unknown.

* Discard all vectors with missing values
* Take the average of the features at that position and substitute that value with the mean
* Do something like the mixed values, no discard but look at only the available features. This means adding a weight for specific features.
* sum the proximity of the available values and use their average.

----------

# Clustering algorithm

The question is, in how many ways can i assign the values of the data set to $m$ groups?

> [!NOTE]
> Conclusion: it is essentially impossible to go over all the possible solutions for even trivially small cases.

> [!NOTE]
> The answer to this problem is: Do not consider all possible clusterings

Thus we will look for sensible clusterings 

Thus the clustering algorithm is a learning process

> [!NOTE]
> The word clustering means {c1, c2} = {{x1, x2}, {x3, x4}}

## Categorizations

A major categorization is impossible however

Roughly

> [!NOTE]
> We have 4 chategories:
* Cost function optimization
* Probabilistic clustering
* Fuzzy clustering
* Possibilistic
* Other

### Sequential

These produce a single clustering. In order to do this they pass over the data one or a few times. The $m$ is not known a priori

> [!NOTE]
> We define a $\theta$ that is a cutoff for the distance to be within a cluster.

#### Basic Sequential Clustering Algorithm

```matlab
m=1 \{number of cluseter}\
Ck = {x1} 
for i = 2 to N 
    -Find Ck d(xi, Ck) = min d(i, Cj)
    if (d(xi,Ck)>theta) AND(m<q) then 
        m = m+1
        Cm = {xi}
    else
    ck = ck \cup {xi}
    if there is a representative of the cluster re compute it
```

Look at slides (lesson 3)

At the time of xi being put into a cluster if i have y clusters then it will be assignted to one where if later another cluster appears then it could have been the case that should that cluster have existed before the xi was clustered then xi would have ended up in that new cluster.

BSAS

----------

#### Modified Basic Sequential Clustering Algorithm

This is simple, in the initial run do not assign the point xi into the cluster it belogns to. After you find the clusters assign in a extra run.

----------

#### TTSAS

As we said thus far a basic parameter is the $\theta$ and it characterizes if a distance is large or small per say (less than $\theta$ or more than $\theta$)

There is a problem here that distances very close to $\theta$ but on either sides are groupsd in very different ways. 

The idea of this algorithm (TTSAS) is to define two such points $\theta_1$, $\theta_2$. Inbetween is a gray area and on either side is the small - large distances.

\[\begin{cases} x_i<\theta_1 & \text{small distance} \\ x_i > \theta_2 & \text{large distance} \\ \theta_1< x_i< \theta_2 & \text{grey distance} \end{cases}\]

The desicion of the clustering will be postponed till later on a second pass.

##### Example

In practice it might take more than two passes

#### Maximin

How do we define clusters here? The set of points that have been chosen to define a cluster up to the current iteration step.

$w$ is the 

For all points not in $w$ 

Didn't quite catch all that.

##### Example

He draws the clusters on the board, in such a way that there are 3 in the middle and they are equal distant from two on either side of their line.

 .
...
 .

like this

$W$ will be the farthest x's for the top and bottom cluster, the two data points with the greatest distance.

For all the other points i need to find the closest representative (takes random points and we see which it is closer of the two original farthest distant x's).

> Now can you tell me the points whose distance from its closest representative is the maximum one

The ones in the middle to the sides (hypotenous).

Thus the next points in $W$ is that one. Do the same for the other points. We reach a points where its not quite as easy since the cluster representatives have reached a sort of symmetricla shape at the outskirts of all the data. Then you add one more at the max and "can you see form this procedure we perfoemed here a criterion which says which is the true number of clusters?". We make a graph where y is the distance and x is the number of clusters, then you can see that if we plot all the steps we did it is a almost $\sin(x)$ type function that gets more abrupt for larger and larger clusterings.

The subjetiveness of $\theta$ has been moved to the point where i decide the drop in distance is too large.

This is more computative than [BSAS](#basic-sequential-clustering-algorithm) 

> [!NOTE]
> Having said all this we have completed the presentation of the sequential algorithms

----------

### Hierarchical

These do not produce one clustering, they produce a sequence of nested clusterings.

#### Agglomerative

I begin witha a clustering where all points belogn to a single cluster and merge cluster up to the case where i have a 1 clustering

Agglomerative

----------

#### Devisive

This works in the opposite direction of the [Agglomerative](#agglomerative) ones.

----------

#### Combinations

----------

#### Cost Function Optimization (CFO algorithms)

We define a $u_{ij}$ that is essentially a metric opposite of the distance normalized to 0,1 and quantifies "relation".

In this way the rows are points and the columns are clusters.

> What is the aim here? To place the representatives in to dense in data regions.

For instance if i had lines then I want the line to pass through the regions dense in data.

This leads to a iterative scheme, and the sheme is essentially the different clustering types all with every single representative type. A hard CFO scheme, fuzzy...

However we notice a issue with the cost function minimization, since $u$ is discreet it is not differentiable, thus the cost funciton too... We cant use calculus.

##### Generalized hard algorithmic scheme

###### K means

This requires a-priori knwledge of the number of clusters.

You'll need to look at the slides nad the data form the first few exercises since the code has been given to us.

In all this form we only did partial optimization based on differential calculus. Because if you recall we did not use a gradient since we had discreet values.

We close with some remarks about he k-means algorithm and how it is popular and it's old, from around the 60's.

The ke means is sensitive to the outliers and noicse and it does not suite data with categorical coordinates

The solution is the [k meadoid algorithms](#k-meadoid) 

###### The issue with CFO algorithms

Look at the slides of the k means algorithm and notice that there is a problem in one of the k menas clusterings since it is a cost function optimization and not a  clustering algorithm. It find the positions of the four representatives so that the sum is as small as possible.

----------

###### K meadoid

The cluster will have a meadoid which is acutally one of the points in the data set for its representative.

We only deal with point representatives becasue the representative is a point itself.

Then we define some values to describe this new idea that we have introduced

* $\theta$
\[X={x_1, x_2, \dots, x_100}
\theta = {x_1, x_10, x_35}
I_{\theta} = {1, 10 , 35}
I_{x-\theta} = {1, 10 , 35}\]

Notice that the cost function has the point and not the $\theta$ but we have the medoid. (comparison with [k means](#k-means) 

The question is how can we find the representatives. Since we dont have the exact calculus scheme, we need a discreet optimization procedure.

What is the benefit of usi9ng meadoids instead of means. Example below (in the slides).

Because the medoid for discreet values can be inter preted but the mean cant
If I had a outlier then it would not represent the cluster with the mean however the meadian will.

> [!NOTE]
> The follwing are algorithms within the meadoids set

###### PAM

Partitioning around medoids

Two sets of medoids each consisting of m elements if they have m-1 elements in common then we say that these medoids are neighorts.

Then each medoid can have $m(N-m)$ neighbors. This proof is easy, take an example with 3 medoids.

Let us define then $\theta_{ij}$ the neighbor of $\theta$ that results if $x_j$ replaces $x_i$ ( I got this wrong look at the slides)

We also define then the difference in the cost functiojn fo the $\theta_{ij}$ function from $\theta$
if the difference is negative then the new $\theta$ is a better clustering

Then we say the code for the algorithm

Thus it gets stuck in local minimum since the algortihm staerts fro ma abstract $\theta$.

###### CLARA

The problem we had with [PAM](#pam) is with the computations

You reduce the dataset randomly and use [PAM](#pam) 

This is just a [PAM](#pam) heuristic to remove some of the computations. You sort of hinge on the fact of their being no small clusters. 

###### CLARANS

Another [PAM](#pam) heuristic

Two discounts this time. First of all in pam if you remember if I have a $\theta$ to consider all its neighbnors. In this heuristic i find the $\theta$ that is simply better than the previous and not the optimal better one.

Consider that this time you run the heuristic multiple times because it's a heuristic.

----------

And thus concludes the hard clustering.



> [!NOTE]
> Do the example in matlab 1 on paper

# Lesson 4

We will get the first exercise in the following week

BSAS is not actually a acronym for what we said it is

## What is a scheme

The scheme might contain lots of algorithms

for instance the representative of the clusters (lines or other) each defines another algorithm

We do a little retake of the last lecture

----------

[TTSAS](#TTSAS) 
[maxmin](#maxmin) 
[CFO's](#cost-function-optimization-cfo-algorithms) 

# Lesson 5

Little recap from last time

I'll add the hyperlinks here I guess to all the new things we do.
[k means rehash](#k-means) 

We are still doing the cost function optimization algrotihms scheme.
[Issues with CFO's](#the-issue-with-CFO-algorithms) 
[k meadoid](#k-meadoid) 
[Partitioning around medoids](#pam) 
[CLARA](#clara) 
[CLARANS](#clarans) 
We colcuded the hard clustering case

## Probabilistic clustering

We do a little intro to the probability theorey

A random vector is a collection of random variables

Since we are talking about random variables we must define a probability dnesity function of the random vector. The joint rpobability density function of its constituants

Then a covariance matrix is a matrix of variance of individuals points of the vector and of the pairs.

### EM algorithm

You need prior knowledge of the number of clusters 

keep in mind that this is the start of the probabilistic and all the probability density functionas and their respecrive features are assumedto be known at this point.

The aim is to move the probability densities to the points dense in data.

? Unimodal distribution?

# Lab 1

# Lesson 6 Ish

 Pay attention to the algomerative algorithm with the min distance.

# Lesson 7 Ish

After the agglomerativ ve algorithms and the introduction to matrix theorey and graph theorey.

For the Agglomerative clustering algorithms what happenes when we have a tie in the proximity matrix. Actually in the sinlge link algorithm the order will have little effect in a tie, so if a tie exists in the porximity matrix then the order in which we consider these 2 entries does not matter.

When you consider the complete link however, the choice matters alot.

We will postpone the discussion of the cophonetic matrix to the last lecture. (Because clsuter and clustering validity)

And with this we move to the devicive algorithms.

## Divisive scheme

> [!NOTE]
> This is the scheme where the whole dataset is inside the first cluster and we move down to individual clsuters of one feature vector.

The ROCK heuristic

