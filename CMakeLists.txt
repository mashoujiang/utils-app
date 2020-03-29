cmake_minimum_required(VERSION 3.10)

project(utils-app VERSION 1.0)

SET(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} /home/murphy/Project/utils/build/install)
find_package(utils REQUIRED)

include(cmake/prepare.cmake)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_subdirectory(src)
