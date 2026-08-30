# Limit-Order-Book

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
