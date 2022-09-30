import numpy as np
import scipy.linalg as la
import matplotlib.pyplot as plt


def cheby(m,r):

    cheby0 = 1.0
    cheby1 = r 

    if(m==0):
        cheby = cheby0
    elif(m==1): 
        cheby = cheby1 
    elif(m>=2):
        for j in range(2,m+1):
            chebyn = 2.0*r*cheby1 - cheby0
            cheby0 = cheby1
            cheby1 = chebyn
        cheby = chebyn
    return cheby

# --------------------------------------
# defining firts Chebychev derivatives
 
def dcheby(m,r):
 
    dcheby0 = 0.0
    dcheby1 = 1.0
    
    if(m==0):
        dcheby = dcheby0
    elif(m==1):
        dcheby = dcheby1 
    elif(m>=2):
        for j in range(2,m+1):
            dchebyn = 2.0*cheby(j-1,r) + 2.0*r*dcheby1 - dcheby0
            dcheby0 = dcheby1
            dcheby1 = dchebyn
        dcheby = dchebyn
    return dcheby

# --------------------------------------
# defining second Chebychev derivatives
 
def ddcheby(m,r):

    ddcheby0 = 0.0
    ddcheby1 = 0.0

    if(m==0):
        ddcheby = ddcheby0
    elif(m==1):
        ddcheby = ddcheby1 
    elif(m>=2):
        for j in range(2,m+1):
            ddchebyn = 4.0*dcheby(j-1,r)+2.0*r*ddcheby1 - ddcheby0;
            ddcheby0 = ddcheby1
            ddcheby1 = ddchebyn
        ddcheby = ddchebyn
    return ddcheby

#! ======================

def exact(r):


    exact = (-3.0/(8.0*(np.exp(2.0) + np.exp(-2.0))))*(np.exp(2.0*r)\
        + np.exp(-2.0*r)) +(1.0/4.0)*r*r + (1.0/8.0)  
    return exact


#! ======================

def f(r):

    return r*r  



def calc_error(error: np.array,Nx: float,dx: float):
    nm1 = 0.0
    nm2 = 0.0
    for i in range(1,Nx+1):
        nm1 = nm1 + 0.5*(abs(error[i-1]) + abs(error[i]))*dx
        nm2 = nm2 + 0.5*(error[i-1]**2 + error[i]**2)*dx


    nm2 = np.sqrt(nm2)

    print('nm2='+str(nm2))  
    print('nm1='+str(nm1))  

    return nm1,nm2

def main():

    N=16
    Nx=100000
    lambda0=4
    xmin=-1.
    xmax=1.
    dx=0.

    print('Number of colocation points '+str(N))
    print('Number of grid points '+str(Nx))
    print('lambda = '+str(lambda0))

    A=np.zeros((N+1,N+1))
    x=np.zeros(N+1)
    b=np.zeros(N+1)
    indx=np.zeros(N+1)
    aa=np.zeros(N+1)
    XX=np.zeros(Nx+1)
    sol=np.zeros(Nx+1)
    error=np.zeros(Nx+1)

    for i in range(0,N+1):
        x[i] = np.cos(np.pi*i/N)


    for i in range(N+1):
        for l in range(N+1):
                if (i==0 or i==N):
                    A[i,l] = cheby(l,x[i])
                else: 
                    A[i,l] = -ddcheby(l,x[i]) + lambda0*cheby(l,x[i])
                


    
    # Aqui vamos a definir el vector b -> fuentes de la ecuación

    for i in range(N+1):
        if (i==0 or i==N):
            b[i] = 0.0
        else:
            b[i] = f(x[i])

    #SIGUE LU
    #P, L, U = la.lu(A)
    lu, piv = la.lu_factor(A)

    aa = la.lu_solve((lu, piv), b)

    ###Guardar solucion y plot
    dx = (xmax - xmin)/(Nx)

    for i in range(Nx+1):
        XX[i] = xmin + i*dx

    #open(1,file='Solution.dat') 
    #!      write(1,*) 'x      ','suma      ','exact       '
    for i in range(Nx+1): 
        suma = 0.0
        for l in range(N+1):
            suma = suma + aa[l]*cheby(l,XX[i]) 
        error[i] = abs(exact(XX[i]) - suma)
        sol[i] = suma
        #write(1,*) XX(i),suma,exact(XX(i)),error(i)
    
    #Error
    nm1,nm2=calc_error(error,Nx,dx)

    plt.plot(XX,sol, label='numérica')
    plt.plot(XX,exact(XX), label='Exacta')
    plt.legend(loc='lower center')
    plt.show()

if __name__ == "__main__":
    main()
