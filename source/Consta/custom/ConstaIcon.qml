import QtQuick
import Qt5Compat.GraphicalEffects
import Consta

/*
 * Colorized icon
 * Icon bounds should be square
 */
Item {
    id: icon

    property real size: 20
    property alias image: image
    property bool valid: image.status == Image.Ready

    width: size
    height: size

    property bool colorize: true   // Icon should be colirized
    property color color: ConstaTheme.palette.typo_primary
    // source should be filled for custom icon (full path to icon)
    property string source
    // name is using for internal theme icons
    property string name

    Image {
        id: image

        anchors.fill: parent
        visible: source != "" && !colorize

        smooth: true
        antialiasing: true

        source: getImageSource()

        width: icon.width
        height: icon.height

        sourceSize {
              width: icon.width
              height: icon.height
        }
    }

    ColorOverlay {
        id: overlay

        anchors.fill: parent
        source: image
        color: Qt.rgba(icon.color.r, icon.color.g, icon.color.b, 1.0)
        cached: true
        smooth: true
        visible: image.source != "" && colorize
        opacity: icon.color.a
        antialiasing: true
    }

    function getImageSource()
    {
        if(icon.source) return icon.source
        if(icon.name){
            return "qrc:/Consta/icons/"+icon.name+".svg"
        }
        return ""
    }
}
