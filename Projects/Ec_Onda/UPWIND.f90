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
    f_num_p = f_num
  
    do i = 1, Nx
      f_num(i) = f_num_p(i) - (dt / dx)*( f_num_p(i) - f_num_p(i-1) )     
    end do
        
   
  
  
  end subroutine UPWIND
  