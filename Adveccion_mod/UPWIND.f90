!===================================================
! This is the subroutine of the integration method: 
! UPWIND 
!===================================================

subroutine UPWIND

use arrays
use global_parameters

implicit none

integer i


  !!$ Variable Recycling
  u_num_p = u_num

  do i = 1, Nx
    u_num(i) = u_num_p(i) - (dt / dx)*( u_num_p(i) - u_num_p(i-1) )     
  end do
      
 


end subroutine UPWIND
