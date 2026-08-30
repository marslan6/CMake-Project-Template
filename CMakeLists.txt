# Minimum CMake version required to configure this project.
# 3.20 is chosen because it's the first version that knows about C++23.
# Ref: https://cmake.org/cmake/help/latest/prop_tgt/CXX_STANDARD.html
cmake_minimum_required(VERSION 3.20)

# Force this project to build with GCC 15.
set(CMAKE_C_COMPILER gcc-15)
set(CMAKE_CXX_COMPILER g++-15)

# Project name (and implicitly enables C and C++ support).
# Required exactly once per project.
project(Limit-Order-Book)

# Target C++23. This sets the default C++ standard for all targets below.
set(CMAKE_CXX_STANDARD 23)

# Make C++23 a hard requirement: if the compiler can't do it, fail the
# configure step instead of silently falling back to an older standard.
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Define the executable "modern-border" and list its source files.
# Add more .cpp files here as the project grows, e.g. src/OrderBook.cpp.
add_executable(modern-border src/main.cpp)

# Build workflow (for reference)
# Configure: reads this file and generates build files into the "out" folder.
# Run from the same directory that contains CMakeLists.txt:
#   cmake -B out
# Build: compiles the generated build system in the "out" folder.
#   cmake --build out
# Run the resulting program:
#   ./out/modern-border