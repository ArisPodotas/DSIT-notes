# Importing libraries
from math import sqrt
import numpy as np
import matplotlib.pyplot as plt

# Initializing variables
N = 20 # The number of points
degree = 5 # The polynomial degree
actual = np.array([-1, 0.9, 0.7, 0, -0.2, 0.2]) # The actual theta values

def regressor(theta, x, noise, degree) -> np.ndarray:
    """Takes variables and forms the  y's of a linear function"""
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

def estimate(x: np.ndarray, y: np.ndarray, degree) -> np.ndarray:
    """Uses in place operations on theta to update the estimates with the matrix of matrices"""
    # Create the design matrix X with polynomial terms up to `degree`
    X = np.vstack([x**i for i in range(1, degree + 1)] + [np.ones(len(x))]).T
    # Calculate dot products and theta
    inverse = np.linalg.inv(np.dot(X.T, X))
    output = np.dot(inverse, np.dot(X.T, y))
    print(f"The theta estimated (before a-priori knowledge) is: {output}.")
    return output

# This function is not used anywhere in the code.
# It is simply for an alternative attempt
# at the theta estimation that was done
# while trying to create the final
# estimation function (estimate()).
# def testimate(x: np.ndarray, y: np.ndarray, prior: np.ndarray)-> np.ndarray:
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

# We are asked to do multiple experiments (100) so a function to do each one is define here
def training(points: int, degree: int, exclude: int | None = None, theta: np.ndarray | None = None, noise: np.ndarray | None = None) -> np.ndarray:
    """This function implements the least squares regression for multiple experiments"""
    # Training set of 20 equidistant points adhering to the given interval
    x = np.linspace(0, 2, points)
    # Checking for an input theta
    if theta is None:
        theta = np.zeros(degree+1)
    # noise distribution of 0 mean and 0.05 variance
    if noise is None:
        noise = np.random.normal(0, sqrt(0.05), points)

    # Creating y with a loop that adds as many factors as the degree using the theta we decided for initialization
    y = regressor(theta, x, noise, degree)
    # Calculate theta estimates using the least squares method
    theta = estimate(x, y, degree)
    # Adding a-priori knowledge
    if exclude:
        theta[exclude-1] = 0
    # Generating the Least squares y
    y = regressor(theta, x, noise, degree)

    # Training set points plot
    plt.scatter(x, y, label="Training data")
    # The line for the regression
    reg = np.sort(x)
    line = regressor(theta, reg, 0, degree)
    plt.plot(reg, line, label="Regression", color="green")
    # Actual output with the real theta
    global actual
    ideal = regressor(actual, x, 0, 5)
    plt.plot(x, ideal, label="f(x) 0 noise", color="purple")

    plt.title(f"Least squares generalized linear regression")
    plt.xlim(-0.1, 2.1)
    plt.xlabel("x")
    plt.ylabel("y")
    plt.legend()
    plt.show()
    return theta

# Test set
def testing(points, degree, theta, experiments: int, noise: np.ndarray | None = None) -> None:
    """The function that will generate the test set and find the regression for that data"""
    for experiment in range(experiments):
        test = np.random.uniform(0, 2, N)
        if noise is None:
            noise = np.random.normal(0, sqrt(0.05), N)
        # Plotting the test set
        plt.scatter(test,regressor(theta, test, noise, degree) , label = "Regression", color = 'orange', marker='x')
        reg = np.sort(test)
        line = regressor(theta, reg, 0, degree)
        plt.plot(reg, line, label="Regression", color="green")
        # Actual output
        global actual
        a = np.linspace(0, 2, N)
        equation = regressor(actual, a, 0, 5)
        plt.plot(a, equation, label="f(x)", color="red")
        plt.title(f"Test set {experiment + 1}")
        plt.xlim(-0.1, 2.1)
        plt.xlabel("x")
        plt.ylabel("y")
        plt.legend()
        plt.show()

# Storing output for test set use
output = training(N, degree, exclude = 4)

# Using model
testing(N, degree = degree, experiments = 1, theta = output)
