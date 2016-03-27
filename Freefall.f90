PROGRAM AirDrag !This program finds the time it takes with air drag for a spherical object to fall.
IMPLICIT NONE
REAL y, v, t, a, tau, vold, cdrag, area, rho, m, pi !Initialize everything 
OPEN(UNIT=25, FILE='AirDragCodecheckY.dat')
WRITE(25,*) '# time    height'
OPEN(UNIT=30, FILE='AirDragCodecheckV.dat')
WRITE(30,*) '# time    velocity'
y = 57.0
v = 0.0
t = 0.0
a = -9.8
vold = -3.8
cdrag = 0.47
area = 0.0013564489*pi
rho = 1.2754
m = 0.07366
pi = 4*atan(1.0)
tau = 0.0001
DO WHILE(y .ge. 0)
t = t + tau
vold = v
v = v + a*tau
y = y + 0.5*(v + vold)*tau
a = -(cdrag*area*rho*abs(v)*v)/(2*m) - 9.8
WRITE(25,*) t, y !y vs. t
WRITE(30,*) t, v !v vs. t
ENDDO
END
