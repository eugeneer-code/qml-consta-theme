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

    Flickable {
        anchors.fill: parent
        contentHeight: column.height
        clip: true
        boundsBehavior: Flickable.StopAtBounds
        ScrollBar.vertical: ScrollBar{}

        ColumnLayout{
            id: column
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
                    model: page.formModel
                    Repeater {
                        model: typeModel
                        property var form: modelData
                        Button {
                            text: "Button"
                            ConstaStyle.controlType: modelData
                            ConstaStyle.buttonForm: form
                            enabled: !enabledControl.checked
                        }
                    }
                }
            }
        }
    }
}