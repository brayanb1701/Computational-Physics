subroutine RKF

use arrays
use Global_parameters

implicit none

INTEGER :: j           !Spatial points
INTEGER :: i           !Index of RKF coefficients
REAL(KIND=8) :: RHSF    !For the Right-Hand-Side of the equation RKF

! Set in zero the coefficients of RK4
l = 0.0d0              !Coefficients for PI      
n = 0.0d0              !Coefficients for PSI 

! Save previus data
phi_num_p = phi_num
pi_num_p = pi_num
psi_num_p = psi_num

! Aplying RK4
do j=6, Nx-6                  !For each spacial point in domain computes the RKF method.
    do i=1,6                  !Compute the 6 coefficients of RKF
        l(i) = RHSF(i,j,'PSI')
        n(i) = RHSF(i,j,'PI ')
    end do
    
    ! Compute final values
    pi_num(j) = pi_num_p(j) + 16.0/135.0*l(1) + 6656.0/12825.0*l(3)&
        + 28561.0/56430.0*l(4) - 9.0/50.0*l(5) + 2.0/55.0*l(6)
    psi_num(j) = psi_num_p(j) + 16.0/135.0*n(1) + 6656.0/12825.0*n(3)&
        + 28561.0/56430.0*n(4) - 9.0/50.0*n(5) + 2.0/55.0*n(6)
    phi_num(j) = phi_num_p(j) + dt*pi_num(j)
end do

! Aplying finite difference scheme.
do j=1,5                      !Compute values for the adjacent points to the boundary.
    ! Aply Finite Difference Scheme
    call FiniteDiff(j,'left ')    
    call FiniteDiff(Nx-j,'right')

    ! Compute final values
    phi_num(j) = phi_num_p(j) + dt*pi_num(j)
    phi_num(Nx-j) = phi_num_p(Nx-j) + dt*pi_num(Nx-j)
end do
end subroutine RKF

!**************************************************************
! Right-Hand-Side of the RKF
recursive function RHSF(i,j,var) result(result)
    use arrays
    use Global_parameters

    implicit none

    REAL(KIND=8) :: result    !Cefficient of RKF obtained.
    REAL(KIND=8), DIMENSION(0:6) :: p1, p2      !Auxiliar variables for the recursive part of the code.
    INTEGER :: i              !Order of the RK4 coefficient
    INTEGER :: j              !Space position.
    INTEGER :: q              !Iteration variable.
    CHARACTER(LEN=3) :: var   !For compute coefficients related to "PI " or "PSI"

    p1 = 0.0d0
    p2 = 0.0d0

    ! Set the zero coefficient as zero.
    if(i==0) then     
        result = 0 
    ! Coefficients of PI 
    else if(var=='PI ') then
        if(i==1) then
            result = 0.5d0*courant*(pi_num_p(j+1)-pi_num_p(j-1))
        else
            do q=1,i-1
                p1(q) = RHSF(q,j+1,'PSI')
                p2(q) = RHSF(q,j-1,'PSI')
            end do
        end if
        result=0.5d0*courant*(pi_num_p(j+1)-pi_num_p(j-1))
        do q=1,i-1
            result = result + 0.5d0*courant*(C(i,q)*(p1(q) - p2(q)))
        end do
    !Coefficients of PSI
    else if(var=='PSI') then    
        if(i==1) then
            result = 0.5d0*courant*(psi_num_p(j+1)-psi_num_p(j-1))
        else
            do q=1,i-1
                p1(q) = RHSF(q,j+1,'PI ')
                p2(q) = RHSF(q,j-1,'PI ')
            end do
        end if
        result=0.5d0*courant*(psi_num_p(j+1)-psi_num_p(j-1))
        do q=1,i-1
            result = result + 0.5d0*courant*(C(i,q)*(p1(q) - p2(q)))
        end do
    end if
    return
end function RHSF