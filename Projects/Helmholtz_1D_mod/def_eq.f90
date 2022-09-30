
subroutine def_eq


use global_parameters
use arrays
use functions
implicit none


!real(kind=8) cheby,ddcheby, dcheby, f
! Matrix de coeficientes
! i -> corresponde a los puntos de colocación
! l -> corresponde al orden del chebychev

do i=0,N
   do l=0,N
      if (i.eq.0.or.i.eq.N) then
         A(i+1,l+1) = cheby(l,x(i))
      else 
         A(i+1,l+1) = -ddcheby(l,x(i)) + lambda*cheby(l,x(i))
      end if 
   end do
end do 

! :::::::::::::::::::::::::::::::::::::::::::::::::::::

! Aqui vamos a definir el vector b -> fuentes de la ecuación

 do i=0,N
    if (i.eq.0.or.i.eq.N) then
      b(i+1) = 0.0d0
    else 
      b(i+1) = f(x(i))
    end if
 end do

! :::::::::::::::::::::::::::::::::::::::::::::::::::::::


end subroutine def_eq
