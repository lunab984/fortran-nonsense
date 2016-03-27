PROGRAM Pendulum
IMPLICIT NONE
REAL, ALLOCATABLE, DIMENSION(:) :: x, t, v, a
REAL l, g, ts, theta, pi
INTEGER i, n         !Declare integer variables
!ALLOCATE(x(n), t(n), v(n), a(n))
!initialize any necessary values - starting points, step sizes, etc..
!might also allocate memory for arrays
n = 1000
ts = 0.01
pi = 4.0*atan(1.0)
g = -9.8
l = 1.0
v(1) = 0.0
x(2) = 10.0*pi/180.0
a(1) = g/l*x(2)
x(1) = x(2) + (ts**2)/2.0*a(2)

OPEN(UNIT = 10, FILE = 'xpendten.dat')
DO i = 2, n
	a(i) = g/l*x(i)
	x(i + 1) = 2.0*x(i) - x(i - 1) + (ts**2)*a(i)
	t(i + 1) = t(i) + ts
	WRITE(10,*) t(i), x(i)
ENDDO
CLOSE(10)

END
