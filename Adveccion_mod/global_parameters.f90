!======================================================
! This Module defines the parameters 
! =====================================================

module global_parameters

implicit none 

!!$ Grid data

  real(kind=8) xmin 
  real(kind=8) xmax
  real(kind=8) dx
  real(kind=8) dt
  real(kind=8) t
  real(kind=8) courant

  integer Nx, Nt
  integer res_num
  integer every_1D
 
!!$ Wave data

  real(kind=8) amp
  real(kind=8) x0
  real(kind=8) sigma
  
  character(len=20) integrator

 

end module global_parameters
