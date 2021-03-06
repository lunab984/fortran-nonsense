PROGRAM TwoBody3D
IMPLICIT NONE
REAL(8), DIMENSION(3) :: r, v, a, f1v, f2v, f3v, f4v, f1a, f2a, f3a, f4a, B, E
REAL(8) t, tau, pi, m, q
INTEGER i, n
n = 50000
t = 0.0
tau = 0.1
pi = 4.0*atan(1.0)
m = 1.0
q = 1.0

r(1) = 0.0d0
r(2) = 1.0
r(3) = 0.0d0

v(1) = 1.0d0
v(2) = 0.0d0
v(3) = 0.0d0

B(1) = 0.0
B(2) = 0.0
B(3) = 0.01

E(1) = 1000.0
E(2) = 0.0
E(3) = 0.0

a(1) = (q/m)*(E(1) + (v(2)*B(3) - v(3)*B(2)))
a(2) = (q/m)*(E(2) + (v(3)*B(1) - v(1)*B(3)))
a(3) = (q/m)*(E(3) + (v(1)*B(2) - v(2)*B(1)))

OPEN(UNIT = 10, FILE = 'lorentzxyz1.dat')
DO i = 1, n
	!Finding values to average in RK4
	f1v = v
	f1a = a
	
	f2v = v + 0.5*tau*a
	f2a(1) = (q/m)*(E(1) + (f1v(2)*B(3) - f1v(3)*B(2)))
	f2a(2) = (q/m)*(E(2) + (f1v(3)*B(1) - f1v(1)*B(3)))
	f2a(3) = (q/m)*(E(3) + (f1v(1)*B(2) - f1v(2)*B(1)))
	
	f3v = v + 0.5*tau*f2a
	f3a(1) = (q/m)*(E(1) + (f2v(2)*B(3) - f2v(3)*B(2)))
	f3a(2) = (q/m)*(E(2) + (f2v(3)*B(1) - f2v(1)*B(3)))
	f3a(3) = (q/m)*(E(3) + (f2v(1)*B(2) - f2v(2)*B(1)))
	
	f4v = v + tau*f3a
	f4a(1) = (q/m)*(E(1) + (f3v(2)*B(3) - f3v(3)*B(2)))
	f4a(2) = (q/m)*(E(2) + (f3v(3)*B(1) - f3v(1)*B(3)))
	f4a(3) = (q/m)*(E(3) + (f3v(1)*B(2) - f3v(2)*B(1)))
	
	
	!Taking average of values produced by f1,2, etc
	r = r + (1.0/6.0)*tau*(f1v + 2.0*f2v + 2.0*f3v + f4v)
	v = v + (1.0/6.0)*tau*(f1a + 2.0*f2a + 2.0*f3a + f4a)
	a(1) = (q/m)*(E(1) + (v(2)*B(3) - v(3)*B(2)))
	a(2) = (q/m)*(E(2) + (v(3)*B(1) - v(1)*B(3)))
	a(3) = (q/m)*(E(3) + (v(1)*B(2) - v(2)*B(1)))
	WRITE(10,*) r
	t = t + tau
ENDDO
CLOSE(10)
END
