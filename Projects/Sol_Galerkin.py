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
    c = -4*np.exp(1.0)/(1+np.exp(2.0))

    return np.exp(r) - np.sinh(1.0)/np.sinh(2.0) *np.exp(2.0*r) + c/4

    


#! ======================

def f(r):
    c = (-4*np.exp(1.0))/(1+np.exp(2.0))

    return np.exp(r) + c



def phi(m,r):
    if (m % 2 == 0):
        phi = cheby(m+2,r) - cheby(0,r)

    else:
        phi = cheby(m+2,r) - cheby(1,r)
    return phi

def dphi(m,r):
    if (m % 2 == 0):
        dphi = dcheby(m+2,r) - dcheby(0,r)

    else:
        dphi = dcheby(m+2,r) - dcheby(1,r)
    return dphi

def ddphi(m,r):
    if (m % 2 == 0):
        ddphi = ddcheby(m+2,r) - ddcheby(0,r)

    else:
        ddphi = ddcheby(m+2,r) - ddcheby(1,r)
    return ddphi

def violina(i,j,r):
    return (ddphi(j,r)*phi(i,r)) - (4*dphi(j,r)*phi(i,r)) + (4*phi(j,r)*phi(i,r))

def violinb(j,r):
    return phi(j,r)*f(r)


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

    N=10
    Nx=100
    xmin=-1.
    xmax=1.
    dx=0.

    print('Grade of polynomial (Approximation)'+str(N))
    print('Number of grid points '+str(Nx))

    A=np.zeros((N+1,N+1))
    x=np.zeros(N+1)
    b=np.zeros(N+1)
    indx=np.zeros(N+1)
    aa=np.zeros(N+1)
    XX=np.zeros(Nx+1)
    sol=np.zeros(Nx+1)
    error=np.zeros(Nx+1)

    dx = (xmax - xmin)/Nx

    for i in range(0,Nx+1):
        XX[i] = xmin + i*dx
        
    for j in range(N+1): 
        for i in range(N): 
            suma2 = 0.0
            for k in range(1, Nx+1):
                suma2  =suma2 + (XX[k]-XX[k-1])*(violina(j,i,XX[k-1]) + violina(j,i,XX[k]))
        A[j,i] = (0.5)*suma2     

    for j in range(N+1): 
        suma2 = 0.0
        for k in range(1, Nx+1):
            suma2  =suma2 + (XX[k]-XX[k-1])*(violinb(j,XX[k-1]) + violinb(j,XX[k]) )
        b[j] = (0.5)*suma2     
                

    #SIGUE LU
    #P, L, U = la.lu(A)
    lu, piv = la.lu_factor(A)

    aa = la.lu_solve((lu, piv), b)

    ###Guardar solucion y plot
    #dx = (xmax - xmin)/(Nx)

    #for i in range(Nx+1):
    #    XX[i] = xmin + i*dx

    #open(1,file='Solution.dat') 
    #!      write(1,*) 'x      ','suma      ','exact       '
    for i in range(Nx+1): 
        suma = 0.0
        for l in range(N+1):
            suma = suma + aa[l]*phi(l,XX[i]) 
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
