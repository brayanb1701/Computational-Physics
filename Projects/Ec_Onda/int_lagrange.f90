real(kind=8) function int_lagrange(arr,p,nn)

use arrays
use global_parameters

implicit none
real(kind=8) y,L
real(kind=8), dimension (0:Nx) :: arr
integer i,j,p,nn,s
y = 0.0d0
s=1
if (p==Nx) then
    s=-1
end if
do i=1,nn
    L = 1.0d0
    do j=1,nn
            if (i/=j) then
                L  = L*(x(p)-x(p+s*j))/(x(p+s*i)-x(p+s*j))
            end if
    end do
    y = y+L*arr(p+s*i)
end do
int_lagrange=y
return 
end function int_lagrange