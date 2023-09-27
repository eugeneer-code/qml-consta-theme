set(TARGET_NAME consta-example)

find_package(Qt6 6.2 COMPONENTS Quick ShaderTools REQUIRED)

qt_add_executable(${TARGET_NAME})

target_sources(${TARGET_NAME} PRIVATE
    main.cpp
    ConstaExample.qrc
)

qt_add_shaders(${TARGET_NAME} "shaders"
    PREFIX "/"
    FILES "shaders/opacitymask.frag"
    OUTPUTS "opacitymask.frag.qsb"
)

target_link_libraries(${TARGET_NAME} PRIVATE
    Qt6::Quick
    Qt6::QuickControls2
    consta-lib
)

