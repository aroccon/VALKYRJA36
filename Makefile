# Compiler
FC = nvfortran

# Compiler flags
FFLAGS = -fast -gpu=managed -cuda -acc -cudalib -Mfree -Mpreprocess -mcmodel=medium
#FFLAGS = -fast -gpu=managed -acc -cudalib 

# Executable name
EXEC = nemesi36

# Source files
SRCS = main.f90

# Libraries
LIBS    = -L/usr/local/cuda/lib64 -lcufft

# Object files
OBJS = $(SRCS:.f90=.o)

# Rule to compile .f90 files to .o files
%.o: %.f90
	$(FC) $(FFLAGS) $(LIBS)  -c $<

# Rule to link object files into executable
$(EXEC): $(OBJS)
	$(FC) $(FFLAGS) -o $@ $^

# Clean rule
clean:
	rm -f $(OBJS) $(EXEC)
