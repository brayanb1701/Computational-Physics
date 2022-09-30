subroutine PERIODIC

    use arrays
    use global_parameters
    
    implicit none
    f_num(0) = f_num(Nx-1)
    f_num(Nx) = f_num(1)
    s_num(0) = s_num(Nx-1)
    s_num(Nx) = s_num(1)
    p_num(0) = p_num(Nx-1)
    p_num(Nx) = p_num(1)
    
    end subroutine PERIODIC