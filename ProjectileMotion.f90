PROGRAM ProjectileMotion
IMPLICIT NONE
REAL r(3), v(3),
INTEGER

r(1) = x
r(2) = y
r(3) = z
v(1) = v(x)
v(2) = v(y)
v(3) = v(z)
a(1) = a(x)
a(2) = a(y)
a(3) = a(z)
OPEN(UNIT = 10, FILE = 'projectile.dat')
DO
