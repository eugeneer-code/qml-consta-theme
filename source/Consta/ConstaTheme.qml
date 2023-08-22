pragma Singleton
import QtQuick

QtObject {

    // Load fonts
    property FontLoader fontBlack: FontLoader{source: Qt.resolvedUrl("fonts/Inter-Black.ttf")}
    property FontLoader fontBold: FontLoader {source: Qt.resolvedUrl("fonts/Inter-Bold.ttf")}
    property FontLoader fontExBold: FontLoader {source: Qt.resolvedUrl("fonts/Inter-ExtraBold.ttf")}
    property FontLoader fontExLight: FontLoader {source: Qt.resolvedUrl("fonts/Inter-ExtraLight.ttf")}
    property FontLoader fontLight: FontLoader {source: Qt.resolvedUrl("fonts/Inter-Light.ttf")}
    property FontLoader fontMedium: FontLoader {source: Qt.resolvedUrl("fonts/Inter-Medium.ttf")}
    property FontLoader fontRegular: FontLoader {source: Qt.resolvedUrl("fonts/Inter-Regular.ttf")}
    property FontLoader fontSemiBold: FontLoader {source: Qt.resolvedUrl("fonts/Inter-SemiBold.ttf")}
    property FontLoader fontThin: FontLoader {source: Qt.resolvedUrl("fonts/Inter-Thin.ttf")}
}