!=================================================
! This subroutine sets the grid
! ================================================

subroutine grid

use arrays
use global_parameters

implicit none

integer i


! Separation between the points of the grid =====
dx = ( xmax - xmin ) / dble(Nx) !!$ Spatial resolution

! Separation of time for evolution===============
dt = courant * dx

!Create the grid=================================
do i=0,Nx

   x(i)  = xmin + dble(i) * dx

end do


end subroutine grid
