import numpy as np
from math import sqrt
import matplotlib.pyplot as plt

actual = np.array([-1, 0.9, 0.7, 0, -0.2, 0.2]) # The actual theta values
N = 20

def gaussian(mean: np.ndarray, covariance: float, points: int = 100):
    """This function implements a Gaussian distribution.
    Returns The Gaussian distribution.

    points is how many points the gaussian should use
    """
    x = np.linspace(0, 2, points)
    try:
        dimensions = len(mean)
    except TypeError:
        dimensions = 1
    distribution = np.zeros(points)
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
    return distribution

distribution = gaussian(actual, 0.1 * np.identity(len(actual)), 100)
x = np.linspace(0, 2, 100)
fig, ax = plt.subplots()
ax.scatter(x, distribution, label = "Training set")
plt.title("Gaussian distribution")
plt.xlabel("x")
plt.ylabel("G(θ)")
plt.legend()
plt.show()

# Full bayesian inference
def inference(data, theta, sigmaH, sigmaTheta):
    N = len(data)
    Pnoise = gaussian(theta, sigmaH * np.identity(len(actual)), points = N)
    prior = gaussian(theta[-1], sigmaTheta, points = N)
    thetaN = (N* sigmaTheta * np.average(data) + sigmaH * theta[-1])/(N* sigmaTheta + sigmaH)
    sigmaN = (sigmaH*sigmaTheta)/(N*sigmaTheta + sigmaH) 
    posterior = gaussian(thetaN, sigmaN, points = N)
    sigmaX = sigmaH + (sigmaH * sigmaN)/(sigmaN + sigmaH)
    probX = gaussian(thetaN, sigmaX, points=N)
    return probX

prob = inference(np.linspace(0, 2, N), actual, 0.05, 0.1)

fig, ax = plt.subplots()
ax.scatter(np.linspace(0, 2, N), prob, label = "Training set")
plt.title("Gaussian distribution")
plt.xlabel("x")
plt.ylabel("G(θ)")
plt.legend()
plt.show()

