# src/meson.build


if get_option('BUILD_HELLO_WORLD')
  executable('hello',
            ['hello-world/main.cpp','hello-world/hi.cpp'],
            include_directories: incdir,
            install: true
            )
endif()


if get_option('BUILD_DOG_AGE')
  executable('dog', 'dog-age/main.cpp', install: true)
endif()


if get_option('BUILD_ADD')
  executable('add', 'addition/main.cpp', install: true)
endif()


if get_option('BUILD_VAR')
  executable('var', 'variable/main.cpp', install: true)
endif()
