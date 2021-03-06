PROGRAM AirDrag !This program finds the time it takes with air drag for a spherical object to fall.
IMPLICIT NONE
REAL y, v, t, a, tau, vold, cdrag, area, rho, m, pi, analytical, b !Initialize everything 
OPEN(UNIT=25, FILE='AirDragCodecheckY.dat')
WRITE(25,*) '# time    height'
OPEN(UNIT=30, FILE='AirDragCodecheckV.dat')
WRITE(30,*) '# time    velocity'
OPEN(UNIT=35, FILE='AirDragCodecheckA.dat')
WRITE(35,*) '# time    acceleration'
OPEN(UNIT=40, FILE='AirDragAnalyticalSol.dat')
WRITE(40,*) '# time    height'
y = 1000.0
v = 10.0
t = 0.0
a = -9.8
vold = 0.0
pi = 4*atan(1.0)
cdrag = 0.47
area = 0.0013564489*pi
rho = 1.2754
m =  0.07366
tau = 0.0001
b = (cdrag*rho*area)/(2*m)
DO WHILE(analytical .ge. 0)
analytical = y - (1/b)*log(cosh(t*sqrt(9.8*b)))
WRITE(40,*) t, analytical
t = t + tau
ENDDO
t = 0.0
DO WHILE(y .ge. 0)
t = t + tau
vold = v
v = v + a*tau
y = y + 0.5*(v + vold)*tau
a = (-(cdrag*area*rho*abs(v)*v)/(2*m)) - 9.8
WRITE(25,*) t, y !y vs. t
WRITE(30,*) t, v !v vs. t
WRITE(35,*) t, a !a vs. t
ENDDO
END
