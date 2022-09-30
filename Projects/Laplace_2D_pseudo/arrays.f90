module arrays
implicit none 

 
  REAL(kind=8), ALLOCATABLE, DIMENSION(:,:) :: A  ! matriz
  REAL(kind=8), ALLOCATABLE, DIMENSION(:) :: x    ! puntos de colocación
  REAL(kind=8), ALLOCATABLE, DIMENSION(:) :: b    ! vector fuente 
  REAL(kind=8), ALLOCATABLE, DIMENSION(:) :: aa   ! vector solucion, coeficientes de la expansión
  integer, ALLOCATABLE, DIMENSION(:) :: indx
  REAL(kind=8), ALLOCATABLE, DIMENSION(:) :: XX
  REAL(kind=8), ALLOCATABLE, DIMENSION(:) :: error
  
end  module arrays
