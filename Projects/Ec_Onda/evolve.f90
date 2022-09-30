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
  call save1Ddata(Nx,t,x,f_exc,'f_exc',0)
  call save1Ddata(Nx,t,x,f_num,'f_num',0)
  call save1Ddata(Nx,t,x,s_num,'s_num',0)
  call save1Ddata(Nx,t,x,p_num,'p_num',0)
  
  ! =============== Start Evolution
  print *, 'Si señor, empiezo la evolucion'
  
  p_num_ant = p_num
  s_num_ant = s_num
  f_num_ant = f_num
  
  
  do l=1, Nt
  t = t + dt 
  
  !f_num_ant = f_num
  !s_num_ant = s_num
  !p_num_ant = p_num
  
  
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
  else if (integrator.eq.'RUNGEKUTTACK') then
    call RUNGEKUTTACK 
  end if
  
  p_num_ant = p_num_p
  s_num_ant = s_num_p
  f_num_ant = f_num_p
  
  if (boundary.eq.'PERIODIC') then
    call PERIODIC 
  else if (boundary.eq.'OUTGOING') then
    call OUTGOING
  else if (boundary.eq.'INGOING') then
    call INGOING 
  end if
  
  
  call exact
  
  call save1Ddata(Nx,t,x,f_exc,'f_exc',1)
  call save1Ddata(Nx,t,x,f_num,'f_num',1)
  call save1Ddata(Nx,t,x,s_num,'s_num',1)
  call save1Ddata(Nx,t,x,p_num,'p_num',1)
  
  end do
  
  print *, 'Salgo de EVOLVE'
  end subroutine evolve
  
