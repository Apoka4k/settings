
# avoid warnings
cmake_minimum_required(VERSION 2.8)

# specify subdirectories containing .c files
add_subdirectory(../../core core)

# specify subdirectories containing .h files
include_directories(../../core)

# specify executable name
add_executable(test ./main.c)

# associate libraries to executable
target_link_libraries(test LINK_PUBLIC printer_lib error_lib)
