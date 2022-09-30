
subroutine coloc_points


use global_parameters
use arrays
implicit none

! :::::::::::::::::::::::::::::::::::::::::::::::
! Puntos de colocación

xmax = 1.0d0
xmin = -1.0d0  

dx = (xmax - xmin)/dble(Nx)

do i=0,Nx
    XX(i) = xmin + dble(i)*dx
end do

! :::::::::::::::::::::::::::::::::::::::::::::::


end subroutine coloc_points
