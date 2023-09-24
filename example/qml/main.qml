import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Consta 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: "Consta Example"

    Rectangle {
        anchors.fill: parent
        color: "white"
    }

    Label {
        text: "Consta example"
    }

    Rectangle {
        width: 100
        height: 100
        color: ConstaTheme.bg.secondary
    }


}