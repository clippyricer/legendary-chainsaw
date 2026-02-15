# CMakeLists.txt

cmake_minimum_required(VERSION 3.30)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

project(hello)

option(BUILD_HELLO_WORLD "Build Hello-World executable" ON)

if(BUILD_HELLO_WORLD)
    add_executable(hello
      src/hello-world/hello.cxx
    )
endif()


