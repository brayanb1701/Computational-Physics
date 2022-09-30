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
    p_num_p = p_num
    s_num_p = s_num
    f_num_p = f_num
  
    do i = 1, Nx-1
      p_num(i) = 0.5d0*( p_num_p(i+1) + p_num_p(i-1)) + (0.5d0*dt / dx)*(s_num_p(i+1) - s_num_p(i-1))
      s_num(i) = 0.5d0*( s_num_p(i+1) + s_num_p(i-1)) + (0.5d0*dt / dx)*(p_num_p(i+1) - p_num_p(i-1))  
      f_num(i) = 0.5d0*(f_num_p(i+1) + f_num_p(i-1)) + 0.5d0*dt*(p_num_p(i+1) + p_num_p(i-1)) 
    end do
  
  
  
  end subroutine LAXFRIEDRICHS
