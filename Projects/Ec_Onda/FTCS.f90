!===================================================
! This is the subroutine of the integration method: 
! UPWIND 
!===================================================

subroutine FTCS

  use arrays
  use global_parameters
  
  implicit none
  
  integer i
  
    !!$ Variable Recycling
    f_num_p = f_num
    s_num_p = s_num
    p_num_p = p_num
  
    do i = 1, Nx-1
      p_num(i) = p_num_p(i) + (0.5*dt / dx)*( s_num_p(i+1) - s_num_p(i-1) )
      s_num(i) = s_num_p(i) + (0.5*dt / dx)*( p_num_p(i+1) - p_num_p(i-1) )
      f_num(i) = f_num_p(i) + dt * p_num_p(i)
    end do
     
   
  
  
  end subroutine FTCS
  