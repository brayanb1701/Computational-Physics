!====================================================
! This subroutine gives memory to the arrays
!==================================================== 

subroutine memory

    use arrays
    use global_parameters
    
    implicit none
    
    allocate(x(0:Nx))
    allocate(f_num(0:Nx))
    allocate(f_exc(0:Nx))  
    allocate(f_num_p(0:Nx))
    allocate(f_num_ant(0:Nx))
    
    allocate(s_num(0:Nx))
    allocate(s_num_p(0:Nx))
    allocate(s_num_ant(0:Nx))
    
    allocate(p_num(0:Nx))
    allocate(p_num_p(0:Nx))
    allocate(p_num_ant(0:Nx))
    
    
    end subroutine memory