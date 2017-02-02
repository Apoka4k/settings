SET(program_sources
    main.c
    algorithm.c
    files.c
    constants.c)

IF (NOT UNIX)
  SET(program_sources ${program_sources} wingetopt.c)
ENDIF (NOT UNIX)

add_library(program_lib ${program_sources})

IF (UNIX)
  target_link_libraries(program_lib m)
ENDIF (UNIX)

target_include_directories(program_lib PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
