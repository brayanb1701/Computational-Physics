
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
  print*,'x',x(i) 
end do


!do i=0,N
!  if(i.lt.(0.5d0*(N+1))) then
!    x(i) = cos(pii*i/int((N-1)*0.5))
!  else
!    x(i) = cos(pii*(i-int((N+1)*0.5))/int((N-1)*0.5))
!  end if
!  print*,'x',x(i) 
!end do

! :::::::::::::::::::::::::::::::::::::::::::::::


end subroutine coloc_points
