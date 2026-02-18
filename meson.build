# meson.build

project('programs', 'cpp')

incdir = include_directories('include')

message(meson.project_name())
prefix = get_option('prefix')
bindir = join_paths(prefix, get_option ('bindir'))

executable('hello', 
          ['src/hello-world/main.cpp','src/hello-world/hi.cpp'],
          include_directories: incdir,
          install: true
          )

executable('dog', 'src/dog-age/main.cpp', install: true)
executable('add', 'src/addition/main.cpp', install: true)
executable('var', 'src/variable/main.cpp', install: true)
