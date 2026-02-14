# CMakeLists.txt

cmake_minimum_required(VERSION 3.30)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

project(hello)

add_executable(hello
  src/hello-world/hello.cxx
)


