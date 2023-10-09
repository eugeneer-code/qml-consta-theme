import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import Consta

T.Button {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    padding: 6
    horizontalPadding: padding + 2
    spacing: 6

    icon.width: 24
    icon.height: 24
    icon.color: control.checked || control.highlighted ? control.palette.brightText :
                control.flat && !control.down ? (control.visualFocus ? control.palette.highlight : control.palette.windowText) : control.palette.buttonText

    QtObject {
        id: internal
        property color baseColor: switch(control.ConstaStyle.controlType){
            case Consta.ControlType.Primary: return ConstaTheme.palette.control_bg_primary;
            case Consta.ControlType.Secondary: return ConstaTheme.palette.control_bg_secondary;
            case Consta.ControlType.Ghost: return ConstaTheme.palette.control_bg_ghost;
            case Consta.ControlType.Clear: return ConstaTheme.palette.control_bg_clear;
        }
    }

    contentItem: IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display

        icon: control.icon
        text: control.text
        font: control.font
        color: control.checked || control.highlighted ? control.palette.brightText :
               control.flat && !control.down ? (control.visualFocus ? control.palette.highlight : control.palette.windowText) : control.palette.buttonText
    }

    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 40
        radius: 4
        color: internal.baseColor
        border.color: control.palette.highlight
        border.width: control.visualFocus ? 2 : 0
    }
}