PROGRAM FourierSeries
IMPLICIT NONE
REAL, DIMENSION(5001) :: x, y
REAL yterm
REAL pi, step
INTEGER i, j 
pi = 4.0*atan(1.0)
step = 4.0*pi/5000.0
x(1) = -2.0*pi
DO i = 1, 5000 !Number of points being calculated
	y(i) = 0.0
	DO j = 1, 24 !Number of terms being used
		yterm = ((-1.0)**(j + 1.0))/float(j) * sin(float(j)*x(i))
		y(i) = y(i) + yterm
		ENDDO
	x(i + 1) = x(i) + step
ENDDO
OPEN(UNIT = 10, FILE = 'Total.dat')
WRITE(10,*) '# x,    y'
DO j = 1, 5000
	WRITE(10,*) x(j), y(j)
ENDDO
CLOSE(10)
END
