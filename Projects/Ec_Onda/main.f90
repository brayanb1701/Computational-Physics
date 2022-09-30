!!$ ---------------------------------------------------------------
!!$ Advecition_v1.0:
!!$
!!$ Authors : Fabio Duvan Lora Clavijo.
!!$           Anamaria Navarro.
!!$
!!$ Version : 1.0 (2/07/2015)
!!$
!!$ This program solves the Advection equation with numerical methods
!!$ ---------------------------------------------------------------

program main 

    use global_parameters
    
    implicit none
    
    integer N_points_xx
    integer Ntt
    integer every_1D_ini
    
    Namelist/Onditas_Input/ xmin, xmax, &
                         N_points_xx , res_num, &
                         Ntt , courant,  every_1D_ini, &
                         amp, x0, sigma, &
                         integrator, boundary
                                                  
    open(3, file='input.par', status='old')
    read(3, nml= Onditas_Input)
    close(3)
    
    Nx = 2**(res_num - 1)*N_points_xx
    Nt = 2**(res_num - 1)*Ntt
    every_1D = 2**(res_num - 1)*every_1D_ini
    
    print *
    print *, 'Señor iniciando programa Onditas'
    print *, '***************************************'
    print *, 'Parameters:'
    print *, 'res_num      = ', res_num
    print *, 'x_min        = ', xmin
    print *, 'x_max        = ', xmax
    print *, 'N_points_x   = ', Nx
    print *, 'Nt           = ', Nt
    print *, 'courant      = ', courant
    print *, 'every_1D     = ', every_1D
    print *, 'dx           =', dx
    print *, 'dt           =', dt
    print *, '***************************************'
    print *, 'Gaussian Data:'
    print *, 'amplitude    = ', amp
    print *, 'x0           = ', x0
    print *, 'sigma        = ', sigma
    print *, '***************************************'
    print *, 'Integration Method:', integrator
    print *, 'Boundary Condition:', boundary
    print *, '***************************************'
    print *
    
    print *, 'llamo EVOLVE'
    
    call evolve
    
    print *, '***************************************'
    print *, 'Program Advection 1D has finished'
    print *, '***************************************'
    
    
    
    end program main 
    