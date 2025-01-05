# Importing libraries
from collections.abc import Callable
from math import sqrt
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

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
def train(points: int,
          degree: int,
          noise: np.ndarray | None,
          nmean: int | float = 0,
          nvar: int | float = 0.05,
          theta: np.ndarray = actual,
          **kwargs) -> tuple:
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

def ls(x: np.ndarray,
       y: np.ndarray,
       degree: int,
       noise: np.ndarray,
       exclude: int | None = None,
       **kwargs) -> np.ndarray:
    """
    This function applies the least squares generalised linear regression.
    Degree refers to the degree of the polynomial (integer).
    Noise refers to any noise to add to each point.
    Exclude refers to any coefficients to set to 0 (referenced by index i.e theta 0 -> 0).
    """
    def estimate(x: np.ndarray,
                 y: np.ndarray,
                 degree: int,
                 hush: bool = False) -> np.ndarray:
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
def test(points: int,
         degree: int,
         noise: np.ndarray | None,
         method: Callable,
         nmean: int | float = 0,
         nvar: int | float = 0.05,
         **kwargs) -> tuple:
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
    line = regressor(theta, reg, 0, degree)
    plt.plot(reg, line, label="Least Sqeuares Regression", color="purple")
    # Actual output
    global actual
    a = np.linspace(0, 2, points)
    plt.plot(a, regressor(actual, a, 0, 5), label="f(x)", color="red")
    plt.title(f"Test set")
    plt.xlim(-0.1, 2.1)
    plt.xlabel(f"X, points: {points}")
    plt.ylabel(f"Y, degree: {degree}")
    plt.legend()
    plt.show()
    return test, y, line

# Initialising problem specific variables
N = 20
# noise distribution of 0 mean and 0.05 variance
noise = np.random.normal(0, sqrt(0.05), N) # Notice that the square root is because
# the numpy funciton takes a standard deviation not a variance which is the root.

# Generating training set
x, y = train(points = N,
             degree = 5,
             noise = noise,
             label = 'Training set',
             color = 'deepskyblue',
             marker = 'o')

# Using model
test(points = N,
     degree = 5,
     noise = noise,
     method = ls,
     x = x,
     y = y,
     exclude = 4,
     hush = False)

experiments = 100
# We dont actually need to change the theta here.
# Infact the way the quetion is states the training set is exactly the same
# and we can run two test sets for each training set.
# Allocating memory to data structures before hand for faster operations.
# For this problem we will need one list with each position having all the values of x and y
# for each experiment

training = np.array([[np.array([0]*N, dtype = np.float64), np.array([0]*N, dtype = np.float64)]]*experiments)

second = np.array([[np.array([0]*N, dtype = np.float64), np.array([0]*N, dtype = np.float64)]]*experiments)
holder2 = np.array([np.array([0]*N, dtype = np.float64)]*experiments)

tenth = np.array([[np.array([0]*N, dtype = np.float64), np.array([0]*N, dtype = np.float64)]]*experiments)
holder10 = np.array([np.array([0]*N, dtype = np.float64)]*experiments)

for experiment in range(experiments):
    # Training set
    x, y = train(points = N,
                 degree = 5,
                 noise = None,
                 label = f'Training set {experiment + 1}',
                 color = 'deepskyblue',
                 marker = 'o')
    training[experiment, 0] = x
    training[experiment, 1] = y
    # Second degree
    testx, testy , line2 = test(points = N,
                                degree = 2,
                                noise = None,
                                nmean = 0,
                                nvar = 0.05,
                                method = ls,
                                x = x,
                                y = y,
                                hush = True)
    second[experiment, 0] = np.sort(testx)
    second[experiment, 1] = testy
    holder2[experiment] = line2
    # Tenth degree
    testx, testy, line10 = test(points = N,
                                degree = 10,
                                noise = None,
                                nmean = 0,
                                nvar = 0.05, method = ls,
                                x = x,
                                y = y,
                                hush = True)
    tenth[experiment, 0] = np.sort(testx)
    tenth[experiment, 1] = testy
    holder10[experiment] = line10

# Ploting the training sets
a = np.linspace(0, 2, N)
plt.scatter(training[:,0], training[:,1],  label = 'Training sets', color = 'deepskyblue')
plt.scatter(np.average(training[:,0], axis = 0), np.average(training[:,1], axis = 0), label = 'Training set average', color = 'purple')
plt.plot(a, regressor(actual, a, 0, 5), label="f(x)", color="red")
plt.title(f'Training set overview')
plt.xlabel(f'X, points: {N} x {experiments}')
plt.ylabel(f'Y, degree: {5}')
plt.legend()
plt.show()

