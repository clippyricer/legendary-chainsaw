# CMakeLists.txt

cmake_minimum_required(VERSION 3.30)

include(${CMAKE_SOURCE_DIR}/config/config.cmake)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
set(CMAKE_INSTALL_PREFIX "/usr/local" CACHE PATH "install prefix" FORCE)
set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type" FORCE)

project(programs)

if (BUILD_HELLO_WORLD)
    set(HELLO_SOURCES src/hello-world/main.cpp src/hello-world/hi.cpp include/hi.h)
    add_executable(hello ${HELLO_SOURCES})
    target_include_directories(hello PRIVATE include)
    install(TARGETS hello DESTINATION ${CMAKE_INSTALL_PREFIX}/bin)

endif()

if (BUILD_DOG_AGE_CONVERT)
    add_executable(dog src/dog-age/main.cpp)
    install(TARGETS dog DESTINATION ${CMAKE_INSTALL_PREFIX}/bin)

endif()

if (BUILD_ADD)
    add_executable(add src/addition/main.cpp)
    install(TARGETS add DESTINATION ${CMAKE_INSTALL_PREFIX}/bin)

endif()

if (BUILD_VAR)
    add_executable(var src/variable/main.cpp)
    install(TARGETS var DESTINATION ${CMAKE_INSTALL_PREFIX}/bin)

endif()

message("Build type used: " ${CMAKE_BUILD_TYPE})
