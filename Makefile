# Copyright (C) 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002,      
# 2003, 2004, 2005, 2006, 2007, 2008, 2009  Free Software Foundation,      
# Inc. This Makefile is free software; the Free Software Foundation        
# gives unlimited permission to copy and/or distribute it,                 
# with or without modifications, as long as this notice is preserved.      

# This program is distributed in the hope that it will be useful,          
# but WITHOUT ANY WARRANTY, to the extent permitted by law; without        
# even the implied warranty of MERCHANTABILITY or FITNESS FOR A            
# PARTICULAR PURPOSE.                         

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
