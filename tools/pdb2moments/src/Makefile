#
EXT=
NAME1=pdb2moments

DIR=../bin
NAMEFUL1=$(DIR)/$(NAME1)$(EXT)

FC = gfortran
FFLAGS = -c -O -fimplicit-none

LDFLAGS = -O

.f.o :
	$(FC) $(FFLAGS) $<

OBJECTS1 = \
$(NAME1).o crd_handler.o moment_handler.o

$(NAME1) : $(OBJECTS1)
	$(FC) -o $(NAMEFUL1) $(LDFLAGS) $(OBJECTS1)
clean:
	touch junk.o; rm -f *.o $(NAMEFUL1) 

$(OBJECTS1) : param.h
