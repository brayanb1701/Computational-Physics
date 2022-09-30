
subroutine SaveData1D


use global_parameters
use arrays
use functions

implicit none

! Salvando la solución

dx = (xmax - xmin)/dble(Nx)

do i=0,Nx
   XX(i) = xmin + dble(i)*dx
end do

open(1,file='Solution.dat') 
!      write(1,*) 'x      ','suma      ','exact       '
do i=0,Nx 
   suma = 0.0d0 
   do l=0,N
      if (l.le.int((N+1)*0.5)) then
         suma = suma + aa(l)*cheby(l,XX(i)) 
      else
         suma = suma + aa(l)*cheby(l-int((N+1)*0.5),XX(i)) 
      end if 
      
   end do
   error(i) = abs(exact(XX(i)) - suma)
   write(1,*) XX(i),suma,exact(XX(i)),error(i)
end do
close(1)


end subroutine SaveData1D
