# src/meson.build


if get_option('build_hello_world')
  executable('hello',
            ['hello-world/main.cpp','hello-world/hi.cpp'],
            include_directories: incdir,
            install: true
            )
endif


if get_option('build_dog_age')
  executable('dog', 'dog-age/main.cpp', install: true)
endif


if get_option('build_add')
  executable('add', 'addition/main.cpp', install: true)
endif


if get_option('build_var')
  executable('var', 'variable/main.cpp', install: true)
endif
