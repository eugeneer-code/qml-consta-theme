set(TARGET_NAME consta-lib)

add_library(${TARGET_NAME} STATIC)

target_sources(${TARGET_NAME} PRIVATE
    ConstaDesignLibrary.h
    ConstaDesignLibrary.cpp
    ConstaDesignRes.qrc
    Utils.h
    Utils.cpp
    ConstaStyle.h
    ConstaStyle.cpp
    RoundedRect/RoundedRectangle.h
    RoundedRect/RoundedRectangle.cpp
    RoundedRect/RoundedRectangleMaterial.h
    RoundedRect/RoundedRectangleMaterial.cpp
    RoundedRect/RoundedRectangleNode.h
    RoundedRect/RoundedRectangleNode.cpp
)

qt6_add_shaders(${TARGET_NAME} "Consta_RoundedRect"
    BATCHABLE PRECOMPILE OPTIMIZED
    PREFIX  "/"
    FILES
        "Consta/shaders/roundedrectangle.frag"
        "Consta/shaders/roundedrectangle.vert"
)

target_link_libraries(${TARGET_NAME} PRIVATE
    Qt6::Core
    Qt6::Quick
    Qt6::QuickControls2
)

target_include_directories(${TARGET_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})