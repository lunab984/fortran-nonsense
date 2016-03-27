Program CircleArea
implicit none
Real pi, r, A
! This program reads a real number r and prints
! the area A of a circle with radius r.
write(*,*) "I want a radius."
read(*,*) r
pi = 3.14159265358979323846264338327950288
A = pi*r*r
write(*,*) "A = ", A
end