# Ploting the second degree polynomial test sets
plt.scatter(second[:,0], second[:, 1],  label = 'Second degree sets', color = 'darkseagreen')
plt.scatter(np.average(second[:, 0], axis = 0), np.average(second[:,1], axis = 0), label = 'Second degree set average', color = 'purple')
for index, item in enumerate(holder2):
    if index == 0:
        plt.plot(np.sort(second[index,0]), item, color = 'black', label = 'Regression lines')
    else:
        plt.plot(np.sort(second[index,0]), item, color = 'black')
plt.plot(a, regressor(actual, a, 0, 5), label="f(x)", color="red")
plt.title(f'Second degree polynomials overview')
plt.xlabel(f'X, points: {N} x {experiments}')
plt.ylabel(f'Y, degree: {2}')
plt.legend()
plt.show()

# Ploting the tenth degree polynomial test sets
plt.scatter(tenth[:,0], tenth[:,1],  label = 'Tenth degree sets', color = 'dimgray')
plt.scatter(np.average(tenth[:,0], axis = 0), np.average(tenth[:,1], axis = 0), label = 'Tenth degree set average', color = 'purple')
for index, item in enumerate(holder10):
    if index == 0:
        plt.plot(np.sort(tenth[index,0]), item, color = 'black', label = 'Regression lines')
    else:
        plt.plot(np.sort(tenth[index,0]), item, color = 'black')
plt.plot(a, regressor(actual, a, 0, 5), label="f(x)", color="red")
plt.title(f'Tenth degree polynomials overview')
plt.xlabel(f'X, points: {N} x {experiments}')
plt.ylabel(f'Y, degree: {10}')
plt.legend()
plt.show()

# Assigning variables
N500=500
theta_new = np.array([-10.54, 0.465, 0.0087, 0, -0.093, -0.004])

def ML(phi, sigmaH):
    output = np.linalg.inverse(phi.T @ np.linalg.inverse(cov) phi) @ phi.T @ np.linalg.inverse(cov) @ theta
    return output

def MAP():
    output = something + np.linalg.inverse(phi.T @ np.linalg.inverse(cov) phi) @ phi.T @ np.linalg.inverse(cov) @ (theta - phi @ something)
    return output

# Full bayesian inference
def inference(x_train,
              y_train,
              g_noise_coeff,
              theta0,
              prior_cov_coeff,
              degree,
              hush: bool = True):
    # make the phi matrices based on x_train and x_test (np.vstack creates the transposed version, so it needs .T)
    phi_train = np.vstack([x_train**i for i in range(1, degree + 1)] + [np.ones(len(x_train))]).T
    #calculate the covariance of the noise given its coefficient (eg 0.05, 0.15)
    gaussian_noise_cov = g_noise_coeff * np.identity(len(theta0))
    #residual
    difference = y_train - phi_train @ theta0
    #calculate the posterior mean, y predictions, and posterior covariance
    posterior_mean = theta0 + 1/(g_noise_coeff) * np.linalg.inv(((1/(prior_cov_coeff) * np.identity(len(theta0))) + 1/(g_noise_coeff) * (phi_train.T @ phi_train))) @ phi_train.T @ difference
    # print(f'posterior_mean: {posterior_mean}')
    posterior_cov = np.linalg.inv(((1/(prior_cov_coeff) * np.identity(len(theta0))) + 1/(g_noise_coeff) * (phi_train.T @ phi_train)))
    # print(f'posterior_cov: {posterior_cov}')
    posterior = np.random.multivariate_normal(posterior_mean, posterior_cov, size=1)
    mu_y = phi_train @ posterior_mean
    # print(f'mu_y: {mu_y}')
    inv_term = np.linalg.inv(gaussian_noise_cov + prior_cov_coeff * (phi_train.T @ phi_train))
    # calulate the variance of y
    y_var = []
    for x in phi_train:
        x = x.reshape(-1, 1)
        y_variance = g_noise_coeff + g_noise_coeff * prior_cov_coeff * (x.T @ inv_term @ x)
        y_var.append(y_variance.item())

    y_std = np.sqrt(np.array(y_var))
    # print(f'y_std: {y_std}')
    y_var_col = np.array(y_var).reshape(-1, 1)
    # print(f'y_var: {y_var}')
    y_var_diag = np.diagflat(y_var_col)
    # print(f'y_var_diag: {y_var_diag}')
    prob_y = np.random.multivariate_normal(mu_y, y_var_diag, size=1)

    if not hush:
        #plot training fit
        plt.fill_between(
            np.sort(x_train),
            mu_y - 1.96 * y_std,
            mu_y + 1.96 * y_std,
            color='gray',
            alpha=0.3,
            label="95% Confidence Interval"
        )
        plt.plot(np.sort(x_train), mu_y, label="FBI predicted Line", color="blue")
        plt.scatter(np.sort(x_train), y_train, label="Training Data", color="red")
        plt.legend()
        plt.title(
            f"FBI training with parameters : Noise Var = {g_noise_coeff}, theta_prior = {theta0}, Prior Var = {prior_cov_coeff}, Npoints = {len(x_train)}"
            )
        plt.xlabel("x")
        plt.ylabel("y")
        plt.show()
    
    # Return the posterior mean and covariance and y_cov for plotting
    return mu_y, y_std, posterior_mean, posterior_cov, inv_term


