cmake_minimum_required(VERSION 3.2 FATAL_ERROR)
set(SFW_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include)

project(simplefilewatcher VERSION 1.0 LANGUAGES CXX)
add_subdirectory("source")

add_executable(sfw_test "SimpleDemo.cpp")
target_link_libraries(sfw_test PUBLIC sfw_lib)
include_directories(sfw_test ${SFW_INCLUDE_DIR})