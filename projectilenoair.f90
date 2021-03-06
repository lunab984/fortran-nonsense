Program projectilenoair
implicit none

integer(4) :: i 
Real(8), dimension(3) :: r, v, vold, a
real(8) :: t, tau, g, speed, pi, theta, height, maxheight, cdrag, rho, area, m

pi = 4.0*atan(1.0d0)
t = 0.d0
r(1) = 0.0d0
r(2) = 0.0d0
tau = 0.01
g = 9.8

write(*,*) "whats the initial height"
read(*,*) r(3)
write(*,*) "whats the initial speed"
read(*,*) speed
write(*,*) "whats the launch angle"
read(*,*) theta

theta = (pi/180.0d0)*theta
v(1) = speed*cos(theta)
v(2) = 0.0d0
v(3) = speed*sin(theta)
a(1) = 0.0d0
a(2) = 0.0d0
a(3) = -g

open(unit=100, file='xt.dat')
open(unit=110, file='zt.dat')
open(unit=120, file='vxt.dat')
open(unit=130, file='vzt.dat')
open(unit=140, file='xz.dat')
open(unit=150, file='axt.dat')
open(unit=160, file='azt.dat')

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
