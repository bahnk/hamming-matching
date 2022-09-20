
CC=g++
INC=-I include
LIBS=-lOpenCL
STD=-std=c++11
#FLAGS=-W -Wall -g
FLAGS=-g -w
#OPENCL=-I opencl/include -L opencl/lib
OPENCL=-I /usr/include -L /usr/lib/x86_64-linux-gnu

all: bin/hamming

obj/utils.o:
	$(CC) $(INC) $(LIBS) $(STD) $(OPENCL) $(FLAGS) \
		-c \
		-o obj/utils.o \
		lib/utils.c

obj/opencl_kernel.o:
	$(CC) $(INC) $(LIBS) $(STD) $(OPENCL) $(FLAGS) \
		-c \
		-o obj/opencl_kernel.o \
		lib/opencl_kernel.c

obj/opencl_program.o:
	$(CC) $(INC) $(LIBS) $(STD) $(OPENCL) $(FLAGS) \
		-c \
		-o obj/opencl_program.o \
		lib/opencl_program.c

obj/opencl_buffer.o:
	$(CC) $(INC) $(LIBS) $(STD) $(OPENCL) $(FLAGS) \
		-c \
		-o obj/opencl_buffer.o \
		lib/opencl_buffer.c

obj/opencl.o:
	$(CC) $(INC) $(LIBS) $(STD) $(OPENCL) $(FLAGS) \
		-c \
		-o obj/opencl.o \
		lib/opencl.c

obj/methods.o:
	$(CC) $(INC) $(LIBS) $(STD) $(OPENCL) $(FLAGS) \
		-c \
		-o obj/methods.o \
		lib/methods.cpp

# !! forgot libs need to be put after the modules
bin/hamming: obj/utils.o \
	obj/opencl_kernel.o \
	obj/opencl_program.o \
	obj/opencl_buffer.o \
	obj/opencl.o \
	obj/methods.o
	$(CC) $(INC) $(STD) $(FLAGS) $(OPENCL) \
		-o bin/hamming \
		obj/utils.o \
		obj/opencl_kernel.o \
		obj/opencl_program.o \
		obj/opencl_buffer.o \
		obj/opencl.o \
		obj/methods.o \
		$(LIBS) \
		src/hamming.cpp

