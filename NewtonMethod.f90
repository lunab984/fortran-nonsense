PROGRAM NewtonMethod
IMPLICIT NONE
REAL x, y, yPrime
INTEGER i, j
WRITE(*, *) 'Welcome to the Newton Method program!'
WRITE(*, *) 'The function we will be using will be y = x^2 - 2. We will be calculating the square root of 2!'
WRITE(*, *) 'How many iterations of Newton Method would you like to perform? '
READ(*, *) i
WRITE(*, *) 'What is your initial guess for the root? Please use a number bigger than zero. '
READ(*, *) x
DO j = 1, i
	y = -2 + x**2
	yPrime = 2 * x
	
	x = x - (y / yPrime)
ENDDO
WRITE(*, *) 'Here is the value Newton Method came up with.'
WRITE(*, *) x
WRITE(*, *) 'Have a nice day!'
END
