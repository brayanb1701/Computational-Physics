!esta subrotunia ejecuta y entrega la función integrada 

subroutine violinf

    use global_parameters
    use functions
    use arrays
    integer K 
    !print*, '=========================================='
    do j = 0, N 

            suma2 = 0.0d0

            do k = 1, Nx

                suma2  =suma2 + (XX(k)-XX(k-1))*(violinb(j,XX(k-1)) + violinb(j,XX(k)) )

            end do 
        !print*,'bvector',suma2
        b(j+1)  = (0.5d0)*suma2     


    end do

end subroutine violinf