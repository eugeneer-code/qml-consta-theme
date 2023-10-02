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

    // Sidebar model
    property var pages: [
        {name: "Colors"},
        {name: "Typography"},
        {name: "CheckBoxes"}
    ]

    Item {
        id: sideBar
        height: parent.height
        width: 200
        ListView {
            id: listView
            anchors.fill: parent
            model: pages
            delegate: ItemDelegate {
                highlighted: index == listView.currentIndex
                text: modelData.name
                width: parent.width
                onClicked: {
                    listView.currentIndex = index
                    stack.currentIndex = index
                }
            }
        }

        ComboBox {
            anchors {
                bottom: parent.bottom
                margins: 12
                left: parent.left
                right: parent.right
            }
            height: 40
            model: ["Default", "Dark", "Display"]
            onActivated: (index) => { ConstaTheme.currentTheme = index }
        }
    }
    Rectangle {
        width: 1
        height: parent.height
        color: ConstaTheme.palette.typo_primary
        x: sideBar.width+1
    }

    StackLayout {
        id: stack
        anchors {
            fill: parent
            leftMargin: sideBar.width + 1
        }
        currentIndex: 2

        Colors{}
        Typography{}
        CheckBoxes{}
    }
}