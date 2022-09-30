subroutine exact

use arrays
use global_parameters

implicit none

u_exc = amp * exp( - ( x - x0 - t)**2 / sigma**2 ) + 1e-20



end subroutine exact
