
!====================================================
! This Module defines the arrays 
!
! allocatabe   --> asignes memory
! dimension(:) --> for one dimensional arrays
! dimension(:,:) --> for two dimensional arrays
! dimension(:,:,:) --> for three dimensional arrays    
!==================================================== 


module arrays 

implicit none

  real(kind=8), allocatable, dimension (:) :: x
  real(kind=8), allocatable, dimension (:) :: u_num
  real(kind=8), allocatable, dimension (:) :: u_num_p
  real(kind=8), allocatable, dimension (:) :: u_num_ant
  real(kind=8), allocatable, dimension (:) :: u_exc


end module arrays
