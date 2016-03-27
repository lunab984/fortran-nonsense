PROGRAM HeatEquation1D
IMPLICIT NONE
REAL ck, time, timeStep, spaceStep, length, h
INTEGER i, j, n, k, steps
REAL :: T(61)
timeStep = 1.0E-4
steps = 100
n = 61
ck = 1.0

time = 0.0
h = 1.0/(n - 1.0)

T=0
T(30) = 1.0/h

OPEN(10, FILE = 'Heat1.dat')
WRITE(10,*) T

DO i = 1, steps - 1
	DO j = 2, 29
		T(n - j) = T(n - j) + ck*timeStep/h**2 * (T(n - j + 1) + T(n - j - 1) - 2.0*T(n - j))
	ENDDO
	DO k = n/2, n - 1
		T(k) = T(k) + ck*timeStep/h**2 * (T(k + 1) + T(k - 1) - 2.0*T(k))
	ENDDO
	WRITE(10,*) T
ENDDO
CLOSE(10)
END
