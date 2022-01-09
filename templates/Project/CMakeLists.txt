# LCD across major Linux distributions (via https://pkgs.org/download/cmake).
#
# Alternate view - just use the latest version:
#   https://alexreinking.com/blog/how-to-use-cmake-without-the-agonizing-pain-part-1.html
cmake_minimum_required(VERSION 3.16.3)
project(HelloWorld VERSION 0.1.0 DESCRIPTION "Hello World." LANGUAGES C)

set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH})
include(BuildType)
include(LangType)

add_subdirectory(driver)
add_subdirectory(greeter)
