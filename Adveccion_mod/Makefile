FC=gfortran

FFLAGS = -O3 -g

LNK=gfortran

OBJS = main.o evolve.o memory.o ini_arrays.o grid.o save1Ddata.o initial.o UPWIND.o FTCS.o exact.o LAXFRIEDRICHS.o LAXWENDROFF.o LEAPFROG.o
MODS = global_parameters.o arrays.o

$(OBJS):	$(MODS)

advection:	$(OBJS) $(MODS)
		$(LNK) $(FFLAGS) -o xOUT $(OBJS) $(MODS) 
	@ mkdir -p output
	@ mv xOUT output

.PHONY:	clean
clean:
	-rm -f *.o *.mod output/xOUT output/*.x
%.o : %.f90
	$(FC) -c $(FFLAGS) $< -o $@
