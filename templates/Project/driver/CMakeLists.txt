add_executable(hello_world main.c)
target_compile_features(hello_world PUBLIC c_std_99)
target_link_libraries(hello_world LINK_PUBLIC greeter)
install(TARGETS hello_world DESTINATION bin)
