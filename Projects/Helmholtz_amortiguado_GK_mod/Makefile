FC=gfortran

FFLAGS = -O3 -g

LNK=gfortran

OBJS = Helmholtz.o coloc_points.o  def_eq.o SaveData1D.o memory.o calc_error.o violin.o violinf.o
MODS = global_parameters.o arrays.o lu.o functions.o

#cheby.o dcheby.o ddcheby.o exact.o  f.o 

$(OBJS):	$(MODS)

compile:	$(OBJS) $(MODS)
		$(LNK) $(FFLAGS) -o xOUT $(OBJS) $(MODS) 
	@ mkdir -p output
	@ mv xOUT output

.PHONY:	clean
clean:
	-rm -f *.o *.mod output/xOUT output/*.x
%.o : %.f90
	$(FC) -c $(FFLAGS) $< -o $@
