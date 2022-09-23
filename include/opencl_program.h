/*
 * nourdinebah@gmail.com
 */

#include <CL/cl.h>

int create_prog(
	cl_program *program, cl_context context, char *path, char *name
);
int build_prog(cl_program *program, cl_device_id *devices, char *name);
