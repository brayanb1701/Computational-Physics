subroutine exact

    use arrays
    use global_parameters
    
    implicit none
    
    f_exc = amp*0.5D0 * exp( - ( x - x0 - t)**2 / sigma**2 ) + amp*0.5D0 * exp (-(x - x0 + t)**2/sigma**2) + 1e-20
    
    
    
end subroutine exact
    