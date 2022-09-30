!===================================================
! This is the subroutine of the integration method: 
! UPWIND 
!===================================================

subroutine LAXWENDROFF

use arrays
use global_parameters

implicit none

integer i


  !!$ Variable Recycling
  u_num_p = u_num

  do i = 1, Nx-1
    u_num(i) = u_num_p(i)-(0.5d0*dt/dx)*(u_num_p(i+1)-u_num_p(i-1))&
               +(0.5d0*(dt**2)/(dx**2))*(u_num_p(i+1)-2.0d0*u_num_p(i)+u_num_p(i-1)) 
  end do
      


end subroutine LAXWENDROFF
