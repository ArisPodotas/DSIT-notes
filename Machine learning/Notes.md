# Pre game

The book: 

The zoom link: https://us06web.zoom.us/j/82533932472?pwd=jVblKylNKZMnJYA1iebHcyXaGyaPib.1

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
> Stavros Perantonis
> Records lectures

# Lesson 1

Aquantances

> Gets input on the Majors of the students
> Apparently its very diverse
> He is looking for physicists and mathematicians

Depth and width of what we will examine shall be adapted to the non mathematicians.

No black boxes without explanation. This is a foundation course with purpose to step on for the other lessons. All algorithms will be explained.

It may take longer than 3 hours

## The lectures themselves

It's about understanding, we may go as deep as we need. The field is changing very fast, and this is why the foundations are important. When new methods come about we will be able to adapt.

## organization

All recorded and uploaded to youtube. One day after each lecture you recieve instructions and materials. 13 lectures in total.

### Rules

* Two practical assignments in code.
* One before and one after christmas.
* Intermediate exam in December
* Final grade is a weighted average
* Assignments 35 percent, bootcamp 10%
* The exam intermediate is not mandatory (I will take it)
* If you pass the intermediate the final is on half the material.

### Books

Pater recognition book and Machine learning book thodoridis 2016, thodoridis 2008.
* Both recomended. Joined subject from both.

# What is machine learning

Why do we as data scientists want to know about data science

Learning is the personal expirience and knowledge given to us, it propagates in scosiety. It's about a development of models to explain the world. Our personal models might not be as sophisticated as the whole's. Learning from data is about unveiling a possible *hidden structure* and *regularity patterns*. this helps us *analyze*. This all leads to **predictions**.

That is general learning, machine learning is teaching the computer to learn in a way that mimics the way we as individuals/scosiety learn. We must transcribe aptterns or the way the brain works to the computer.This must be **efficient**. It's human learning pitched into the computer

* Making 
* Designing efficient algorithms
* Interpreting and predicting data

There is too much data, the computer is able to deal with more data than a human can. Data that is high in **dimensionality** are hard for humans and the human mind to understand.

> High dimensionality is data that relies on lots of factors.

In the early 1990's if you wanted to do stock market prediction you would be lucky to find data on 100 stocks. Now we have *3T* (terrabytes) of data. Also the models then couldnt even be adapted to the size we have today. Today the models conforms to big data.

* Robustness in noise is very important

> We dont want our model to change alot when our data changes a little
> We want our model to adapt to data we haven't seen before.

## Tasks

There are 1 or 2 tasks that are very central to machine learning

* Calssification
* Regression

### Classification

What do we want to do?

We have patterns we want to classify. They may be anything. We want to classify them to one out of a number of calsses. An example is tumor data.

The first step is to represent data to the computer.

(for images)
One way would be pixel by pixel. Maybe a better way would be that instead to the whole image maybe the subsection would be better. Lines like diagonals horizontals. First we need to get this data. 

We group our data into **Features** and **Featrue vectors**. We have our vector *x* that has *l* elements. Now our picture becomes a single point in space known as the ***Feature space***. We start with a big number of features. So we move to the feature selection stage.

Nowadays the feature selection is skipped because it does it inside it.

The 2d feature space is a graph, each feature is a point.

*
and 
X
Represent our calsses here

we call the * our training space because we know a-priori that they are in the malignant category.

We have to use the training space to form a ***classifier*** 
The machine has to make a rule to group the classifier.

in this case \[\mathrm{f}(\mathrm{x}) = \theta_1x_1 + \theta_2x_2 + \theta_0\] 

The purpose is to find appropriate values for the parameters so that the line described does the calssification.

Trainign set is a set of pairs where the $x_n$ is feature vectors and $y_n$ is the classes (labels)

* 1 for malignant
* 0 for benign

Based on the training data f(x) should predict the output label.

So I trained the system (find appropriate parameters for the trainign set) Now what?

Now anything that lies above the line is 1 and anything below is 0

> So it decides by label.

We also leave a point in the training set that is un categorized. This is for us to get the output, if it immideatly classifies it in the malignant or not group.

the classes are named $\omega_1$ and $\omega_2$

This is supervised learning because there is a supervisor.

#### Unsupervised learning or clustering

Imagine no trainign set and no labels. Just dots that are indistiguishable to one another. What it can say is "these points here make a cluster, those make another". That is not a line. It wont know exactly why but it tells us something we didn't know before.

Here we don't know how many classes we have

#### Semisupervised

With labels but only or some of my terms, the minority. You get the advantage of both labeled and un labeled calsses.

