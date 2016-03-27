PROGRAM HarmonicNumerical
IMPLICIT NONE
REAL, ALLOCATABLE, DIMENSION(:) :: x, v, t          !Declare real variables
REAL k, m, xs, vs, ts, pi
INTEGER i, j, n         !Declare integer variables
n = 500
pi = 4.0*atan(1.0)
ALLOCATE(x(n), v(n), t(n))
WRITE(*,*) 'Input the spring constant.'
READ(*,*) k
WRITE(*,*) 'Input the mass at the end of the spring.'
READ(*,*) m
x(1) = 2.0
v(1) = 0.5
xs = pi/50.0
vs = pi/50.0
ts = pi/50.0
t(1) = 0.0
DO i = 1, n - 1
	t(i + 1) = t(i) + ts
	x(i + 1) = v(1)*sqrt(m/k)*sin((sqrt(k/m)*(t(i + 1)))) + x(1)*cos((sqrt(k/m)*t(i + 1)))
	v(i + 1) = v(1)*cos((sqrt(k/m))*t(i + 1)) - x(1)*(sqrt(k/m))*sin((sqrt(k/m)*t(i + 1)))
ENDDO

!Write out the values you have calculated to file so you can plot them

OPEN(UNIT = 10, FILE = 'xharmonic.dat')
OPEN(UNIT = 20, FILE = 'vharmonic.dat')
	WRITE(10, *) '# t, x'
	WRITE(20,*) '# t, v'
	DO i = 1, n
		WRITE(10,*) t(i), x(i)
		WRITE(20,*) t(i), v(i)
	ENDDO
CLOSE(10)
CLOSE(20)
END
