# CMakeLists.txt

cmake_minimum_required(VERSION 3.30)

# include(GNUInstallDirs)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
set(CMAKE_INSTALL_PREFIX "/usr/local" CACHE PATH "install prefix" FORCE)

project(programs)

option(BUILD_HELLO_WORLD "Build Hello-World executable" ON)
option(BUILD_DOG_AGE_CONVERT "Build Dog-age-convert executable" ON) 

if(BUILD_HELLO_WORLD)
    add_executable(hello src/hello-world/hello.cpp)

endif()

if (BUILD_DOG_AGE_CONVERT)
     add_executable(dog src/dog-age-convert/dog_age_convert.cpp)

endif()

install(TARGETS hello DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_BINDIR})
install(TARGETS dog DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_BINDIR})


