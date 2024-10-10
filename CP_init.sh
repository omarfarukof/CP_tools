#!/bin/bash
# This script is used to create folder structure

# If README.md not exist then create it
if [ ! -f "README.md" ]; then
    touch README.md
fi

# If io dir not exist then create it
if [ ! -d "io" ]; then
    mkdir io 
fi

# If io/input.txt not exist then create it
if [ ! -f "io/input.txt" ]; then
    touch io/input.txt
fi

# If io/output.txt not exist then create it
if [ ! -f "io/output.txt" ]; then
    touch io/output.txt
fi

# If CMake Dir not exist then create it
if [ ! -d "CMake" ]; then
    mkdir CMake 
fi

# If CMake/CMakeLists.txt not exist then create it and write default code
if [ ! -f "CMake/CMakeLists.txt" ]; then
    touch CMake/CMakeLists.txt
    # echo multiline string
    echo """
cmake_minimum_required(VERSION 3.10)
project(CP_Problems)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Automatically detect all problem source files (e.g., A.cpp, B.cpp, ...)
file(GLOB PROBLEM_SOURCES "../\*.cpp")

# Create an executable for each problem
foreach(SOURCE_FILE \${PROBLEM_SOURCES})
    get_filename_component(PROBLEM_NAME \${SOURCE_FILE} NAME_WE)
    add_executable(\${PROBLEM_NAME} \${SOURCE_FILE})
    set_target_properties(\${PROBLEM_NAME} PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY \${CMAKE_BINARY_DIR}/../build)
endforeach()
    """ >> CMake/CMakeLists.txt
fi


# If test dir not exist then create it
if [ ! -d "test" ]; then
    mkdir test
fi