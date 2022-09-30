 
!**********************************************************************!         
!   F.D.Lora-Clavijo UIS                                               ! 
!                                                                      !  
!   THIS PROGRAM SOLVE Helmholtz EQUATION  -y''(x)+lamda*y(x)=f(x)     ! 
!   WITH BOUNDARY CONDITIONS y(1)=y(-1)=0 USING THE                    ! 
!   SPECTRAL COLOCATION METHOD with THE CHEBYSHEV POLYNOMIALS          ! 
!                                                                      !
!   This equation describes mass transfer processes                    !
!   with volume chemical reactions of the first order, lambda > 0      !
!                                                                      !
!**********************************************************************!

  program Helmholtz
  use global_parameters
  use arrays
  use LU
  use functions

  implicit none 

  pii = 4.0d0*ATAN(1.0d0)

  print *, 'Number of colocation points'
  read(*,*) N
  print *
  
  print *, 'Number of grid points'
  read(*,*) Nx
  print *

  print *, 'lambda = 4.0 default'
  read(*,*) lambda
  print * 

  call memory

  call coloc_points
  call def_eq
!  print*, '=========================================='
!  print*,'bvector',b(:)
!  print*, '=========================================='
!  print*,'A1l',A(1,:)
!  print*,'A2l',A(2,:) 
!  print*,'A3l',A(3,:)
!  print*,'A4l',A(4,:)
!  print*,'A5l',A(5,:) 
!  print*, '=========================================='
  
! ::::::::::::::::::::::::::::::::::::::::::::::::::::::::

! Descomposición LU
  
  call LUDCMP(A,N+1,INDX,D,CODE)
  call LUBKSB(A,N+1,INDX,B)

!  print*, 'b',b(:)
  
! Después de la inversión de la matriz utilizando la descomposición LU
! el vector b que era de fuentes ahora es el vector solución

  do l=0,N
     aa(l)=b(l+1)
  end do

!  print*, 'aa', aa(:)   

! Aquí para no confundir asociamos el vector b solución a un vector aa(i) que son 
! los coeficientes de la expasión de la solución y = suma an Tn(x)

  call SaveData1D
  call calc_error
! ::::::::::::::::::::::::::::::::::::::

  end program Helmholtz
