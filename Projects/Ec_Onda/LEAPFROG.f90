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
    p_num_p = p_num
    s_num_p = s_num
    f_num_p = f_num
  
    do i = 1, Nx-1
      if (i.eq.1) then
        p_num(i) = p_num_p(i) + (0.5*dt / dx)*( s_num_p(i+1) - s_num_p(i-1) )
        s_num(i) = s_num_p(i) + (0.5*dt / dx)*( p_num_p(i+1) - p_num_p(i-1) )
        f_num(i) = f_num_p(i) + dt * p_num_p(i) 
  
      else
        p_num(i) = p_num_ant(i) + (dt / dx)*( s_num_p(i+1) - s_num_p(i-1) )
        !p_num_ant(i) = p_num_p(i)
  
        s_num(i) = s_num_ant(i) + (dt / dx)*( p_num_p(i+1) - p_num_p(i-1) )
        !s_num_ant(i) = s_num_p(i)
  
        f_num(i) = f_num_ant(i) + 2*dt*( p_num_p(i))
        !f_num_ant(i) = f_num_p(i)
  
      end if
          
       
    end do
        
  
  
  
  end subroutine LEAPFROG
