subroutine OUTGOING

    use arrays
    use global_parameters
    
    implicit none
    p_num(0)=2.0d0*p_num(1) - p_num(2)
    s_num(0)=2.0d0*s_num(1) - s_num(2)
    L0=0.5d0*(p_num(0)+s_num(0))
    p_num(0)=L0
    s_num(0)=L0
    
    p_num(Nx)=2.0d0*p_num(Nx-1) - p_num(Nx-2)
    s_num(Nx)=2.0d0*s_num(Nx-1) - s_num(Nx-2)
    RNx=0.5d0*(p_num(Nx)-s_num(Nx))
    p_num(Nx)=RNx
    s_num(Nx)=-RNx
    end subroutine OUTGOING