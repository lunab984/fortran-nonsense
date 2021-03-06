PROGRAM Sine
IMPLICIT NONE
REAL x, y, xdegrees, pi
INTEGER i, n
!This program calculates, the sine for several values
x = 0.25
n = 1000.0
OPEN (unit=10, file='sinedegrees.dat')
pi = 4.0*atan(1.0)
WRITE(10,*) "x-degrees    y-values"
DO i = 1,n+1
	y = sin(x)
	xdegrees = x*(180/pi)
	write(10,*) xdegrees, y
	x = x + 2.0*pi/n
ENDDO
CLOSE(10)
END
