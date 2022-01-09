# Use the "Release" build-type by default for single-configuration builds (via
# https://www.kitware.com/cmake-and-the-default-build-type/).
set(default_build_type "Release")
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    message(STATUS "No build-type specified - using '${default_build_type}'.")
    set(CMAKE_BUILD_TYPE "${default_build_type}" CACHE
    	STRING "Choose the type of the build." FORCE)
    # Set the possible values of build-type for cmake-gui.
    set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS
    	"Debug" "Release" "MinSizeRel" "RelWithDebInfo")
endif()
