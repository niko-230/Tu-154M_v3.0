cmake_minimum_required(VERSION 3.10)
project(stb_stitch C)

# Download stb header if missing
if(NOT EXISTS "${CMAKE_SOURCE_DIR}/stb_image_write.h")
    message(STATUS "Downloading stb_image_write.h...")
    file(DOWNLOAD
        "https://raw.githubusercontent.com/nothings/stb/master/stb_image_write.h"
        "${CMAKE_SOURCE_DIR}/stb_image_write.h"
        SHOW_PROGRESS
    )
endif()

add_library(stb_stitch SHARED stb_image_write_lib.c)

# Platform-specific settings
if(WIN32)
    set_target_properties(stb_stitch PROPERTIES
        PREFIX ""
        OUTPUT_NAME "win64"
        SUFFIX ".dll"
    )
elseif(APPLE)
    set_target_properties(stb_stitch PROPERTIES
        PREFIX ""
        OUTPUT_NAME "mac"
        SUFFIX ".dylib"
    )
    set(CMAKE_OSX_ARCHITECTURES "x86_64;arm64")
else()
    set_target_properties(stb_stitch PROPERTIES
        PREFIX ""
        OUTPUT_NAME "lin64"
        SUFFIX ".so"
    )
    target_compile_options(stb_stitch PRIVATE -fPIC)
endif()

set_target_properties(stb_stitch PROPERTIES
    C_VISIBILITY_PRESET hidden
    POSITION_INDEPENDENT_CODE ON
)

# Copy output to parent directory
add_custom_command(TARGET stb_stitch POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:stb_stitch> ${CMAKE_SOURCE_DIR}/
)
