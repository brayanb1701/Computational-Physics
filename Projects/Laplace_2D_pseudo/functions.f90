module functions
    implicit none
    CONTAINS

! ----------------------------------------
! defining Chebychev Polynomials 

  Real (kind=8) FUNCTION cheby(m,r)

  implicit none

  integer  j,m
  real(kind=8)  r
  real(kind=8)  cheby0,cheby1,chebyn
  
  cheby0 = 1.0d0
  cheby1 = r 

  if(m.eq.0) then
    cheby = cheby0
  else if(m.eq.1) then 
    cheby = cheby1 
  else if(m.ge.2) then
    do j=2,m
       chebyn = 2.0d0*r*cheby1 - cheby0
       cheby0 = cheby1
       cheby1 = chebyn
    end do
       cheby = chebyn
  end if
 
 end FUNCTION cheby

! --------------------------------------
! defining firts Chebychev derivatives
 
 Real (kind=8) FUNCTION dcheby(m,r)

 implicit none
 
 integer j,m
 
 real(kind=8) r
 real(kind=8) dcheby0,dcheby1,dchebyn
 !real(kind=8) cheby  
 
 dcheby0 = 0.0d0
 dcheby1 = 1.0d0 
 
 if(m.eq.0) then
   dcheby = dcheby0
 else if(m.eq.1) then 
   dcheby = dcheby1 
 else if(m.ge.2) then
   do j=2,m
      dchebyn = 2.0*cheby(j-1,r) + 2.0*r*dcheby1 - dcheby0
      dcheby0 = dcheby1
      dcheby1 = dchebyn
   end do
      dcheby = dchebyn
 end if
 
 end FUNCTION dcheby
 

! --------------------------------------
! defining second Chebychev derivatives
 
 Real (kind=8) FUNCTION ddcheby(m,r)

 implicit none

 integer j,m

 real(kind=8) r
 real(kind=8) ddcheby0,ddcheby1,ddchebyn
 !real(kind=8) dcheby  

 ddcheby0 = 0.0d0
 ddcheby1 = 0.0d0 

 if(m.eq.0) then
   ddcheby = ddcheby0
 else if(m.eq.1) then 
   ddcheby = ddcheby1 
 else if(m.ge.2) then
   do j=2,m
      ddchebyn = 4.0*dcheby(j-1,r)+2.0*r*ddcheby1 - ddcheby0;
      ddcheby0 = ddcheby1
      ddcheby1 = ddchebyn
   end do
      ddcheby = ddchebyn
 end if

end FUNCTION ddcheby


! ======================

Real(kind=8) FUNCTION exact(r)

implicit none

REAL(kind=8) r

exact = (-3.0d0/(8.0d0*(exp(2.0d0) + exp(-2.0d0))))*(exp(2.0d0*r) &
      + exp(-2.0d0*r)) +(1.0d0/4.0d0)*r*r + (1.0d0/8.0d0)  

end FUNCTION exact


! ======================

Real(kind=8) FUNCTION f(m,n)

implicit none

REAL(kind=8) m
REAL(kind=8) n

if(ABS(m-0.5).le.0.000001 .and. ABS(n-0.5).le.0.000001 ) then
  f=1
else if (ABS(m+0.5).le.0.000001 .and. ABS(n+0.5).le.0.000001 ) then
  f=-1
else 
  f=0
end if

end FUNCTION f


! ===================================================================


end module functions