import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Consta

Item {
    id: page
    property var sizeModel: [Consta.ControlSize.L, Consta.ControlSize.M,
                             Consta.ControlSize.S, Consta.ControlSize.XS]
    property var formModel: [Consta.ButtonForm.Default, Consta.ButtonForm.Round,
                             Consta.ButtonForm.Brick, Consta.ButtonForm.BrickDefault,
                             Consta.ButtonForm.BrickRound, Consta.ButtonForm.DefaultBrick,
                             Consta.ButtonForm.RoundBrick]

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

            CheckBox {
                id: enabledControl
                text: "Disabled"
            }

            ComboBox {
                model: ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
            }

            Repeater{
                model: formModel

                RowLayout {
                    spacing: Consta.Spacing.M
                    property var form: modelData
                    Repeater {
                        model: sizeModel
                        ComboBox {
                            ConstaStyle.controlSize: modelData
                            ConstaStyle.buttonForm: form
                            Layout.preferredWidth: 200
                            enabled: !enabledControl.checked
                            //placeholderText: "Select item"
                            model: ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
                        }
                    }
                }
            }
        }
    }
}