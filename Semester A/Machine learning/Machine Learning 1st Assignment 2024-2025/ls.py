# Importing libraries
from collections.abc import Callable
import numpy as np
import matplotlib.pyplot as plt
from math import sqrt

# The actual parameter vector theta
actual = np.array([-1, 0.9, 0.7, 0, -0.2, 0.2]) # The actual theta values

# This function is not used anywhere in the code.
# It is simply for an alternative attempt
# at the theta estimation that was done
# while trying to create the final
# estimation function (estimate()).
# It was based on the other formula using all the iterations but
# This got quite difficult to handle in the code and we assume
# also taxing computationally.
# We actually split most of the functions but this one one point
# were the two cooperators wanted to implement the same function
# def estimate2(x: np.ndarray, y: np.ndarray, prior: np.ndarray)-> np.ndarray:
#     """Uses in place operations on theta to update the estimates with indexing"""
#     for i in range(len(prior)):
#         hold = 0
#         divisor = 0
#         unit = 0
#         units = 0
#         for index in range(len(x)):
#             hold += x[index]**(i+1) * y[index]
#             divisor += (x[index]**(i + 1) * x[index]**(i + 1))
#             unit += x[index]**(0) * y[index]
#             units += (x[index]**(0) * x[index]**(0))
#         prior[i] = hold/divisor
#     # A priori knowledge
#     prior[-1] = unit/units
#     prior[3] = 0
#     print(f"Theta output {prior}")
#     return prior

def regressor(theta, x, noise, degree) -> np.ndarray:
    """
    Takes variables and forms the  y's of a quadratic function.
    We use this function quite alot.
    """
    line = theta[-1] + noise
    for power in range(degree):
        line += theta[power] * x**(power + 1)
    return line

# This function is not striclty nessacery but it will be nice to see the difference of the models
# This is also good to implement for learning purposes
# In any case we will use this to implement some of the visualizations for our data and to understand whe it is that the code has done
def loss(y, f):
    """Implements the loss fucntion of the regression"""
    # output = (y - f)**2
    # return output
    pass

# This function is not striclty nessacery but it will be nice to see the difference of the models.
# This is also good to implement for learning purposes.
# In any case we will use this to implement some of the visualizations for our data and to understand whe it is that the code has done
def cost(theta):
    """Implements the cost fucntion of the regression"""
    # output =
    # for input in range(N):
        # output += loss()
    #     pass
    pass

# We are asked to do multiple experiments (100) so a function to do each one is defined here
def train(points: int, degree: int, noise: np.ndarray | None, nmean: int | float = 0, nvar: int | float = 0.05, theta: np.ndarray = actual, **kwargs) -> tuple:
    """
    This function generates a training set as was mentioned in the prelude of problem 1.
    Points refers to how many points the set should have.
    Degree refers to the degree of the polynomial (integer).
    Noise refers to any noise to add to each point.
    Theta is the parameter for the coefficients of each x. Note that theta 0 should be last (index -1).
    Use the keyword arguments for plot options.

    Generally the theta is said to be the actual parameter vector theta from the prelude of problem 1.
    In any case we have left that parameter open to input just in case.
    """
    # Training set of 20 equidistant points adhering to the given interval
    x = np.linspace(0, 2, points)
    if noise is None:
        noise = np.random.normal(nmean, sqrt(nvar), points)
    # Creating y with a loop that adds as many factors as the degree using the theta we decided for initialization
    y = regressor(theta, x, noise, degree)
    # ploting test set
    plt.scatter(x, y, **kwargs)
    plt.plot(x, regressor(theta, x, 0, 5), label="f(x) 0 noise", color="red")
    plt.title(f'Generated Training Set')
    plt.xlim(-0.1, 2.1)
    plt.xlabel(f'X, points: {points}')
    plt.ylabel(f'Y, degree: {degree}')
    plt.legend()
    plt.show()
    return x, y

def ls(x: np.ndarray, y: np.ndarray, degree: int, noise: np.ndarray, exclude: int | None = None, **kwargs) -> np.ndarray:
    """
    This function applies the least squares generalised linear regression.
    Degree refers to the degree of the polynomial (integer).
    Noise refers to any noise to add to each point.
    Exclude refers to any coefficients to set to 0 (referenced by index i.e theta 0 -> 0).
    """
    def estimate(x: np.ndarray, y: np.ndarray, degree: int, hush: bool = False) -> np.ndarray:
        """
        Uses operations on theta to update the estimates with the inputs.
        Degree refers to the degree of the polynomial (integer).
        Hush is a boolian for if we want output loging to occur.

        There is also a alternative function that was attempted here without matrix operations,
        that funciton is commented out at the start of this cell. It was never finished.
        """
        # Create the design matrix X with polynomial terms up to `degree`
        X = np.vstack([x**i for i in range(1, degree + 1)] + [np.ones(len(x))]).T
        # Calculate dot products and theta
        inverse = np.linalg.inv(np.dot(X.T, X))
        output = np.dot(inverse, np.dot(X.T, y))
        if not hush:
            print(f"The theta estimated (before a-priori knowledge) is: {output}.")
        return output
    # Calculate theta estimates using the least squares method
    theta = estimate(x, y, degree, **kwargs)
    # Adding a-priori knowledge
    if exclude:
        theta[exclude-1] = 0
    # ploting the model
    plt.scatter(x, y, label = 'Training set', color = "darkseagreen")
    # The line for the regression
    plt.plot(x, regressor(theta, x, 0, degree), label="Least Sqeuares Regression", color="purple")
    # Actual output with the real theta
    global actual
    plt.plot(x, regressor(actual, x, 0, 5), label="f(x) 0 noise", color="red")

    # General plot options
    plt.title(f"Least Squares Generalized Linear Regression")
    plt.xlim(-0.1, 2.1)
    plt.xlabel(f"X, points: {len(x)}")
    plt.ylabel(f"Y, degree: {degree}")
    plt.legend()
    plt.show()
    return theta

