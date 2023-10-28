import QtQuick
import QtQuick.Controls

Item {
    property alias font: labelItem.font
    property alias text: labelItem.text
    property alias color: labelItem.color
    property alias icon: iconItem
    property real iconSize: 12
    property real spacing: 6
    implicitWidth: labelItem.width + (iconItem.visible ? iconItem.width + spacing : 0)

    ConstaIcon {
        id: iconItem
        visible: source!="" || name!=""
        size: iconSize
    }

    Label {
        id: labelItem
        x: iconItem.visible ? iconItem.width + spacing : 0
    }
}