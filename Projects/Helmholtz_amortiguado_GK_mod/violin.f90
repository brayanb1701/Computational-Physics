!esta subrotunia ejecuta y entrega la función integrada 

subroutine violin

    use global_parameters
    use functions
    use arrays
    integer K 
    !print*, '=========================================='
    do j = 0, N 
        do i = 0, N 

            suma2 = 0.0d0

            do k = 1, Nx

                suma2  =suma2 + (XX(k)-XX(k-1))*(violina(j,i,XX(k-1)) + violina(j,i,XX(k)) )

            end do 
        !print*,'A(',j,',',i,')',suma2
        A(j+1,i+1) = (0.5d0)*suma2     

        end do

    end do

end subroutine violin