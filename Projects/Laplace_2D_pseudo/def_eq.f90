
subroutine def_eq


use global_parameters
use arrays
use functions
implicit none


!real(kind=8) cheby,ddcheby, dcheby, f
! Matrix de coeficientes
! i -> corresponde a los puntos de colocación
! l -> corresponde al orden del chebychev

print*, '=========================================='

do i=0,N
   do l=0,N
      if (i.eq.0.or.i.eq.N) then
         if (l.le.int((N-1)*0.5)) then
            !print*,'l',l 
            A(i+1,l+1) = cheby(l,x(i))
         else
            A(i+1,l+1) = cheby(l-int((N+1)*0.5),x(i))
            !print*,'l',l-int((N+1)*0.5)
         end if 
      else 
         if (l.le.int((N-1)*0.5)) then
            A(i+1,l+1) = ddcheby(l,x(i))
            !print*,'l',l
         else
            A(i+1,l+1) = ddcheby(l-int((N+1)*0.5),x(i))
            !print*,'l',l-int((N+1)*0.5)
         end if 
         
      end if 
      !print*,'A(',i+1,',',l+1,')',A(i+1,l+1) 
   end do
end do 

! :::::::::::::::::::::::::::::::::::::::::::::::::::::

! Aqui vamos a definir el vector b -> fuentes de la ecuación

print*, '=========================================='

 do i=0,N
    if (i.eq.0.or.i.eq.N) then
      b(i+1) = 0.0d0
    else 
      b(i+1) = f(x(i),x(i))
    end if
    print*,'b(',i+1,')',b(i+1) 
 end do




 !do i=0,N
!   do l=0,N
!      if (i.eq.0.or.i.eq.N.or.i.eq.int((N-1)*0.5).or.i.eq.int((N+1)*0.5)) then
!         A(i+1,l+1) = cheby(l,x(i))
!      else 
!         A(i+1,l+1) = ddcheby(l,x(i))
!      end if 
!   end do
!end do 

! :::::::::::::::::::::::::::::::::::::::::::::::::::::

! Aqui vamos a definir el vector b -> fuentes de la ecuación

! do i=0,N
!   if (i.eq.0.or.i.eq.N.or.i.eq.int((N-1)*0.5).or.i.eq.int((N+1)*0.5)) then
!      b(i+1) = 0.0d0
!    else 
!      b(i+1) = f(x(i),x(i))
!    end if
! end do

! :::::::::::::::::::::::::::::::::::::::::::::::::::::::


end subroutine def_eq
