!====================================================
! This subroutine gives memory to the arrays
!==================================================== 

subroutine memory

use arrays
use global_parameters

implicit none

allocate(x(0:Nx))
allocate(u_num(0:Nx))
allocate(u_exc(0:Nx))  
allocate(u_num_p(0:Nx))
allocate(u_num_ant(0:Nx))


end subroutine memory
