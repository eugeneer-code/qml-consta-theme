import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import Consta

T.Button {
    id: control

    implicitWidth: contentItem.implicitWidth + leftPadding + rightPadding
    implicitHeight: internal.height

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
            case Consta.ControlType.Primary: return ConstaTheme.palette.control_bg_primary
            case Consta.ControlType.Secondary: return ConstaTheme.palette.control_bg_secondary
            case Consta.ControlType.Ghost: return ConstaTheme.palette.control_bg_ghost
            case Consta.ControlType.Clear: return ConstaTheme.palette.control_bg_clear
        }
        property color hoverColor: switch(control.ConstaStyle.controlType){
            case Consta.ControlType.Primary: return ConstaTheme.palette.control_bg_primary_hover
            case Consta.ControlType.Secondary: return ConstaTheme.palette.control_bg_secondary
            case Consta.ControlType.Ghost: return ConstaTheme.palette.control_bg_ghost_hover
            case Consta.ControlType.Clear: return ConstaTheme.palette.control_bg_clear_hover
        }
        property color borderColor: switch(control.ConstaStyle.controlType){
            case Consta.ControlType.Secondary: return ConstaTheme.palette.control_bg_border_secondary
            default: return "transparent"
        }
        property color borderHoverColor: switch(control.ConstaStyle.controlType){
            case Consta.ControlType.Secondary: return ConstaTheme.palette.control_bg_border_secondary_hover
            default: return "transparent"
        }
        property int height: switch(control.ConstaStyle.controlSize){
            case Consta.ControlSize.XS: return 24
            case Consta.ControlSize.S: return 32
            case Consta.ControlSize.M: return 40
            case Consta.ControlSize.L: return 48
            default: return 32
        }
        property color disableColor: switch(control.ConstaStyle.controlType){
            case Consta.ControlType.Primary: return ConstaTheme.palette.control_bg_disable
            case Consta.ControlType.Secondary: return "transparent"
            case Consta.ControlType.Ghost: return ConstaTheme.palette.control_bg_disable
            case Consta.ControlType.Clear: return "transparent"
        }
        property color textColor: switch(control.ConstaStyle.controlType){
            case Consta.ControlType.Primary: return ConstaTheme.palette.control_typo_primary
            case Consta.ControlType.Secondary: return ConstaTheme.palette.control_typo_secondary
            case Consta.ControlType.Ghost: return ConstaTheme.palette.control_typo_ghost
            case Consta.ControlType.Clear: return ConstaTheme.palette.control_typo_clear
        }
        property color hoverTextColor: switch(control.ConstaStyle.controlType){
            case Consta.ControlType.Primary: return ConstaTheme.palette.control_typo_primary_hover
            case Consta.ControlType.Secondary: return ConstaTheme.palette.control_typo_secondary_hover
            case Consta.ControlType.Ghost: return ConstaTheme.palette.control_typo_ghost_hover
            case Consta.ControlType.Clear: return ConstaTheme.palette.control_typo_clear_hover
        }
    }

    contentItem: Label {
        text: control.text
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: {
            if(!control.enabled) return ConstaTheme.palette.control_typo_disable
            if(control.hovered || control.pressed) return internal.hoverTextColor
            return internal.textColor
        }
    }

    background: Rectangle {
        implicitWidth: 60
        implicitHeight: internal.height
        radius: switch(control.ConstaStyle.buttonForm){
            case Consta.ButtonForm.Default: return 4;
            case Consta.ButtonForm.Round: return internal.height/2
            case Consta.ButtonForm.Brick: return 0;
            default: return 0;
        }
        color: {
            if(!control.enabled) return internal.disableColor
            if(control.hovered || control.pressed) return internal.hoverColor
            return internal.baseColor
        }
        border.color: {
            if(!control.enabled && control.ConstaStyle.controlType == Consta.ControlType.Secondary)
                return ConstaTheme.palette.control_typo_disable
            if(control.hovered || control.pressed) return internal.borderHoverColor
            return internal.borderColor
        }
        border.width: 1

        FocusRectangle {
            anchors.fill: parent
            radius: parent.radius
            visible: control.activeFocus
            antialiasing: true
        }
    }
}