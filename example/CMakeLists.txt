set(TARGET_NAME consta-example)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_executable(${TARGET_NAME})

target_sources(${TARGET_NAME} PRIVATE
    main.cpp
    ConstaExample.qrc
)

target_link_libraries(${TARGET_NAME} PRIVATE
    Qt6::Quick
    Qt6::QuickControls2
    consta-lib
)

