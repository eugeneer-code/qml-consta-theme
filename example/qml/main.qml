import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Consta 1.0

import "Pages"

Window {
    width: 640
    height: 480
    visible: true
    title: "Consta Example"
    color: ConstaTheme.palette.bg_default

    Rectangle {
        width: parent.width
        color: ConstaTheme.palette.bg_default
        height: 40

        ComboBox {
            anchors {
                verticalCenter: parent.verticalCenter
                right: parent.right
                rightMargin: 12
            }
            height: 40
            model: ["Default", "Dark", "Display"]
            onActivated: ConstaTheme.currentTheme = index
        }
    }
    Rectangle {
        width: parent.width
        y: 41
        height: 1
        color: ConstaTheme.palette.typo_primary
    }

    StackLayout {
        currentIndex: 0
        anchors.fill: parent
        anchors.topMargin: 42

        Colors{}
    }
}