FC=gfortran

FFLAGS = -O3 -g

LNK=gfortran

OBJS = main.o evolve.o memory.o ini_arrays.o grid.o save1Ddata.o initial.o UPWIND.o FTCS.o exact.o LAXFRIEDRICHS.o LAXWENDROFF.o LEAPFROG.o PERIODIC.o OUTGOING.o INGOING.o RKck.o int_lagrange.o
MODS = global_parameters.o arrays.o

$(OBJS):	$(MODS)

onditas:	$(OBJS) $(MODS)
		$(LNK) $(FFLAGS) -o xOUT $(OBJS) $(MODS) 
	@ mkdir -p output
	@ mv xOUT output

.PHONY:	clean
clean:
	-rm -f *.o *.mod output/xOUT output/*.x
%.o : %.f90
	$(FC) -c $(FFLAGS) $< -o $@