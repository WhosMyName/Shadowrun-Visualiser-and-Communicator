#OBJS specifies which files to compile as part of the project 
OBJS = svac_server.cpp
#CC specifies which compiler we're using 
CC = g++ 
#COMPILER_FLAGS specifies the additional compilation options we're using 
# -w suppresses all warnings 
COMPILER_FLAGS = -w -Wall -Wextra -I. -pthread -std=c++17
#LINKER_FLAGS specifies the libraries we're linking against 
#LINKER_FLAGS = -lsfml-graphics -lsfml-window -lsfml-system 
LINKER_FLAGS = -lcrypto -lsfml-graphics -lsfml-window -lsfml-system
#OBJ_NAME specifies the name of our exectuable 
OBJ_NAME = main
#This is the target that compiles our executable 
#DEPS = /usr/include/SFML/Window.hpp /usr/include/SFML/Graphics.hpp
#DEPS = python3-config --cflags python3-config --ldflags
#This will include all Header Dependancies
all: $(OBJS)
	$(CC) $(OBJS) $(COMPILER_FLAGS) $(LINKER_FLAGS) -o $(OBJ_NAME)
