!===================================================
! This is the subroutine of the method Runge-Kutta
!Cash - Karp
!===================================================
subroutine RUNGEKUTTACK

  use arrays
  use global_parameters
  
  implicit none
  
  integer i
  
  integer k
  
  integer b
  
  real(kind=8) :: suma_pi_1 = 0.0d0
  real(kind=8) :: suma_s_1 = 0.0d0
  real(kind=8) :: suma_phi_1 = 0.0d0
  
  real(kind=8) :: suma_pi_2 = 0.0d0
  real(kind=8) :: suma_s_2 = 0.0d0
  real(kind=8) :: suma_phi_2 = 0.0d0
  
  REAL(kind=8), DIMENSION (1:6) :: c = (/ 0., 1./5., 3./10., 3./5., 1., 7./8./)
  REAL(kind=8), DIMENSION (1:6) :: b_1 = (/ 37./378., 0., 250./621., 125./594., 0., 512./1771./)
  REAL(kind=8), DIMENSION (1:6) :: b_2 = (/ 2825./27648., 0., 18575./48384., 13525./55296., 277./14336., 1./4./)
  REAL(kind=8), DIMENSION (1:6) :: K_pi = (/ 0., 0., 0., 0., 0., 0./) 
  REAL(kind=8), DIMENSION (1:6) :: K_s = (/ 0., 0., 0., 0., 0., 0./) 
  REAL(kind=8), DIMENSION (1:6) :: K_phi = (/ 0., 0., 0., 0., 0., 0./) 
  
  
    !!$ Variable Recycling
    p_num_p = p_num
    s_num_p = s_num
    f_num_p = f_num
  
    do i = 1, Nx-1
  
      do k=1, 6
  
        K_pi(k) = (0.5d0/dx)*(s_num_p(i+1)-s_num_p(i-1)+c(k)*0.5d0*(dt/dx)*(p_num_p(i+2)-2*p_num_p(i)+p_num_p(i-2)))
  
        K_s(k) = (0.5d0/dx)*(p_num_p(i+1)-p_num_p(i-1)+c(k)*0.5d0*(dt/dx)*(s_num_p(i+2)-2*s_num_p(i)+s_num_p(i-2)))
  
        K_phi(k) = p_num_p(i)+c(k)*0.5d0*(dt/dx)*(s_num_p(i+1)-s_num_p(i-1))
  
      end do
  
      p_num(i) = p_num_p(i) + dt*(b_1(1)*K_pi(1)+b_1(2)*K_pi(2)+b_1(3)*K_pi(3)+b_1(4)*K_pi(4)+b_1(5)*K_pi(5)+b_1(6)*K_pi(6))
      s_num(i) = s_num_p(i) + dt*(b_1(1)*K_s(1)+b_1(2)*K_s(2)+b_1(3)*K_s(3)+b_1(4)*K_s(4)+b_1(5)*K_s(5)+b_1(6)*K_s(6))
  
      f_num(i) = f_num_p(i)+dt*p_num(i)
  
    end do
  
  end subroutine RUNGEKUTTACK