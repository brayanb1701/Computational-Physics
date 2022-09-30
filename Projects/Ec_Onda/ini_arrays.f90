!==============================================================
! This subroutine sets the initial values of the arrays in zero
! =============================================================

subroutine ini_arrays

    use arrays
    use global_parameters 
    
    implicit none 
    
    ! Arrays of the grid ==========================================
    
    x=0.0d0
    
    ! Arrays of the functions =====================================
    
    f_num=0.0d0
    f_num_p=0.0d0
    f_num_ant=0.0d0
    f_exc=0.0d0
    
    !====Psi
    
    s_num=0.0d0
    s_num_p=0.0d0
    s_num_ant=0.0d0
    
    !====Pi
    
    p_num=0.0d0
    p_num_p=0.0d0
    p_num_ant=0.0d0
    
    
    end subroutine ini_arrays
    