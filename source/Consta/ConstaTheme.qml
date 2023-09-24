pragma Singleton
import QtQuick

QtObject {
    id: theme
    property int currentTheme: Consta.Theme.Light

    property color pathColor: "#0078D2"
    property color projectColor: "#0071B2"

    property var bg: ConstaPaletteBackground{
        currentTheme: theme.currentTheme
        path: theme.pathColor
        project: theme.projectColor
    }

    property var typo: ConstaPaletteTypography {
        currentTheme: theme.currentTheme
        path: theme.pathColor
        project: theme.projectColor
    }

    property var control: ConstaPaletteControls {
        currentTheme: theme.currentTheme
        path: theme.pathColor
        project: theme.projectColor
    }

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