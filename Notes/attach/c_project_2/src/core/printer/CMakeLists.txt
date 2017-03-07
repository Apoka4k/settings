
# collect .c files (c_sources:={printer.c})
SET(c_sources
    printer.c)

# specify subdirectories containing .h files
include_directories(..)

# create the library
add_library(printer_lib ${c_sources})
