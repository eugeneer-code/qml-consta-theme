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
            CheckBox {
                id: errorControl
                text: "Has error"
            }

            Repeater{
                model: formModel

                RowLayout {
                    spacing: Consta.Spacing.M
                    property var form: modelData
                    Repeater {
                        model: sizeModel
                        TextField {
                            ConstaStyle.controlSize: modelData
                            ConstaStyle.buttonForm: form
                            ConstaStyle.hasError: errorControl.checked
                            Layout.preferredWidth: 200
                            enabled: !enabledControl.checked
                            placeholderText: "Text input"
                        }
                    }
                }
            }
        }
    }
}