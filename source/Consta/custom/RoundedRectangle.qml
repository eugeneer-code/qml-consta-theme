import QtQuick
import Qt5Compat.GraphicalEffects
import QtQuick.Shapes

/*
 * Rectangle with different radius in corners
 */
Item {
    id: root
    property real radius: 0
    property real radiusTL: -1
    property real radiusTR: -1
    property real radiusBL: -1
    property real radiusBR: -1
    property color color
    property color borderColor
    property real borderWidth: 0

    Rectangle {
        anchors.fill: parent
        radius: radiusTL >= 0 ? radiusTL : root.radius
        color: root.color
        border.color: borderColor
        border.width: borderWidth
        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: Item {
                width: root.width
                height: root.height
                Rectangle {
                    width: root.width/2
                    height: root.height/2
                }
            }
        }
    }
    Rectangle {
        anchors.fill: parent
        radius: radiusTR >= 0 ? radiusTR : root.radius
        color: root.color
        border.color: borderColor
        border.width: borderWidth
        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: Item {
                width: root.width
                height: root.height
                Rectangle {
                    width: root.width/2
                    height: root.height/2
                    x: root.width/2
                }
            }
        }
    }
    Rectangle {
        anchors.fill: parent
        radius: radiusBL >= 0 ? radiusBL : root.radius
        color: root.color
        border.color: borderColor
        border.width: borderWidth
        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: Item {
                width: root.width
                height: root.height
                Rectangle {
                    width: root.width/2
                    height: root.height/2
                    y: root.height/2
                }
            }
        }
    }
    Rectangle {
        anchors.fill: parent
        radius: radiusBR >= 0 ? radiusBR : root.radius
        color: root.color
        border.color: borderColor
        border.width: borderWidth
        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: Item {
                width: root.width
                height: root.height
                Rectangle {
                    width: root.width/2
                    height: root.height/2
                    x: root.width/2
                    y: root.height/2
                }
            }
        }
    }
}