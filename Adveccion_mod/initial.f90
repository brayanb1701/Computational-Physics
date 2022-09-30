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
u_num = amp * exp( - ( x - x0 )**2 / sigma**2 ) + 1e-20
u_exc = amp * exp( - ( x - x0 )**2 / sigma**2 ) + 1e-20
 

end subroutine initial 