def predict_inference(x_train,
                      y_train,
                      x_test,
                      y_test,
                      g_noise_coeff,
                      theta,
                      prior_cov_coeff,
                      degree,
                      hush: bool = True):
    phi_test = np.vstack([x_test**i for i in range(1, degree + 1)] + [np.ones(len(x_test))]).T
    output_train = inference(x_train, y_train, g_noise_coeff, theta, prior_cov_coeff, degree)
    posterior_mean = output_train[2]
    inv_term = output_train[4]
    mu_y_test = phi_test @ posterior_mean
    gaussian_noise_cov = g_noise_coeff * np.identity(degree+1) # This might be useful later but is unused for now

    # calulate the variance of y
    y_var = []
    for x in phi_test:
        x = x.reshape(-1, 1)
        y_variance = g_noise_coeff + g_noise_coeff * prior_cov_coeff * (x.T @ inv_term @ x)
        y_var.append(y_variance.item())

    y_std_test = np.sqrt(np.array(y_var))
    # print(f'y_std: {y_std}')
    y_var_col = np.array(y_var).reshape(-1, 1)
    # print(f'y_var: {y_var}')
    y_var_diag = np.diagflat(y_var_col)
    # print(f'y_var_diag: {y_var_diag}')
    prob_y_test = np.random.multivariate_normal(mu_y_test, y_var_diag, size=1) # This might be useful later but is unused for now
    # print(f'prob_y_test: {prob_y_test}')

    # Plot the predictive mean with confidence intervals
    if not hush:
        plt.fill_between(
            np.sort(x_test),
            mu_y_test - 1.96 * y_std_test,
            mu_y_test + 1.96 * y_std_test,
            color='gray',
            alpha=0.3,
            label="95% Confidence Interval"
        )
        plt.plot(np.sort(x_test), mu_y_test, label="FBI predicted Line", color="blue")
        plt.scatter(np.sort(x_test), y_test, label="Test Data", color="red")
        plt.legend()
        plt.title(
            f"FBI testing with parameters : Noise Var = {g_noise_coeff}, theta_prior = {theta}, Prior Var = {prior_cov_coeff}, Npoints = {len(x_test)}"
            )
        plt.xlabel("x")
        plt.ylabel("y")
        plt.show()

    return y_std_test, mu_y_test

# plot training and test for noise 0.05, N=20, theta_prior=actual, prior_cov_coeff=0.1, degree=5
x_train = np.linspace(0, 2, N)
noise = np.random.normal(0, 0.05, N)
x_train+=noise
y_train = regressor(actual, x_train, noise, 5)
x_test = np.linspace(0, 2, N)
noise_test = np.random.normal(0, 0.05, N)
x_test+=noise_test
y_test = regressor(actual, x_test, noise_test, 5)
output_test = predict_inference(x_train, y_train ,x_test, y_test, 0.05, actual, 0.1, 5, hush = False)

# plot training and test for noise 0.15, N=20, theta_prior=actual, prior_cov_coeff=0.1, degree=5
x_train015 = np.linspace(0, 2, N)
noise015 = np.random.normal(0, 0.15, N)
x_train015+=noise015
y_train015 = regressor(actual, x_train015, noise015, 5)
x_test015 = np.linspace(0, 2, N)
noise_test015 = np.random.normal(0, 0.15, N)
x_test015+=noise_test015
y_test015 = regressor(actual, x_test015, noise_test015, 5)
output_test015 = predict_inference(x_train015, y_train015, x_test015, y_test015, 0.15, actual, 0.1, 5, hush = False)

