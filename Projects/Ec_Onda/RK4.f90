subroutine RK4

use arrays
use Global_parameters

implicit none

INTEGER :: j           !Spatial points
INTEGER :: i           !Index of RK4 coefficients
REAL(KIND=8) :: RHS    !For the Right-Hand-Side of the equation RK4

! Set in zero the coefficients of RK4
k = 0.0d0              !Coefficients for PI
m = 0.0d0              !Coefficients for PSI

! Save previus data
phi_num_p = phi_num
pi_num_p = pi_num
psi_num_p = psi_num

! Aplying RK4
do j=4, Nx-4                  !For each spacial point in domain computes the RK4 method.
    do i=1,4                  !Compute the 4 coefficients of RK4
        k(i) = RHS(i,j,'PSI')
        m(i) = RHS(i,j,'PI ')
    end do
    
    ! Compute final values
    pi_num(j) = pi_num_p(j) + (1.0/6.0)*(k(1)+2*k(2)+2*k(3)+k(4))
    psi_num(j) = psi_num_p(j) + (1.0/6.0)*(m(1)+2*m(2)+2*m(3)+m(4))
    phi_num(j) = phi_num_p(j) + dt*pi_num(j)
end do

! Aplying finite difference scheme.
do j=1,3                      !Compute values for the adjacent points to the boundary.
    ! Aply Finite Difference Scheme
    call FiniteDiff(j,'left ')    
    call FiniteDiff(Nx-j,'right')

    ! Compute final values
    phi_num(j) = phi_num_p(j) + dt*pi_num(j)
    phi_num(Nx-j) = phi_num_p(Nx-j) + dt*pi_num(Nx-j)
end do
end subroutine RK4

!**************************************************************
! Right-Hand-Side of the RK4
recursive function RHS(i,j,var) result(result)
    use arrays
    use Global_parameters

    implicit none

    REAL(KIND=8) :: result    !Cefficient of RK4 obtained.
    REAL(KIND=8) :: p1, p2    !Auxiliar variables for the recursive part of the code.
    INTEGER :: i              !Order of the RK4 coefficient
    INTEGER :: j              !Space position.
    CHARACTER(LEN=3) :: var   !For compute coefficients related to "PI " or "PSI"

    ! Set the zero coefficient as zero.
    if(i==0) then     
        result = 0      
    
    ! Compute coefficients related to "PI "
    else if(var=='PI ') then        
        p1 = RHS(i-1,j+1,'PSI')
        p2 = RHS(i-1,j-1,'PSI')

        if(i<=3) then
            result = 0.5d0*courant*(pi_num_p(j+1)-pi_num_p(j-1) + 0.5d0*(p1 - p2))
        else if(i==4) then
            result = 0.5d0*courant*(pi_num_p(j+1)-pi_num_p(j-1) + (p1 - p2))
        end if 
        
    !Compute coefficients related to "PSI"
    else if(var=='PSI') then        
        p1 = RHS(i-1,j+1,'PI ')
        p2 = RHS(i-1,j-1,'PI ')
        
        if(i<=3) then
            result = 0.5d0*courant*(psi_num_p(j+1)-psi_num_p(j-1) + 0.5d0*(p1 - p2))
        else if(i==4) then
            result = 0.5d0*courant*(psi_num_p(j+1)-psi_num_p(j-1) + (p1 - p2))
        end if 
        
    end if
    return
end function RHS

!**************************************************************
! Finite Difference Scheme (Forward Time Centered Space)

subroutine FiniteDiff(j,side)
    use arrays
    use Global_parameters
    implicit none

    INTEGER :: j               !Spatial point.
    CHARACTER(LEN=5) :: side   !Says if is the Left or Right boundary.

    !*************************************************************************************
    ! Boundary on the left
    if(side.eq."left ") then 
        pi_num(j) = pi_num_p(j) + 0.5d0*courant*(psi_num_p(j+1)-psi_num_p(j-1))
        psi_num(j) = psi_num_p(j) + 0.5d0*courant*(pi_num_p(j+1)-pi_num_p(j-1))

    !*************************************************************************************
    ! Boundary on the rigth
    else if(side.eq."right") then
        pi_num(j) = pi_num_p(j) + 0.5d0*courant*(psi_num_p(j+1)-psi_num_p(j-1))
        psi_num(j) = psi_num_p(j) + 0.5d0*courant*(pi_num_p(j+1)-pi_num_p(j-1))
    end if
end subroutine FiniteDiff