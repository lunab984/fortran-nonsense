Program Actualpend
implicit none
real, allocatable, dimension(:) :: alpha, omega, theta, t
real(8) tau, g, l, pi, angle, m
integer i, n
n = 10000
allocate(theta(0:n), omega(n), alpha(n), t(n))
g = -9.8 !gravity
l = 1.0 !string
m = 1.0 !mass
pi = 4.0*atan(1.0)
tau = 0.001
write(*,*) "Input initial angle in degrees"
read(*,*) angle
t(1) = 0.0
theta(1) = angle*pi/180.0
omega(1) = 0.0
alpha(1) = g/l*sin(theta(1))
theta(0) = theta(1) - omega(1)*tau + 0.5*(tau**2.0)*alpha(1)
do i = 1, n - 1
    theta(i + 1) = -theta(i - 1) + 2.0*theta(i) + (tau**2.0)*alpha(i)
    alpha(i + 1) = g/l*sin(theta(i + 1))
    omega(i + 1) = omega(i) + 0.5*(alpha(i) + alpha(i + 1))*tau
    t(i + 1) = t(i) + tau
    
enddo
open(unit = 10, file='theta.dat')
open(unit = 20, file='omega.dat')
open(unit = 30, file='alpha.dat')
    write(10,*) "# t    theta"
    write(20,*) "# t    omega"
    write(30,*) "# t    alpha"
    do i = 1,n
        write(10,*) t(i), theta(i)
        write(20,*) t(i), omega(i)
        write(30,*) t(i), alpha(i)
    enddo
close(10)
close(20)
close(30)

end
