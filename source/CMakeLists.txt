set(TARGET_NAME consta-lib)

add_library(${TARGET_NAME} STATIC)

target_sources(${TARGET_NAME} PRIVATE
    ConstaDesignLibrary.h
    ConstaDesignLibrary.cpp
    ConstaDesignRes.qrc
    Utils.h
    Utils.cpp
)

target_link_libraries(${TARGET_NAME} PRIVATE
    Qt6::Core
    Qt6::Quick
    Qt6::QuickControls2
)

target_include_directories(${TARGET_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})