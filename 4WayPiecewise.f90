PROGRAM FourWayPiecewise
IMPLICIT NONE
REAL x, y, step
INTEGER i, n
x = 0.0
OPEN(UNIT = 5, FILE = 'ThreeWay.dat')
WRITE(5, *) '# x=values    y-values'
n = 1000
step = 25.0/float(n)
DO i = 0, n+1
	IF (x .lt. 1.0) THEN
		y = exp(x)
	ELSEIF (x .lt. 3.3) THEN
		y = exp(1.0) + x**2 - 1
	ELSEIF (x .lt. 15.0) THEN
		y = (exp(1.0) + 3.3**2) + cos(x)
	ELSE
		y = (exp(1.0) + 3.3**2) + cos(15.0) + sin(x)
	ENDIF
	WRITE(5,*) x, y
	x = x + step
ENDDO
CLOSE(5)
END
	
