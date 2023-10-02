import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Consta

Item {

    Column {
        anchors.fill: parent
        spacing: Consta.Spacing.M

        Repeater {
            model: [Consta.ControlSize.L, Consta.ControlSize.M, Consta.ControlSize.S, Consta.ControlSize.XS]
            Row {
                spacing: Consta.Spacing.XL_2
                CheckBox {
                    text: "This is checkbox"
                    ConstaStyle.controlSize: modelData
                    ConstaStyle.controlType: Consta.ControlType.Primary
                }
                CheckBox {
                    text: "This is checkbox"
                    ConstaStyle.controlSize: modelData
                    ConstaStyle.controlType: Consta.ControlType.Ghost
                }
            }
        }
    }
}