# plot training and test for noise 0.05, N=20, theta_prior=theta_new, prior_cov_coeff=0.1, degree=5
x_train_thetanew = np.linspace(0, 2, N)
noisethetanew = np.random.normal(0, 0.05, N)
x_train_thetanew+=noisethetanew
y_train_thetanew = regressor(actual, x_train_thetanew, noisethetanew, 5)
x_test_thetanew = np.linspace(0, 2, N)
noise_test_thetanew = np.random.normal(0, 0.05, N)
x_test_thetanew+=noise_test_thetanew
y_test_thetanew = regressor(actual, x_test_thetanew, noise_test_thetanew, 5)
output_test_thetanew = predict_inference(x_train_thetanew, y_train_thetanew, x_test_thetanew, y_test_thetanew, 0.05, theta_new, 0.1, 5, hush = False)

# plot training and test for noise 0.05, N=500, theta_prior=theta_new, prior_cov_coeff=0.1, degree=5
x_train_thetanew_n500 = np.linspace(0, 2, N500)
noisethetanew_n500 = np.random.normal(0, 0.05, N500)
x_train_thetanew_n500+=noisethetanew_n500
y_train_thetanew_n500 = regressor(actual, x_train_thetanew_n500, noisethetanew_n500, 5)
x_test_thetanew_n500 = np.linspace(0, 2, N500)
noise_test_thetanew_n500 = np.random.normal(0, 0.05, N500)
x_test_thetanew_n500+=noise_test_thetanew_n500
y_test_thetanew_n500 = regressor(actual, x_test_thetanew_n500, noise_test_thetanew_n500, 5)
output_test_thetanew_n500 = predict_inference(x_train_thetanew_n500, y_train_thetanew_n500, x_test_thetanew_n500, y_test_thetanew_n500, 0.05, theta_new, 0.1, 5, hush = False)

# plot training and test for noise 0.05, N=20, theta_prior=theta_new, prior_cov_coeff=2, degree=5
x_train_thetanew_prior2 = np.linspace(0, 2, N)
noisethetanew_prior2 = np.random.normal(0, 0.05, N)
x_train_thetanew_prior2+=noisethetanew_prior2
y_train_thetanew_prior2 = regressor(actual, x_train_thetanew_prior2, noisethetanew_prior2, 5)
x_test_thetanew_prior2 = np.linspace(0, 2, N)
noise_test_thetanew_prior2 = np.random.normal(0, 0.05, N)
x_test_thetanew_prior2+=noise_test_thetanew_prior2
y_test_thetanew_prior2 = regressor(actual, x_test_thetanew_prior2, noise_test_thetanew_prior2, 5)
output_test_thetanew_prior2 = predict_inference(x_train_thetanew_prior2, y_train_thetanew_prior2, x_test_thetanew_prior2, y_test_thetanew_prior2, 0.05, theta_new, 2, 5, hush = False)

# plot training and test for noise 0.05, N=500, theta_prior=theta_new, prior_cov_coeff=2, degree=5
x_train_thetanew_n500_prior2 = np.linspace(0, 2, N500)
noisethetanew_n500_prior2 = np.random.normal(0, 0.05, N500)
x_train_thetanew_n500_prior2+=noisethetanew_n500_prior2
y_train_thetanew_n500_prior2 = regressor(actual, x_train_thetanew_n500_prior2, noisethetanew_n500_prior2, 5)
x_test_thetanew_n500_prior2 = np.linspace(0, 2, N500)
noise_test_thetanew_n500_prior2 = np.random.normal(0, 0.05, N500)
x_test_thetanew_n500_prior2+=noise_test_thetanew_n500_prior2
y_test_thetanew_n500_prior2 = regressor(actual, x_test_thetanew_n500_prior2, noise_test_thetanew_n500_prior2, 5)
output_test_thetanew_n500_prior2 = predict_inference(x_train_thetanew_n500_prior2, y_train_thetanew_n500_prior2, x_test_thetanew_n500_prior2, y_test_thetanew_n500_prior2, 0.05, theta_new, 2, 5, hush = False)

# New variables
sigmaTheta = 0.1
# Remember that the real theta values are in a global variable named actual
# The number 20 is also in the variable N
import math

def iso(x: np.ndarray | None, mean: np.ndarray, covariance: float, points: int = 100):
    """This function will draw the iso-level curves of a Gaussian"""
    if x is None:
        x = np.linspace(0, 2 * np.pi, points)
    # Getting eigenvectors and values
    values, vectors = np.linalg.eig(covariance)
    mag = np.sqrt(values)
    ellipse = vectors @ np.array([mag[i]*np.cos(x) if i % 2 == 0 else mag[i]*np.sin(x) for i in range(len(mag)) ]) + mean[:, np.newaxis]
    plt.plot(ellipse[0, :], ellipse[1, :], label="Iso-level curve")
    plt.scatter(mean[0], mean[1], color='red', label='Mean')
    plt.title("Gaussian distribution")
    plt.xlabel(f"X, points: {len(x)}")
    plt.ylabel("G(θ)")
    plt.legend()
    plt.show()

