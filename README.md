# C++ projects
This is where I host all of my c++ projects

Feel free to check them out!

### Dependencies

| Dependency  | Description |
| ----------- | ----------- |
| cmake | make makefile |
| make | compile program |
| gcc | compiler |
| ninja(optional) | compile program |

**Arch**
```bash
sudo pacman -S base-devel cmake make gcc
```


## Building
### Build using cmake & make

```
cmake -B build/ && cd build
make
```

### Build using cmake & ninja

```
cmake -G Ninja -B build/ && cd build
make
```
