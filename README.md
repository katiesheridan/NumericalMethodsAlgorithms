# NumericalMethodsAlgorithms
Algorithms developed to solve various numerical methods problems.

## False Position Algorithm
This algorithm finds the root of a function using the false position method. It is designed to find the zero of a function, given the function, two initial guesses, a stopping critera, and a max number of iterations. It returns the returns the location of the root, the f(x) value at the root, and the estimated error, and the number of iterations used to find it. 

## LU Factor Algorithm
This algorithm is performs the LU decomposition of a function to find the L and U matrices from an initial n x n matrix of coefficients.  It required an initial matrix, and returns the upper triangular matrix (U), the lower triangular matrix (L), and the pivoting matrix (P). 

## Simpson's Algorithm
This algorithm finds the integral of a function using Simpson's 1/3 rule over a given integral.  It requires two inputs, the x values of the function and the corresponding f(x) values in two 1xn matricies. The function then returns the intrgral value, and may employ the trapezoidal rule to find it. 
