# Linting with cpplint

This project uses [cpplint](https://github.com/cpplint/cpplint) to check C++ code
against the Google C++ style guide.

## Common commands

Run all commands from the project root. Paths are relative to it, so adjust
them if your files live elsewhere.

`--linelength=120` matches `ColumnLimit` in `.clang-format`; without it cpplint
defaults to 80 and disagrees with the formatter. `make lint` passes it for you.

Check the whole project:

```bash
python3 linting/cpplint.py --linelength=120 --recursive ./src ./include
```

Check specific files (pass one or more paths):

```bash
python3 linting/cpplint.py --linelength=120 ./src/main.cpp
```

Show a summary of errors per category:

```bash
python3 linting/cpplint.py --linelength=120 --recursive --counting=toplevel ./src ./include
```

Print nothing when there are no errors (useful in scripts and CI):

```bash
python3 linting/cpplint.py --linelength=120 --recursive --quiet ./src ./include
```

List all available check categories:

```bash
python3 linting/cpplint.py --filter=
```

## Silencing warnings

Disable a category across a run with `--filter`, for example
`--filter=-legal/copyright,-build/include_order`.

Silence a single line:

```cpp
int x = 0;  // NOLINT(category)
```

Silence the next line:

```cpp
// NOLINTNEXTLINE(category)
int x = 0;
```

Silence a block:

```cpp
// NOLINTBEGIN(category)
...
// NOLINTEND
```

Only silence warnings that are false positives or deliberate style choices, and
prefer naming the specific category over a bare `NOLINT`.