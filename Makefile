# Copyright (C) 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002,      
# 2003, 2004, 2005, 2006, 2007, 2008, 2009  Free Software Foundation,      
# Inc. This Makefile is free software; the Free Software Foundation        
# gives unlimited permission to copy and/or distribute it,                 
# with or without modifications, as long as this notice is preserved.      

# This program is distributed in the hope that it will be useful,          
# but WITHOUT ANY WARRANTY, to the extent permitted by law; without        
# even the implied warranty of MERCHANTABILITY or FITNESS FOR A            
# PARTICULAR PURPOSE.                         

CC=oshcc
CXX=oshcc
CFLAGS=-O3

SHMEM_INC_PATH =
INCDIR=-Iinclude $(SHMEM_INC_PATH)

SHMEMLDFLAG =
LDFLAGS=$(CFLAGS) -lm  -ldl $(SHMEMLDFLAG)

TARGET=ra_shmem
OBJECTS=RandomAccess.o SHMEMRandomAccess.o verification.o

.SUFFIXES: .c

.c.o:
	$(CC) $(INCDIR) $(CFLAGS) -c $<

all:  RASHMEM

RASHMEM: $(OBJECTS) 
	$(CC) $(INCDIR) $(CFLAGS) $(OBJECTS) -o $(TARGET) $(LDFLAGS)

clean:
	/bin/rm -f $(OBJECTS) core ra_shmem hpccoutf.txt

cleanall: 
	/bin/rm -f $(OBJECTS) $(TARGET) core

