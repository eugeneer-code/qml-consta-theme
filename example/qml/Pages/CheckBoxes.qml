import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Consta

Item {

    Flickable {
        anchors.fill: parent
        contentHeight: column.height + column.y*2
        clip: true
        boundsBehavior: Flickable.StopAtBounds
        ScrollBar.vertical: ScrollBar{}

        Column {
            id: column
            width: parent.width
            x: 12
            y: 12
            spacing: Consta.Spacing.S

            Repeater {
                model: [Consta.ControlSize.L, Consta.ControlSize.M, Consta.ControlSize.S, Consta.ControlSize.XS]
                Row {
                    spacing: Consta.Spacing.XL_2
                    CheckBox {
                        text: "Primary checkbox"
                        ConstaStyle.controlSize: modelData
                        ConstaStyle.controlType: Consta.ControlType.Primary
                    }
                    CheckBox {
                        text: "Ghost checkbox"
                        ConstaStyle.controlSize: modelData
                        ConstaStyle.controlType: Consta.ControlType.Ghost
                    }
                }
            }

            Repeater {
                model: [Consta.ControlSize.L, Consta.ControlSize.M, Consta.ControlSize.S, Consta.ControlSize.XS]
                Row {
                    spacing: Consta.Spacing.XL_2
                    CheckBox {
                        text: "Primary checkbox"
                        tristate: true
                        ConstaStyle.controlSize: modelData
                        ConstaStyle.controlType: Consta.ControlType.Primary
                    }
                    CheckBox {
                        text: "Ghost checkbox"
                        tristate: true
                        ConstaStyle.controlSize: modelData
                        ConstaStyle.controlType: Consta.ControlType.Ghost
                    }
                }
            }

            Repeater {
                model: [Consta.ControlSize.L, Consta.ControlSize.M, Consta.ControlSize.S, Consta.ControlSize.XS]
                Row {
                    spacing: Consta.Spacing.XL_2
                    CheckBox {
                        text: "Primary checkbox"
                        enabled: false
                        checked: index % 2 == 0
                        ConstaStyle.controlSize: modelData
                        ConstaStyle.controlType: Consta.ControlType.Primary
                    }
                    CheckBox {
                        text: "Ghost checkbox"
                        enabled: false
                        checked: index % 2 == 1
                        ConstaStyle.controlSize: modelData
                        ConstaStyle.controlType: Consta.ControlType.Ghost
                    }
                }
            }
        }
    }
}