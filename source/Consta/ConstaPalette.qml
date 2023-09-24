pragma Singleton
import QtQuick

/**
 * Colors definition
 */
QtObject {

    // TODO: use human-readable ids instead of numbers
    // unable to do it in QML, should be done in C++
    // 0 - Light
    // 1 - Dark
    // 2 - Display
    property var base: {
        0: "#002033",
        1: "#FFFFFF",
        2: "#F6FBFD"
    }

    property var secondary: {
        0: "#ECF1F4",
        1: "#161A1D",
        2: "#002D47"
    }

    property var essential: {
        0: "#FFFFFF",
        1: "#22272B",
        2: "#002033"
    }

    property var phantom: {
        0: "#002033",
        1: "#F6FBFD",
        2: "#F6FBFD"
    }

    property var system: {
        0: "#DEE4E8",
        1: "#4B5963",
        2: "#4B6272"
    }

    property var warning: {
        0: "#F38B00",
        1: "#F38B00",
        2: "#F38B00"
    }

    property var caution: {
        0: "#F2C94C",
        1: "#F2C94C",
        2: "#F2C94C"
    }

    property var success: {
        0: "#22C38E",
        1: "#22C38E",
        2: "#22C38E"
    }

    property var alert: {
        0: "#EB5757",
        1: "#F54D4D",
        2: "#EB5757"
    }

    property var normal: {
        0: "#56B9F2",
        1: "#0AA5FF",
        2: "#0AA5FF"
    }

    property var critical: {
        0: "#33000F",
        1: "#33000F",
        2: "#33000F"
    }

    property var tone: {
        0: "#002033",
        1: "#0C1113",
        2: "#001623"
    }

    property var border: {
        0: _ConstaUtils.getAlphaColor("#004166", 0.2),
        1: _ConstaUtils.getAlphaColor("#FFFFFF", 0.2),
        2: _ConstaUtils.getAlphaColor("#F6FBFD", 0.28)
    }

    property var shadow: {
        0: "#002033",
        1: "#000000",
        2: "#000306"
    }

    property var textColor: {
        0: "#002033",
        1: "#FAFAFA",
        2: "#EEF8FB"
    }
}