def gaussian(x: np.ndarray | None, mean: np.ndarray, covariance: float, points: int = 100):
    """This function implements a Gaussian distribution.
    Returns The Gaussian distribution.

    points is how many points the gaussian should use
    """
    try:
        dimensions = len(mean)
    except TypeError:
        dimensions = 1
    if x is None:
        x = np.linspace(0, 2, points)
    distribution = np.zeros(len(x))
    # We need to separate the cases of the dimensions because the numpy functions
    # used require objects that have atleast multiple indexes
    if dimensions == 1:
        for index, factor in np.ndenumerate(x):
            difference = factor - mean
            exponent = -0.5 * difference**2 / covariance
            distribution[index] = (1 / (np.sqrt((2 * np.pi)**dimensions * covariance))) * np.exp(exponent)
    # Multidimensional case
    else:
        for index, factor in np.ndenumerate(x):
            difference = factor - mean
            exponent = -0.5 * difference.T @ np.linalg.inv(covariance) @ difference
            distribution[index] = (1 / (np.sqrt((2 * np.pi)**dimensions * np.linalg.det(covariance)))) * np.exp(exponent)
    fig, ax = plt.subplots()
    ax.plot(x, distribution, label = "Gaussian function")
    ax.scatter(x, distribution)
    plt.title("Gaussian distribution")
    plt.xlabel(f"X, points: {len(x)}")
    plt.ylabel("G(θ)")
    plt.legend()
    plt.show()
    iso(x = None, mean = mean, covariance = covariance, points = points)
    return distribution

# Checking that the gaussian function works
gaussian(None, actual, sigmaTheta * np.identity(len(actual)))
# sigmatheta* np.identity is the creation of our covariance matrix
# There is still some error checking not done in the function such as
# checking that the covariance is just a scalar variance when the
# dimensions are 1 dimensional but since we are the ones using this
# funciton we will make sure to use correct variable pairs farther down
# since the point of this exercise is not to write the perfect funcions.

# Defining the variables (since they change this time)
N = 500

# Expectation Maximization
def EM(alpha: int | float,
       beta: int | float,
       epsilon: int | float,
       kappa: int,
       data: np.ndarray,
       **kwargs) -> tuple:
    """
    alpha refers to the initial alpha value (the function does not initialize)
    beta refers to the initial beta value (the funciton does not initialize)
    epsilon refers to the cutoff the difference between two consecutive iterations should be
    kappa refers to the number of distributions to estimate (in our case always 1)
    data refers to the training set points (input the data)
    The key word arguments should be used for.
    """
    # Initializing a and b
    phi = np.vstack([data**i for i in range(1, degree + 1)] + [np.ones(len(x))]).T
    sigmaTheta = 1/alpha
    sigmaEta = 1/beta
    alpha_pr = alpha
    beta_pr = beta
    N = len(data)
    # This parameter is for counting the iteration we are on
    j = 0
    while abs(alpha - alpha_pr) > epsilon and abs(beta - beta_pr) > epsilon:
        alpha_pr = alpha
        beta_pr = beta
        # E step
        variance = np.linalg.inv(alpha * np.identity(len(phi.T @ phi)) + beta * phi.T @ phi)
        mean = beta * variance @ phi.T * y
        Alpha = np.linalg.norm(mean)**2 + np.trace(variance)
        Beta = np.linalg.norm(y-phi @ mean)**2 + np.trace(phi @ variance @ phi.T)
        Q = (kappa) / 2 * np.log(alpha) + (N)/(2) * np.log(Beta) - (alpha) / 2 * Alpha - (beta) / 2 * Beta + 0 # the constant
        # M step
        alpha = kappa/Alpha
        beta = N/Beta
        sigmaTheta = 1/alpha
        sigmaEta = 1/beta
        # gaussian(data, mean, variance)
        # Showing output
        print(f'''---Iteration {j}---
        a (j): {alpha_pr}
        b (j): {beta_pr}
        Mean: {mean}
        A: {Alpha}
        B: {Beta}
        Q: {Q}
        a (j+1): {alpha}
        b (j+1): {beta}''')
        # counting iteration
        j += 1
    # sigma Eta
    fig, ax = plt.subplots()

    # sigma Theta
    return sigmaTheta, sigmaEta, alpha, beta

