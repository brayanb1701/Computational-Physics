!===================================================
! This is the subroutine of the integration method: 
! UPWIND 
!===================================================

subroutine LEAPFROG

use arrays
use global_parameters

implicit none

integer i


  !!$ Variable Recycling
  u_num_p = u_num



  do i = 1, Nx-1
    if (i.eq.1) then
      u_num(i) = u_num_p(i) - (dt / dx)*( u_num_p(i) - u_num_p(i-1) )     
    else
    end if
    u_num(i) = u_num_ant(i) - (dt / dx)*( u_num_p(i+1) - u_num_p(i-1) )     
    u_num_ant(i) = u_num_p(i) 

  end do
      
 


end subroutine LEAPFROG
