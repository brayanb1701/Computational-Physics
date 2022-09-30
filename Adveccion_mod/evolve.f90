
!======================================================
! This Subroutine does the evolution in time of the system
! ===================================================== 


subroutine evolve

use global_parameters
use arrays

implicit none

integer l 

print *, 'Entro a EVOLVE'

! =============== Call subroutines
print *, 'llamo a memory'
call memory 
print *, 'llamo a ini_arrays'
call ini_arrays
print *, 'llamo a grid'
call grid
print *, 'llamo a initial'
call initial
print *, 'llamo a exact'
call exact


! =============== Save Initial Data
print *, 'llamo Save1Ddata inicial'
call save1Ddata(Nx,t,x,u_exc,'u_exc',0)
call save1Ddata(Nx,t,x,u_num,'u_num',0)


! =============== Start Evolution
print *, 'Empiezo la evolucion'

u_num_ant = u_num

do l=1, Nt
t = t + dt 

! =============== Choose Integration Method
if (integrator.eq.'UPWIND') then
  call UPWIND 
else if (integrator.eq.'FTCS') then
  call FTCS 
else if (integrator.eq.'LAXFRIEDRICHS') then
  call LAXFRIEDRICHS 
else if (integrator.eq.'LAXWENDROFF') then
  call LAXWENDROFF 
else if (integrator.eq.'LEAPFROG') then
  call LEAPFROG 
end if

u_num(0) = u_num(Nx-1)
u_num(Nx) = u_num(1)

call exact

call save1Ddata(Nx,t,x,u_exc,'u_exc',1)
call save1Ddata(Nx,t,x,u_num,'u_num',1)

end do

print *, 'Salgo de EVOLVE'
end subroutine evolve
