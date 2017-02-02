#
# CAMBIA LE SEGUENTI STRINGHE:
#
# NomeProgetto : e' il nome del progetto, scegli il nome che vuoi.
#
# FileEseguibile : e' il nome del file eseguibile, scegli il nome che vuoi.
#
#
#
# LibreriaProgetto : e' il nome della libreria del progetto, il nome
# 		     deve essere lo stesso di quello specificato
#		     nell'altro file CMakeLists.txt.
#

# --- pezzo di codice costante --- #

cmake_minimum_required(VERSION 2.8)
PROJECT(NomeProgetto)
set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
if(MSVC)
if(CMAKE_CXX_FLAGS MATCHES "/W[0-4]")
string(REGEX REPLACE "/W[0-4]" "/W4" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
else()
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W4")
endif()
elseif(CMAKE_COMPILER_IS_GNUCC OR CMAKE_COMPILER_IS_GNUCXX)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wno-long-long -pedantic")
endif()
add_subdirectory(src)

# -------------------------------- #

# -- pezzo di codice ripetibile -- #

add_executable(FileEseguibile src/main.c)
target_link_libraries(FileEseguibile LINK_PUBLIC LibreriaProgetto)

# -------------------------------- #

#
# SPIEGAZIONE
#
# PROJECT : indica che questo file CMakeLists.txt e' quello principale.
#
# add_subdirectory : specifica che esiste una sottocartella.
#
# target_link_libraries : specifica quali librerie andranno aggiunte al
# 			  file eseguibile.
#			  LibreriaProgetto : e' la libreria creata manualmente.
#
# RIPETIZIONE : se vogliamo creare piu' eseguibili
# 	      	ripetiamo piu' volte il codice ripetibile.
#