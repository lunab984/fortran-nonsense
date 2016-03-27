PROGRAM Numerical
IMPLICIT NONE
REAL x, y, h, step
INTEGER i, n
WRITE(*,*) "Enter in the function in x."
READ(*,*) y
WRITE(*,*) "Enter the x-value."
READ(*,*) x
WRITE(*,*) "Enter in the tau-value."
READ(*,*) h
f = (y(x+h)-y(x))/h
WRITE(*,*) 'Here is your numerical derivative.' f
WRITE(*,*) "Credits go to Dr. Alex King, Dr. Jaime Taylor, and Ms. Misty Waller."
END
