
subroutine calc_error


use global_parameters
use arrays
use functions
implicit none


!real(kind=8) cheby,ddcheby, dcheby, f
! Matrix de coeficientes
! i -> corresponde a los puntos de colocación
! l -> corresponde al orden del chebychev

nm1 = 0.0d0
nm2 = 0.0d0
do i=1,Nx
 nm1 = nm1 + 0.5D0*(abs(error(i-1)) + abs(error(i)))*dx
 nm2 = nm2 + 0.5D0*(error(i-1)**2 + error(i)**2)*dx
end do 

nm2 = sqrt(nm2)

print*,'nm2=',nm2  
print*,'nm1=',nm1  

end subroutine calc_error
