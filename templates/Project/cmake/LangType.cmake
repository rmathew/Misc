# We require a compiler that supports C99.
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED True)
# We do not want to use any compiler-specific extensions to the C99 standard.
set(CMAKE_C_EXTENSIONS OFF)

# Warn as much as possible with GCC and Clang.
# See also: https://news.ycombinator.com/item?id=15400396
if((CMAKE_C_COMPILER_ID STREQUAL GNU) OR (CMAKE_C_COMPILER_ID STREQUAL Clang))
    add_compile_options(-Wall -Wextra -Wpedantic)
endif()
# Turn warnings into errors for tested compiler-versions.
if((CMAKE_C_COMPILER_ID STREQUAL GNU) AND
    (CMAKE_C_COMPILER_VERSION VERSION_LESS_EQUAL 9.4.0))
    add_compile_options(-Werror)
endif()
