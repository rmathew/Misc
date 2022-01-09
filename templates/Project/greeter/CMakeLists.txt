add_library(greeter STATIC greeter.c)
target_compile_features(greeter PUBLIC c_std_99)
target_include_directories(greeter PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
