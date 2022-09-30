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

u_num=0.0d0
u_num_p=0.0d0
u_num_ant=0.0d0
u_exc=0.0d0


end subroutine ini_arrays