> Sort of like the one point int he supervised one

### Regression

before we had $y_0$ as a discreet set. Now they are not discreet

We are in a 1D space.

Now it has to find a line or other that ***Fits*** the data. No longer will it group them as above and below the line but the line should represent the pattern they share. Don't get me wron they will still be above and below it just does not mean the same as before due to the line we drew.

    Q: Why would you need a *ML* program to do regression
    A: When we talk about machine learning we include these terms, the idea of the ML is not a specific program. 50 years ago we called it statistics. (a simple regression program is a ML one)

A example is a denoise algorithm of an image (yes using just a regression).


    To continue, classification and regression should be clear.

<span style = 'color: green'>今私はへーどホムーで聞きっている</span>

#### Example with prints

In this case we enclose the shapes of the prints in the training data and it learns that the wolf has a square area, the bear has a different ratio in the print shape and that the hare is more skewed upwards than laterally in the data.

All this is measred in x and y area and clustered. We can see in the data.

If you only had squareness The bear and the hare would be mixed.

If you only had solidness. Everyone would be mixed

* Classifiers either quadratic or linear

Linear has to do with the how simple it is, we need models that are complicated enough to capture the problem but there is also no simpler program that solves. (okams razor)

You can pick the features off of personal or human knowledge. (go back to the trainig data)

    The guiding principle is dont be ovely complicated.

We will be talkng alot about system evaluation and calssifier design.

Not feature generation and selection.

# A Bayesian Optimization Perspective and Pioneers of Statistically inspired machine learning

Pioneers of statistically inspired machine leantin

We have 2 that are seperate and yet intercorralated

* We use vectors alot
* We can have all the materials of statistics and probability help us

* Thomas Bayes 1707 - 1761 
* Abraham Wald 1902 - 1950 U.S

Abraham wald is the example with the plaines of war and where the reinforcement should go on the plane

> A plane comes back with local groups of holes
> Everyone rushed to fortify the spots where the holes were
> Abraham said that the planes shot elsewhere are the ones that dont return
> Thus we fortify the spots without holes

## Biologically inspired machine learning


The idea is to simlate the human brain and anything ***emergent*** (like ant colonies)

* Warren McCulloch 1898 1969 Chicago
* Walter Pitts 1924 1969 Chicago with Warren
* donald Hebb 1904 1985

Walter and Warren made the first mathematical model for the brain

Donald made essentially the first neural network

We split the statistical and the biolgical load in half

    Why would we bother wit hstatistics when the field has progressed?
    Becasue it's much simpler and easy to understand.
    We also need to combine systems
    We are going to see changes in the furute and we should know both as a result

Different sub fields

Statistically inspired ones
* Bayesin learning
* Hiddem markov models
* Fuzzy logic

Biological
* reinforcement learning
* Neural Networks
* Swarm intelligence

Inbetween
* Support vector machines


Finding the parameters is in some way achieved by {} 

Optimization is at the center of machine learning

Nowadays machine learning is ubuquitous, This raises:

# Philosophical and ethical questions

CBs this morning: Video about the new planet found with machine learning
This is from 2 years ago

The machine learning advantage here is that the search is faster.

Asteroid example, the shuttle that shifted the asteroid had ml artificial intelligence on it.

## Philosophical questions

* Can machine learing act intelligently 
* Can it solve any problem that a person would solve by thinking

### Turning test

Almost 200 years old

It tests if the actor is a human or a machine

* there is a reverse turning website you should find.

Eugene Goosman was the first to pass the turning test 2014. This lead to alot of controversy about fairness of the test. Since 4 or 5 have passed.

About 600 before christ science was born - philosophy actually. There were questions about what elements make the world.

Gendels completion theorem

The argument goes:

    The machine intelligence can be wittled down to matehmatical terms so they cant answer everything. The human brain is not a mathematical concauction.

People dont accept this argument. Perhaps today but not tomorrow this should apply 

I obviously have lots of ideas against the argument.

<hr>

* Are human intelligence and machine intelligence the same
* Is the human brain essentially a computer

The chinese room argument
It answers itself

<hr> 

* Can a machine have a mind, mental state, and consciousness in the same sense that a human being can
* Can it feel how things are

## Ethical issues

We hear alot that people will lose their jobs from machine learning. For instance we are amost there with driving. The funny thing is that in Europe there is a shortage of truck drivers so in this case it solves the issue.

For anyone scared ofthis change, change came in the past and change comes in the future. It will affect you, you might be right but it is in no way bad. The industrial revolution changed the job market, we are fine. When cars came out horses went away, we lived.

* Cybersecurity

