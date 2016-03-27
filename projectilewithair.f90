Program projectilenoair
implicit none

integer(4) :: i 
Real(8), dimension(3) :: r, v, vold, a
real(8) :: t, tau, g, speed, pi, theta, height, maxheight, cdrag, rho, m, area
pi = 4.0*atan(1.0d0)
t = 0.d0
r(1) = 0.0d0
r(2) = 0.0d0
tau = 0.01
g = -9.8
cdrag = 0.47
rho = 1.2754
m = 0.06782
area = pi*(0.0255/2.0)**2
r(3) = 1.02
theta = 36.0

write(*,*) "whats the initial speed"
read(*,*) speed


theta = (pi/180.0d0)*theta
v(1) = speed*cos(theta)
v(2) = 0.0d0
v(3) = speed*sin(theta)
a(1) = 0.0d0
a(2) = 0.0d0
a(3) = g

open(unit=100, file='xta.dat')
open(unit=110, file='zta.dat')
open(unit=120, file='vxta.dat')
open(unit=130, file='vzta.dat')
open(unit=140, file='xza.dat')
open(unit=150, file='axta.dat')
open(unit=160, file='azta.dat')
open(unit=170, file='xyz.dat')

write(100,*) t, r(1)
write(110,*) t, r(3)
write(120,*) t, v(1)
write(130,*) t, v(3)
write(140,*) r(1), r(3)
write(150,*) t, a(1)
write(160,*) t, a(3)

do i = 1, 10000
    height = r(3)
    vold = v
    speed = sqrt((v(1)**2)+(v(2)**2)+(v(3)**2))
    a = (-(cdrag*area*rho*speed*v)/(2*m))
    a(3) = a(3) + g
    v = v + a*tau
    r = r + (v + vold)/2.0*tau
    t = t + tau
    

write(100,*) t, r(1)
write(110,*) t, r(3)
write(120,*) t, v(1)
write(130,*) t, v(3)
write(140,*) r(1), r(3)
write(150,*) t, a(1)
write(160,*) t, a(3)
write(170,*) r(1), r(2), r(3)

    if (r(3) > height) then
        maxheight = r(3)
    endif

    if (r(3) <= 0.0) then
    exit
    endif
enddo

write(*,*) "The object will hit the ground in ", t, "seconds"
write(*,*) "The maximum height was ", maxheight, "meters"
write(*,*) "The range is", r(1), "meters."

close(100)
close(110)
close(120)
close(130)
close(140)
close(150)
close(160)

end
