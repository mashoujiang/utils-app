function(parse_git_hash)
    execute_process(
        COMMAND ${GIT_EXECUTABLE} rev-parse HEAD
        WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
        RESULT_VARIABLE git_hash_result
        OUTPUT_VARIABLE utils_GIT_HASH
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )
    if(git_hash_result)
        message(FATAL_ERROR "Failed to get git hash: ${git_hash_result}")
    endif()
endfunction()

function(update_submodule)
    message(STATUS "Submodule update")
        execute_process(
            COMMAND ${GIT_EXECUTABLE} submodule update --init --recursive
            WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
            RESULT_VARIABLE submodule_update_result
        )
        if(NOT submodule_update_result EQUAL 0)
            message(FATAL_ERROR "git submodule update --init failed with ${submodule_update_result}, please checkout submodules")
        endif()
endfunction()

function(install_git_hooks)
    message(STATUS "Install git hooks")
    if (NOT EXISTS ${PROJECT_SOURCE_DIR}/.git/hooks/prepare-commit-msg)
        execute_process(
            COMMAND ${CMAKE_COMMAND} -E copy "scripts/prepare-commit-msg" ".git/hooks/"
            WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
        )
    endif ()
endfunction()

find_package(Git REQUIRED)
if (Git_FOUND AND EXISTS "${PROJECT_SOURCE_DIR}/.git")
    parse_git_hash()
    update_submodule()
    install_git_hooks()
endif ()
