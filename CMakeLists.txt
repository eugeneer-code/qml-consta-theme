cmake_minimum_required(VERSION 3.16)

project(qml-consta-theme)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Core Quick QuickControls2 ShaderTools REQUIRED)

add_subdirectory(source)
add_subdirectory(example)
