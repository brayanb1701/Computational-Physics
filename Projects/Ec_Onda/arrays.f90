
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
    real(kind=8), allocatable, dimension (:) :: f_num
    real(kind=8), allocatable, dimension (:) :: f_num_p
    real(kind=8), allocatable, dimension (:) :: f_num_ant
    real(kind=8), allocatable, dimension (:) :: f_exc
    real(kind=8), allocatable, dimension (:) :: s_num
    real(kind=8), allocatable, dimension (:) :: s_num_p
    real(kind=8), allocatable, dimension (:) :: s_num_ant
    real(kind=8), allocatable, dimension (:) :: p_num
    real(kind=8), allocatable, dimension (:) :: p_num_p
    real(kind=8), allocatable, dimension (:) :: p_num_ant
  
  
  
  end module arrays