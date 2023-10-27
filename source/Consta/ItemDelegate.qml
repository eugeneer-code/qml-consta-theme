import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import Consta

T.ItemDelegate {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: background ? background.implicitHeight : 28

    padding: switch(control.ConstaStyle.controlSize){
        case Consta.ControlSize.XS:
        case Consta.ControlSize.S: return 8
        default: return 12
    }
    spacing: 8

    icon.width: switch(control.ConstaStyle.controlSize){
        case Consta.ControlSize.XS:
        case Consta.ControlSize.S: return 16
        default: return 20
    }
    icon.height: switch(control.ConstaStyle.controlSize){
        case Consta.ControlSize.XS:
        case Consta.ControlSize.S: return 16
        default: return 20
    }
    icon.color: control.highlighted ? ConstaTheme.palette.control_typo_secondary : ConstaTheme.palette.control_typo_default

    font.family: "Inter"
    font.pixelSize: switch(control.ConstaStyle.controlSize){
        case Consta.ControlSize.XS: return 12
        case Consta.ControlSize.S: return 14
        case Consta.ControlSize.M: return 16
        case Consta.ControlSize.L: return 18
        default: return 14
    }

    contentItem: IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        alignment: control.display === IconLabel.IconOnly || control.display === IconLabel.TextUnderIcon ? Qt.AlignCenter : Qt.AlignLeft

        icon: control.icon
        text: control.text
        font: control.font
        color: control.highlighted ? ConstaTheme.palette.control_typo_secondary : ConstaTheme.palette.control_typo_default
    }

    background: Rectangle {
        implicitWidth: 360
        implicitHeight: switch(control.ConstaStyle.controlSize){
            case Consta.ControlSize.XS: return 24
            case Consta.ControlSize.S: return 28
            case Consta.ControlSize.M: return 36
            case Consta.ControlSize.L: return 38
            default: return 28
        }
        color: {
            if(control.hovered) return ConstaTheme.palette.control_bg_ghost_hover
            return ConstaTheme.palette.control_bg_default
        }

        Rectangle {
            width: 2
            height: parent.height
            color: ConstaTheme.palette.control_typo_secondary
            visible: control.highlighted
        }
    }
}
