# C++ projects
This is where I host all of my c++ projects.<br>
Feel free to check them out!

### Legendary-Chainsaw
You might see that the title is "legendary-chainsaw".<br>
Github told me that short names are gud and suggested it.<br>
I just wen't with it.<br>

**TODO**
- [x] Make config gen file
- [x] Fix Dockerfile
- [x] Remove cmake warning
- [x] Add support for meson
- [ ] Add more distros to dep list
- [ ] Add docs for WIN and MacOS install
- [ ] Expand calculator program


### Dependencies

| Dependency  | Usage in project |
| ----------- | ----------- |
| cmake | makefile generator |
| make | compile binaries |
| gcc | compiler |
| fzf | tool for config |
| git | cloning repo |
| docker | run using docker |
| meson | build system |
| ninja | compile binaries |

**Arch**
```bash
$ sudo pacman -S base-devel meson docker git cmake make gcc fzf ninja
```

**Debian/Ubuntu**
```bash
$ sudo apt install build-essential meson git cmake fzf ninja-build
```
**Make sure to install docker**

# Building
<small>Windows and Macos build instructions will be added soon</small> 
## Linux
After building the binaries will be located in:</br>
`source-dir/build/bin` for cmake</br>
and `source-dir/build/src` for meson</br>
You can install them with `make install` or `ninja install`

1. Clone the github repository
```bash
$ git clone https://github.com/clippyricer/legendary-chainsaw.git
$ cd legendary-chainsaw
```
2. Actually build it

First you must must select with programs to compile</br>
Do that by running the configure script `./configure`</br>
The default build configuration is `Release`</br>
| Keys | Action |
| ---- | ------ |
| TAB | Select/Deselect |
| ENTER | Confirm |
| ESC | Exit |
| CTRL+A | Select/Deselect ALL |

### Build using cmake
```bash
$ mkdir build/ && cd build/
$ make
```

### Build using meson

```bash
$ mdkir build/ && cd build/
$ meson setup ..
$ ninja
```

### Using docker
> [!IMPORTANT]
> As of now you still need to run the configuration file manually</br>
> Or building the docker image WILL fail
> Also make sure that `docker.sh` is executable

Its just basic docker usage

```bash
$ docker build -t hello .
$ docker run -it hello
```
