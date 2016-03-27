PROGRAM HarmonicNumerical 
IMPLICIT NONE
REAL, ALLOCATABLE, DIMENSION(:) :: x, v, t, a, KE, PE, SS, ad   !Declare real variables
REAL k, m, pi, ts, b
INTEGER i, j, n         !Declare integer variables
n = 10000
pi = 4.0*atan(1.0)
ALLOCATE(x(n), v(n), t(n), a(n), KE(n), PE(n), SS(n), ad(n))
m = 0.297
k = 8.731
x(1) = sqrt(0.04/8.731)
v(1) = 0.0
t(1) = 0.0
a(1) = -1*k/m*x(1)
ts = 0.001

b = 0.036
DO i = 1, n - 1
	a(i + 1) = (-1.0*k/m)*x(i) - b/m*v(i)
	v(i + 1) = v(i) + ts*a(i)
	x(i + 1) = x(i) + ts*v(i + 1)
	KE(i) = 0.5*m*(v(i + 1))**2
	PE(i) = 0.5*k*(x(i + 1))**2
	SS(i) = PE(i) + KE(i)
	t(i + 1) = t(i) + ts
ENDDO

!Write out the values you have calculated to file so you can plot them

OPEN(UNIT = 10, FILE = 'xharmonicnums.dat')
OPEN(UNIT = 20, FILE = 'vharmonicnums.dat')
OPEN(UNIT = 30, FILE = 'keharmonicnums.dat')
OPEN(UNIT = 40, FILE = 'peharmonicnums.dat')
OPEN(UNIT = 50, FILE = 'ssnharmonicnums.dat')
	WRITE(10, *) '# t, x'
	WRITE(20,*) '# t, v'
	WRITE(30,*) '# t, KE'
	WRITE(40,*) '# t, PE'
	WRITE(50,*)	'# t, SS'
	DO i = 1, n
		WRITE(10,*) t(i), x(i)
		WRITE(20,*) t(i), v(i)
		WRITE(30,*) t(i), KE(i)
		WRITE(40,*) t(i), PE(i)
		WRITE(50,*) t(i), SS(i)
	ENDDO
CLOSE(10)
CLOSE(20)
CLOSE(30)
CLOSE(40)
CLOSE(50)
END
