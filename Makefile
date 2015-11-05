#
#
# OpenSHMEM version:
#
# Copyright (c) 2011 - 2015
#   University of Houston System and UT-Battelle, LLC.
#
#

#
# OpenSHMEM compiler commandss
#
CC             = oshcc
CXX            = oshcxx
LD             = $(CC)

CFLAGS         = -O3

#
# any extra paths/flags needed
#
SHMEM_INC_PATH =
SHMEM_LDFLAGS  =

CPPFLAGS       = -I./include $(SHMEM_INC_PATH)
LDFLAGS        = $(CFLAGS) $(SHMEM_LDFLAGS)
LIBS           = -lm

TARGET         = gups

SOURCES        = RandomAccess.c SHMEMRandomAccess.c verification.c
OBJECTS        = $(SOURCES:.c=.o) 

.PHONY:	all	clean

#
# make starts here
#

all:  $(TARGET)

$(TARGET): $(OBJECTS) 
	$(LD) $(LDFLAGS) $^ -o $@ $(LIBS)

clean:
	rm -f $(OBJECTS) $(TARGET)


#
# object/header deps
#

SHMEMRandomAccess.o:	RandomAccess.h
verification.o:		RandomAccess.h
