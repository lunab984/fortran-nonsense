PROGRAM SurfacePlot
IMPLICIT NONE
REAL, ALLOCATABLE, DIMENSION(:,:) :: z
REAL, ALLOCATABLE, DIMENSION(:) :: x, y
REAL xi, yi, pi
INTEGER i, j, n
pi = 4.0*atan(1.0) !Setting value of pi
n = 50   !However many grid points
ALLOCATE(z(n, n), x(n), y(n)) !Allocates, z, x, and y variables to be n long
y(1) = -2.0*pi !Starting point in the y- direction
x(1) = -2.0*pi  !Starting point in the x- direction
xi = 4.0*pi/n !Incremental spacing in the x direction
yi = 4.0*pi/n !Incremental spacing in the y direction
DO i = 1, 49
	x(i + 1) = x(i) + xi !Set grid point values
	y(i + 1) = y(i) + yi
ENDDO
DO i = 1, n
	DO j = 1, n
		z(i, j) = cos(x(i))*sin(y(j))
	ENDDO
ENDDO
OPEN(UNIT = 10, FILE = 'surfaceplot.dat')
WRITE(10, *) '# x, y, z'
DO i = 1, n
	DO j = 1, n
		WRITE(10, *) x(i), y(j), z(i, j)
	ENDDO
ENDDO
CLOSE(10)
END
