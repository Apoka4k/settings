
# collect .c files (c_sources:={printer.c})
SET(c_sources
    error.c)

# specify subdirectories containing .h files
include_directories(..)

# create the library
add_library(error_lib ${c_sources})
