pragma Singleton
import QtQuick

QtObject {
    id: theme
    property int currentTheme: Consta.Theme.Default

    property color projectColor: "#0071B2"

    property var defaultPalette: ConstaPaletteDefault {
        project: projectColor
    }
    property var darkPalette: ConstaPaletteDark {
        project: projectColor
    }
    property var displayPalette: ConstaPaletteDisplay {
        project: projectColor
    }

    property var palette: {
        switch(currentTheme){
            case Consta.Theme.Default: return defaultPalette
            case Consta.Theme.Dark: return darkPalette
            case Consta.Theme.Display: return displayPalette
            default: return undefined
        }
    }

    property var fontFamily: "Inter"
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