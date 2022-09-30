subroutine INGOING

    use arrays
    use global_parameters
    
    implicit none
    
    real(kind=8) int_lagrange
    real(kind=8) :: R0, LNx
    
    !R0=int_lagrange(0.5d0*(p_num-s_num),0,5)
    !LNx=int_lagrange(0.5d0*(p_num+s_num),Nx,5)
    !p_num(0)=R0
    !s_num(0)=-R0
    !p_num(Nx)=LNx
    !s_num(Nx)=LNx
    !p_num(Nx) = p_num_p(Nx) +0.5*courant*(s_num_p(Nx-2)-4*s_num_p(Nx-1)&
                                              !+3*s_num_p(Nx))
    !p_num(0) = p_num_p(0) +0.5*courant*(4*s_num_p(1)-s_num_p(2)&
                                              !-3*s_num_p(0))
    
    !f_num(0)=2.0d0*f_num_p(0)-f_num_ant(0)+2*courant**2*(f_num_p(1)-f_num_p(0))
    !f_num(Nx)=2.0d0*f_num_p(Nx)-f_num_ant(Nx)+2*courant**2*(f_num_p(Nx-1)-f_num_p(Nx))
    
    
    s_num(Nx) = s_num_p(Nx) +0.5*courant*(p_num_p(Nx-2)-4*p_num_p(Nx-1)&
    +3*p_num_p(Nx))
    s_num(0) = s_num_p(0) +0.5*courant*(4*p_num_p(1)-p_num_p(2)&
    -3*p_num_p(0))       
    end subroutine INGOING