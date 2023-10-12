import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Consta

Item {
    id: page
    property var typeModel: [Consta.ControlType.Primary, Consta.ControlType.Secondary,
                             Consta.ControlType.Ghost, Consta.ControlType.Clear]
    property var formModel: [Consta.ButtonForm.Default, Consta.ButtonForm.Round,
                             Consta.ButtonForm.Brick, Consta.ButtonForm.BrickDefault,
                             Consta.ButtonForm.BrickRound, Consta.ButtonForm.DefaultBrick,
                             Consta.ButtonForm.RoundBrick]
    property var sizeModel: [Consta.ControlSize.L, Consta.ControlSize.M,
                             Consta.ControlSize.S, Consta.ControlSize.XS]

    Flickable {
        anchors.fill: parent
        contentHeight: column.height + 24
        clip: true
        boundsBehavior: Flickable.StopAtBounds
        ScrollBar.vertical: ScrollBar{}

        ColumnLayout{
            id: column
            x: 12
            y: 12
            spacing: Consta.Spacing.L
            CheckBox {
                id: enabledControl
                text: "Disabled"
            }

            GridLayout {
                columns: 4
                columnSpacing: Consta.Spacing.L
                rowSpacing: Consta.Spacing.M
                Repeater {
                    model: formModel
                    Repeater {
                        model: sizeModel
                        property var form: modelData
                        Repeater {
                            model: typeModel
                            property var itemSize: modelData
                            Button {
                                text: "Button"
                                ConstaStyle.controlType: modelData
                                ConstaStyle.buttonForm: form
                                ConstaStyle.controlSize: itemSize
                                enabled: !enabledControl.checked
                            }
                        }
                    }
                }
            }
        }
    }
}