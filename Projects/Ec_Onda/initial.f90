!====================================================================
! This subroutine sets the initial values of the arrays and variables
! ===================================================================

subroutine initial

    use arrays
    use global_parameters
    
    implicit none
    
    !Initial time
    t=0.0d0
    
    ! Initial solution
    f_num = amp * exp( - ( x - x0 )**2 / sigma**2 ) + 1e-20
    f_exc = amp * exp( - ( x - x0 )**2 / sigma**2 ) + 1e-20
    
    s_num = - 2.0D0 * amp * ( ( x - x0 ) / sigma**2 ) * exp( - ( x - x0 )**2 / sigma**2 )
    
    p_num = 0.0d0
     
    
    end subroutine initial 