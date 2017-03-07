
#include <stdio.h>
#include <stdlib.h>

#include "error/error.h"

void error(char* string)
{
  printf("Error: %s.\n", string);
  exit(1);
}
