PROGRAM Summation
IMPLICIT NONE
INTEGER, DIMENSION(101) :: x, yint
REAL y, xterm
INTEGER k, n
k = 1
WRITE(*,*) "Type the number you want to recursively add."
READ(*,*) x(k)
WRITE(*,*) "Now type the number of recursions you want to perform."
READ(*,*) n
xterm = x(1)
y = 0.0
DO k = x(k), n 
	Write(*,*) k, "!", k 
	y  = y + (k)*x(1)
ENDDO
WRITE(*,*) y
k = 1
!DO k = x(k), int(y) - 1
!	WRITE(*,*) y, "!", k
!	y = y + k
!ENDDO
!WRITE(*,*) y
END
