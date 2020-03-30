cmake_minimum_required(VERSION 3.10)

project(utils-app VERSION 1.0)

include(cmake/prepare.cmake)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(utilsInstallDir /home/murphy/Project/utils/build/install)

SET(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} ${utilsInstallDir})
find_package(utils REQUIRED)

if(NOT utils_FOUND)
    message("FATAL ERROR: utils library -- not found")
else()
    message(STATUS "utils library -- found")
    message(STATUS "utils library path -- ${utils_DIR}")
    message(STATUS "utils library include -- ${utils_INCLUDE}") # it should have, but not
endif()

file(GLOB_RECURSE SOURCES "src/*.cpp")
add_executable(${PROJECT_NAME} ${SOURCES})
target_include_directories(${PROJECT_NAME} PUBLIC ${utilsInstallDir}/include)
target_link_libraries(${PROJECT_NAME} PRIVATE ${utilsInstallDir}/lib/libutils.so)