* Singularity: When humans becoem the second smarted thing on earth

From all these question almost all were in the realm of science fiction. now they are very real.

* Machine rights

# Onto the mathematical analytics

We will be cherry picking chapters from the great book of math

## Linear algebra

### Vectors

* References
* https://mml

Linear algebra is about vectors $\mathbb{R^2}$

Vectors exist in a vector space. Vectors have a direction and a length (magnitude) 

A vector has components. $\text{Vector: } X \text{ has components } x_1, x_2$. We have row and column vectors the row is the transpose of the column vector. We use columns more

### Transpose of a matrix

If

\[x = \left[\begin{matrix} a \\ b \\ c \end{matrix}\right]\]

Then:

\[x^T = \left[\begin{matrix} a & b & c \end{matrix}\right]\]

Where $x^T$ is the Transpose of $x$.

#### Vector product and Matrix multiplication

You can generalize to any dimention

A vector has a norm or a length or a multiple we call it 

we wont be able to start from vector $x$ and end up with another vector $x'$. We have another way of doing this. You use a matrix, a way to transfom a vector to get another vector in the vector space. 

If:

\[x = \left[\begin{matrix} a & b & c \end{matrix}\right]\]

Then:

\[x' = Ax = \left[\begin{matrix} a \\ b \\ c \end{matrix}\right]\]

Where $A$ is:

\[\left[\begin{matrix} \cos{\theta} & \sin{\theta} \\ \sin{\theta} & \cos{\theta} \end{matrix}\right]\]

This changes the angle of the vector to end up on the second one. Note that $x$ is horizontal and then to convert it back into a vector we have it vertically because of the multiplication.

#### Unit matrix

\[I = \left[\begin{matrix} 1 & \dots & 0 \\ \dots & 1 & \dots \\ 0 & \dots & 1 \end{matrix}\right]\]

The $\dots$ should be 0.

#### Inverse matrix

\[A^{-1} = \div{1}{ab - dc}\]

A matrix times its inverse will result in the unit matrix


\[A \times A^T = I\]

If I multiply a matrix by it's inverse I get the unit matrix

### Eigenvecor of $A$

If we have a vector whose value when multiplied by a matrix the new vector has the same direction as the original, it only changes the magnitude it's called an Eigenvector. These refer to square matrices.

\[x' = Ax = \lambda x\]

$\lambda$ is the eigenvalue of $A$

#### Eigenvalues

To get the Eigenvalues

\[det(A-\lambda I) = 0\]

### Differentiation of vectors and matrices

### The gradien

It has a very nice property
I get a iso-linear curve to y meaning that y is the same all along the curve. In all dimention this works. The gradient is thus always perpendicular, we will use this alot.

#### differentiation of a product

<hr>

## Probability and Statistics

    From lesson 2

There is utility in representing the vectors and data as probabilities Little reminder section from the mathematical prerequisites:

In porobability we have *events*. I toss a coind and I have two events. The probability of A:

\[P(A) = \lim\limits_{trials \to \infty}\frac{\text{# Occurence of }A}{\text{# trials}}\]

\[0\leq P(A)\leq1\]

Conditional probability:

\[P(A|B) =\frac{P(A \cap B)}{P(B)}\]

$P(A|B)$ Means the probability of $A$ given $B$.
From this we can get to:

\[P(A|B) = \frac{P(B|A)P(A)}{P(B)}\]

This is called Bayes rule

1. These are muttually exclusive
2. Their probabilities add up to 1

\[P(B) = P(A_1 \cap B) + P(A_2 \cap B) + \dots + P(A_n \cap B) = P(B|A_1)\times P(A_1) + \dots + P(B|A_n)P(A_n) \Leftrightarrow P(B) = \sum \]

#### Example of unfair coins

\[\begin{cases} \text{C = 1, C = 2} & \text{A priori probabilities:} \\ P(A = H | C = 1) = 0.6 & P(C=1) =0.7\\
PA=H|C-2) = 0.4 & P(C =2) = 0.3 \end{cases}\]

Now someone says (aposteriori) that I tossed a coin and I got heads, can I find what coind he used? I have:

\[P(C=1|A=H) = \frac{P(A=H|C-1)P(C=1)}{P(A=H|C-1)P(C=1) + P(A=H|C=2)P(C-2)}\]

Thus I have $\frac{0.42}{0.42+0.12} \simeq 0.77$

coin 1 is likeley to have been used because $0.77>0.5$

<hr>

### Random variables

Discreet random variables are capital letters
Continuous ones are with small letters

\[\begin{cases} \mathbb{Z} = \text{Outcome of throwing a die} & \quad \text{Discreet} \\ x: \text{Height of a person} & \quad \text{Continous} \end{cases}\]

What we like for these values is the probability density (bellcurve). This is denoted with small letters $p(x)$.

Let's look at bayes rule

\[p(x|A)P(A) = P(A|x)p(x)\]

### Total probability:

\[p(x) = \sum_{i} p(x|A_i)P(A_i)\]

Then:

\[P(A) = \int P(A|x)p(x)\mathrm{d}x\]

### Expectation value:

Discrete: $m=E[Z] = \sum_i P(Z_i)Z_i$

Continous: $m=E[x] = \int p(x)x\mathrm{d}x$

\[a>0 \quad E[aZ] = aE[Z]\]
\[E[Z_1 + Z_2] = E[Z_1] + E[Z_2]\]

Standard deviation:

Everything: $\sigma = \sqrt{E[(x-m)^2]}$ This is a measure of how dispersed my random distribution is. The square of $\sigma$ is the variance $\sigma^2$.

Discrete: $\sigma = \sqrt{\sum P(Z_i)$ (didnt write it all)

<hr>

### Gaussian (Normal) distribution:

In one dimention $p(x) = \frac{1}{\sigma} \sqrt{2\pi}\times e^{-\frac{1}{Z}\frac{(x - m)^2}{\sigma^2}}$ (its not p its exp()

Muli dmentional Gaussian: 

Good luck look at the slides
\[p(x) = \frac{1}{(2\pi)^{l/2}} \frac{1}{(det \sigma)^{l/2}}\]

<hr>

## Optimization

From lesson 2

Weather otpimizing means max aor min is up to the second derivative.

Optimizing $f(x)$ of some vector $x$. The optimum is the $\frac{df(x)}{dx} = 0$  This gives the $x$ whrer the optimuym lies and the x it's at, assume $f(x)$ is continous and differentiable

Constained version:

Optimize $f(x)$ subject to : $g(x) = 0$

You find the lagrandian

The $x$ lies on the tangent of the two curve function
Meaning that hte gradiaent of f and g is perpendicular meaning they are colinear thus

$df/dx +\lambda dg/dx = 0$

the lagrangian is $l(x, \lambda) = f+\lambda g$
then the partial derivative of the lagrangian is 0 for all factors x and $\lambda$.
and the opimal points is a saddle point of the lagrangian

with may constaints
the lagrangian will just contain the sum of all the constaints

if the constaint is a inequality

<hr>

# Applications

We watch a video on applications 

* cozmo

The little robot with a mind

* Nvidia BB8

The ai car that learns how to drive by watching us. They actually stuck it on a populated road.

* Moley

The AI cook

* DeepMind

The AI tackling *Go* the game.

* Kuka

The table tennis bot. Or maybe the wine glass musician

## Emergent behavior

Things that come up that we didn't expect in the training or didn't anticipate in the output.

Example of spider experiment where it walked without touching the ground.

Example of gripper that cant open

Offencise food finding

Example of math problems to chatgpt

# Lesson 2

Expect backtracking to [Probability](#probability-and-statistics) 

We had 3 topics, vector analysis, linear algebra, probability and statistics

    After the math

## Parametric modeling in learning

We have to adopt a specific functional form, linear quadratic ...We should be able to decide on the foarm before anything else. This is where you have to make assumptions.

If your $y$\s are discreet you have a , if they are you have a regression problem.

We define a loss function and a ascosiated cost function for finding the best fit.

the quadratic loss function

\[L(y, f \theta (x)) = (y-f \theta (x))^2\]

Cost function:

\[J(\theta) = \sum_{n=1}^N (y_n -f \theta (x_n))^2\]

The method is the least squares method from more that 2 centuries ago from Gauss.
Advantages of LS
* The minimization leads to a uniques solution
* The solution of the linear system is the solution (Easy)

For a linear model

$y = \theta_0 + \theta_1x_1 + \dots + \theta_lx_l + h = \theta_0 +\theta^T x + h = [\theta^T, \theta_0] \left[\begin{matrix} x \\ 1\end{matrix}\right] + h$

$y = \theta^Tx + h$

from the training data i foarm my cost function (substiture the above)
Now I will minimize the cost function

We explain how this regresses to:
solve \[\left(\sum_{n=1}^N x_nx_n^T\right) \theta = \sum_{n=1}^N x_n y_n\]

Big noise variance give me a big variance in my solution

## Discriminative learning

* Fast

## Generative learning

Estimate the distribution of each seperate class of the training set( fitst) and take them into account when doing the classification. This was we can generate more point if we want them.

* More expenssive
