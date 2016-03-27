PROGRAM Pendulum
IMPLICIT NONE
REAL, ALLOCATABLE, DIMENSION(:) :: x, t, v, a
REAL l, g, ts, theta, pi
INTEGER i, n         !Declare integer variables
ALLOCATE(x(n), t(n), v(n), a(n))
!initialize any necessary values - starting points, step sizes, etc..
!might also allocate memory for arrays
pi = 4.0*atan(1.0)
g = -9.8
l = 2.0
v(1) = 0.0
x(2) = 10.0*pi/180.0
a(1) = g/l*sin(x(2))
x(1) = x(2) + (ts**2)/2.0*a(2)


DO i = 2, n
	a(i) = -a(1)
	x(i + 1) = x(i - 1) + 2*x(i)*v(i)
	

ENDDO

!Write out the values you have calculated to file so you can plot them


END
