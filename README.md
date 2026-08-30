# CMAKE Project Template

## Build workflow

### Prerequisites
- CMake 3.20 or newer
- GCC 15 (`gcc-15` / `g++-15`) — required for C++23 support

### Configure
Reads `CMakeLists.txt` and generates the build files into the `out` folder.
Run from the same directory that contains `CMakeLists.txt`:
```sh
cmake -B out
```

### Build
Compiles the generated build system in the `out` folder:
```sh
cmake --build out
```

### Run
Run the resulting program:
```sh
./out/modern-border
```

### Clean rebuild
Discards the cached configuration and reconfigures from scratch. Use this
after changing the compiler or other cached settings:
```sh
cmake -B out --fresh
cmake --build out
```

## Common CMake commands

Reference for the directives used (or usable) in `CMakeLists.txt`.

### `add_executable`
```cmake
add_executable(myprogram a.cpp b.cpp)
```
Defines an executable named `myprogram` built from `a.cpp` and `b.cpp`.
List every `.cpp` file that makes up the program.

### `add_compile_options`
```cmake
add_compile_options(-Wall -Wextra)
```
Adds flags to the compiler for all targets. `-Wall -Wextra` enable the common
warning sets and are strongly recommended for catching bugs early.
(`-Wpedantic` can be added to warn about non-standard extensions.)

### `set(CMAKE_CXX_COMPILER ...)`
```cmake
set(CMAKE_CXX_COMPILER clang++)
```
Chooses the C++ compiler. Must be set **before** `project()` to take effect.
Prefer passing it on the command line instead, which keeps `CMakeLists.txt`
portable:
```sh
cmake -B out -DCMAKE_CXX_COMPILER=clang++
```

### `set(CMAKE_BUILD_TYPE ...)`
```cmake
set(CMAKE_BUILD_TYPE Debug)
```
Sets the build type, which controls optimization and debug info:

| Type | Optimization | Debug info | Use for |
|------|--------------|------------|---------|
| `Debug` | none | full | development |
| `Release` | full | none | shipping |
| `RelWithDebInfo` | full | yes | profiling / crash reports |

> Note: `CMAKE_BUILD_TYPE` applies to single-config generators like the Unix
> Makefiles used here. Multi-config generators (Visual Studio, Ninja
> Multi-Config) instead pick the type at build time:
> `cmake --build out --config Release`.

### Setting variables on the command line
Any CMake variable can be set at configure time with `-D`:
```sh
cmake -B out -DCMAKE_BUILD_TYPE=RelWithDebInfo
```