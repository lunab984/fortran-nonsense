PROGRAM IfThenStuff
IMPLICIT NONE
REAL x, y, step
INTEGER i, n
x=0.0
OPEN(unit=20, file='IfThen.dat')
WRITE(20,*) '# x-values    y-values'
n=150
step=10.0/float(n)
DO i=1, n
	IF (x .lt. 2.0) THEN
		y = x**2.0
	ELSEIF (x .le. 3.5) THEN
		y = x
	ELSE
		y = cos(x)
	ENDIF
	WRITE(20,*) x, y
	x=x+step
ENDDO
END
