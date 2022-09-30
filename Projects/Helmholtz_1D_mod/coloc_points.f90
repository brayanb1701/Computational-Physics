
subroutine coloc_points


use global_parameters
use arrays
implicit none

! :::::::::::::::::::::::::::::::::::::::::::::::
! Puntos de colocación

xmax = 1.0d0
xmin = -1.0d0  

do i=0,N
  x(i) = cos(pii*i/N)
end do

! :::::::::::::::::::::::::::::::::::::::::::::::


end subroutine coloc_points