# Test set
def test(points: int, degree: int, noise: np.ndarray | None, method: Callable, nmean: int | float = 0, nvar: int | float = 0.05,  **kwargs) -> tuple:
    """
    The function that will generate the test set and find the regression for that data based on the method provided.
    Points refers to how many points the set should have.
    Degree refers to the degree of the polynomial (integer).
    Theta is the parameter for the coefficients of each x. Note that theta 0 should be last (index -1).
    Experiments is how many trials of test sets to do. We will use this later again.
    Noise refers to any noise to add to each point.
    Method refers to the way of estimating the parameters.
    Use the keyword arguments for method parameters.
    """
    if noise is None:
        noise = np.random.normal(nmean, sqrt(nvar), points)
    test = np.random.uniform(0, 2, points)
    # Storing output for test set use
    theta = method(degree = degree, noise = noise, **kwargs)
    # Plotting the test set
    y = regressor(theta, test, noise ,degree)
    plt.scatter(test, y, label = "Test set", color = 'dimgray', marker='s')
    reg = np.sort(test)
    plt.plot(reg, regressor(theta, reg, 0, degree), label="Least Sqeuares Regression", color="purple")
    # Actual output
    global actual
    a = np.linspace(0, 2, points)
    plt.plot(a, regressor(actual, a, 0, 5), label="f(x)", color="red")
    plt.title(f"Test set")
    plt.xlim(-0.1, 2.1)
    plt.xlabel("x")
    plt.ylabel("y")
    plt.legend()
    plt.show()
    return test, y

# Initialising problem specific variables
N = 20
# noise distribution of 0 mean and 0.05 variance
noise = np.random.normal(0, sqrt(0.05), N) # Notice that the square root is because
# the numpy funciton takes a standard deviation not a variance which is the root.

# Generating training set
x, y = train(points = N, degree = 5, noise = noise, label = 'Training set', color = 'deepskyblue', marker = 'o')

# Using model
test(points = N, degree = 5, noise = noise, method = ls, x = x, y = y, exclude = 4, hush = False)

experiments = 100
# We dont actually need to change the theta here.
# Infact the way the quetion is states the training set is exactly the same
# and we can run two test sets for each training set.
# Allocating memory to data structures before hand for faster operations.
# For this problem we will need one list with each position having all the values of x and y 
# for each experiment

training = np.array([[np.array([0]*N, dtype = np.float64), np.array([0]*N, dtype = np.float64)]]*experiments)

second = np.array([[np.array([0]*N, dtype = np.float64), np.array([0]*N, dtype = np.float64)]]*experiments)

tenth = np.array([[np.array([0]*N, dtype = np.float64), np.array([0]*N, dtype = np.float64)]]*experiments)

for experiment in range(experiments):
    x, y = train(points = N, degree = 5, noise = None, label = f'Training set {experiment + 1}', color = 'deepskyblue', marker = 'o')
    training[experiment, 0] = x
    training[experiment, 1] = y

    # Second degree
    testx, testy = test(points = N, degree = 2, noise = None, nmean = 0, nvar = 0.05, method = ls, x = x, y = y, hush = True)
    second[experiment, 0] = np.sort(testx)
    second[experiment, 1] = testy

    # Tenth degree
    testx, testy = test(points = N, degree = 10, noise = None, nmean = 0, nvar = 0.05,method = ls, x = x, y = y, hush = True)
    tenth[experiment, 0] = np.sort(testx)
    tenth[experiment, 1] = testy

# Ploting the holder
a = np.linspace(0, 2, N)
plt.scatter(training[:,0], training[:,1],  label = 'Training sets', color = 'deepskyblue')
plt.plot(np.average(training[:,0], axis = 0), np.average(training[:,1], axis = 0), label = 'Training set average', color = 'purple')
plt.plot(a, regressor(actual, a, 0, 5), label="f(x)", color="red")
plt.show()
plt.scatter(second[:,0], second[:,1],  label = 'Second degree sets', color = 'darkseagreen')
plt.plot(np.average(second[:,0], axis = 0), np.average(second[:,1], axis = 0), label = 'Second degree set average', color = 'purple')
plt.plot(a, regressor(actual, a, 0, 5), label="f(x)", color="red")
plt.show()
plt.scatter(tenth[:,0], tenth[:,1],  label = 'Tenth degree sets', color = 'dimgray')
plt.plot(np.average(tenth[:,0], axis = 0), np.average(tenth[:,1], axis = 0), label = 'Tenth degree set average', color = 'purple')
plt.plot(a, regressor(actual, a, 0, 5), label="f(x)", color="red")
plt.show()

