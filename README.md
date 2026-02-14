# C++ projects
This is where I host all of my c++ projects.<br>
Feel free to check them out!

### Legendary-Chainsaw explanation
You might see that the title is "legendary-chainsaw".<br>
Github told me that short names a gud and suggested it.<br>
I just wen't with it.<br>

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


# Building
<small>Windows and Macos build instructions will be added</small> 
## Linux
After building the binarys will be located in:</br>
```source-dir/build/bin```

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

### Run using docker
Its just basic docker usage

```
sudo docker build -t hello .
docker run hello
```
