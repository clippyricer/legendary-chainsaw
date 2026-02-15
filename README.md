# C++ projects
This is where I host all of my c++ projects.<br>
Feel free to check them out!

### Legendary-Chainsaw explanation
You might see that the title is "legendary-chainsaw".<br>
Github told me that short names a gud and suggested it.<br>
I just wen't with it.<br>

### Dependencies

| Dependency  | Usage in project |
| ----------- | ----------- |
| cmake | makefile generator |
| make | compile binarys |
| gcc | compiler |
| fzf | tool for config |
| ninja(optional) | compile binarys |

**Arch**
```bash
sudo pacman -S base-devel cmake make gcc fzf
```


# Building
<small>Windows and Macos build instructions will be added</small> 
## Linux
After building the binarys will be located in:</br>
`source-dir/build/bin`

### Build using cmake & make
First you must make the configure.sh script executable</br>
and run the configure script `./configure`</br>
| Keys | Action |
| ---- | ------ |
| TAB | Select/Deselect |
| ENTER | Confirm |
| ESC | Cancel |
| CTRL+A | Select/Deselect ALL |


```
cmake -C config.cmake -B build/ && cd build
make
```

### Build using cmake & ninja

```
cmake -C config.cmake -G Ninja -B build/ && cd build
make
```

### Using docker
> [!WARNING]
> THE DOCKER FILE IS CURRENTLY BROKEN!!!</br>
> IT WILL NOT WORK

Its just basic docker usage

```
sudo docker build -t hello .
docker run hello
```
