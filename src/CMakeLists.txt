set(TARGET_NAME utils-app)

file(GLOB_RECURSE SOURCES "*.cpp")

add_executable(${TARGET_NAME} ${SOURCES})
#target_include_directories(${TARGET_NAME} PRIVATE ${})
target_compile_features(${TARGET_NAME} PRIVATE cxx_std_11)
target_link_libraries(${TARGET_NAME} PRIVATE utils::utils)