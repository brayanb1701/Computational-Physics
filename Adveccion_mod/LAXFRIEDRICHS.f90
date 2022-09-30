!===================================================
! This is the subroutine of the integration method: 
! UPWIND 
!===================================================

subroutine LAXFRIEDRICHS

use arrays
use global_parameters

implicit none

integer i

  !!$ Variable Recycling
  u_num_p = u_num

  do i = 1, Nx-1
    u_num(i) = 0.5d0*( u_num_p(i+1)+u_num_p(i-1))-(0.5d0*dt / dx)*( u_num_p(i+1) - u_num_p(i-1) )     
  end do



end subroutine LAXFRIEDRICHS
