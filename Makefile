IDIR =./
CC=gcc
CFLAGS=-Wall -I .

ODIR=.

LIBS=-lm

_DEPS_LIB_MATH = myMath.h
DEPS_LIB_MATH = $(patsubst %,$(IDIR)/%,$(_DEPS_LIB_MATH))

_OBJ_LIB_MATH = power.o basicMath.o
OBJ_LIB_MATH = $(patsubst %,$(ODIR)/%,$(_OBJ_LIB_MATH))

TARGET_MATH_LIB = libmyMath
TARGET_LOWER_MATH_LIB = mymath
TARGET_MAIN = main

# Generic target for objects
$(ODIR)/%.o: %.c $(DEPS_LIB_MATH)
	$(CC) -fpic -c -o $@ $< $(CFLAGS)

# Generic target for shared libraries
$(ODIR)/%.so: $(OBJ_LIB_MATH)
	$(CC) -shared -o $@ $^ $(CFLAGS)

# Generic target for static libraries
$(ODIR)/%.a: $(OBJ_LIB_MATH)
	ar rcs $@ $^


# Dynamic libmyMath target
$(TARGET_LOWER_MATH_LIB)d: $(TARGET_MATH_LIB).so

# Static libmyMath target
$(TARGET_LOWER_MATH_LIB)s: $(TARGET_MATH_LIB).a

# Dynamic maind target
$(TARGET_MAIN)d: $(TARGET_MAIN).o $(TARGET_MATH_LIB).so
	$(CC) -o $@ $^ $(CFLAGS)

# Static mains target
$(TARGET_MAIN)s: $(TARGET_MAIN).o $(TARGET_MATH_LIB).a
	$(CC) -o $@ $^ $(CFLAGS)

.PHONY: clean

clean:
	rm -f $(ODIR)/maind $(ODIR)/mains $(ODIR)/*.o $(ODIR)/*.so $(ODIR)/*.a *~ $(INCDIR)/*~