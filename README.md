# C++ projects
This is where I host all of my c++ projects.<br>
Feel free to check them out!

### Legendary-Chainsaw explanation
You might see that the title is "legendary-chainsaw".<br>
Github told me that short names a gud and suggested it.<br>
I just wen't with it.<br>

**TODO**
- [x] Make config gen file
- [x] Fix Dockerfile
- [ ] Add more distros to dep list
- [ ] Add docs for WIN and MacOS install
- [ ] Add support for installing programs
- [ ] Write better code and more


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
$ sudo pacman -S base-devel cmake make gcc fzf ninja
```

**Debian/Ubuntu**
```bash
$ sudo apt install build-essential cmake fzf ninja-build
```


# Building
<small>Windows and Macos build instructions will be added soon</small> 
## Linux
After building the binaries will be located in:</br>
`source-dir/build/bin`

1. Clone the github repository
```bash
$ git clone https://github.com/clippyricer/legendary-chainsaw.git
$ cd legendary-chainsaw
```
2. Build the programs

First you must must select with programs to compile</br>
Do that by running the configure script `./configure`</br>
| Keys | Action |
| ---- | ------ |
| TAB | Select/Deselect |
| ENTER | Confirm |
| ESC | Cancel |
| CTRL+A | Select/Deselect ALL |

### Build using cmake & make
```bash
$ cmake -C config.cmake -B build/ && cd build
$ make
```

### Build using cmake & ninja

```bash
$ cmake -C config.cmake -G Ninja -B build/ && cd build
$ make
```

### Using docker
> [!IMPORTANT]
> As of now you still need to run the configuration file manually</br>
> Or building the docker image WILL fail
> Also make sure that `docker.sh` is executable

Its just basic docker usage

```bash
$ sudo docker build -t hello .
$ docker run hello
```
