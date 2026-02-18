# meson.build

project('programs', 'cpp')

incdir = include_directories('include')

executable('hello', ['src/hello-world/main.cpp', 'src/hello-world/hi.cpp'], include_directories: incdir)
executable('dog', 'src/dog-age/main.cpp')
executable('add', 'src/addition/main.cpp')
