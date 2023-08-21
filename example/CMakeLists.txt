set(TARGET_NAME consta-example)

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

