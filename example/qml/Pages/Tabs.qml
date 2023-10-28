import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Consta

Item {
    id: page
    property var sizeModel: [Consta.ControlSize.M, Consta.ControlSize.S, Consta.ControlSize.XS]
    property var typeModel: [Consta.ControlType.Primary, Consta.ControlType.Clear]

    Flickable {
        anchors.fill: parent
        contentHeight: column.height + 24
        clip: true
        boundsBehavior: Flickable.StopAtBounds
        ScrollBar.vertical: ScrollBar{}

        ColumnLayout {
            id: column
            x: 12
            y: 12
            spacing: Consta.Spacing.L

            RowLayout {
                spacing: Consta.Spacing.M
                CheckBox {
                    id: enabledControl
                    text: "Disabled"
                }
                CheckBox {
                    id: showIcon
                    text: "Icon"
                }
                CheckBox {
                    id: onlyIcon
                    text: "Only Icon"
                }
            }

            Repeater {
                model: typeModel
                Repeater {
                    model: sizeModel
                    property var type: modelData
                    TabBar {
                        enabled: !enabledControl.checked
                        property var sizeItem: modelData
                        Repeater {
                            model: 5
                            TabButton {
                                ConstaStyle.controlSize: sizeItem
                                ConstaStyle.controlType: type
                                text: onlyIcon.checked ? "" : "Item " + index
                                icon.source: showIcon.checked ? "qrc:/icons/star.svg" : ""
                            }
                        }
                    }
                }
            }
        }
    }
}
