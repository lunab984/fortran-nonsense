PROGRAM Sine
IMPLICIT NONE
REAL xrad, xdegrees(100), y(100), pi
INTEGER i
xrad = 0.0
pi = 4.0*atan(1.0)
DO i = 1, 100
	y(i) = sin(xrad)
	xrad = xrad + 2.0*pi/100.0
	xdegrees(i) = xrad*100.0/pi
ENDDO
OPEN(UNIT = 10, FILE = 'SineArray.dat')
DO i = 1, 100
	WRITE(10,*) xdegrees(i), y(i)
ENDDO
CLOSE(10)
END
