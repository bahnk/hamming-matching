/*
 * nourdinebah@gmail.com
 */

#include <stdio.h>
#include <stdlib.h>
#include "error_codes.h"

///////////////////////////
int file_exists(char *path)
{

	if (FILE *file = fopen(path, "r"))
	{
		fclose(file);
		return 1;
	}

	else
	{
		return 0;
	}   
}

/////////////////////
size_t get_file_size(
	char* path
)
{

	FILE *fp = fopen(path, "r");

	if (!fp) {
		printf("Error: cannot open the kernel source file\n");
		return FUNCTION_FAILURE;
	}

	fseek(fp, 0L, SEEK_END);
	size_t sz = ftell(fp);

	return sz;
}
