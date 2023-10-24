import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import Consta

T.TextArea {
    id: control

    implicitWidth: implicitBackgroundWidth + leftInset + rightInset
                   || Math.max(contentWidth, placeholder.implicitWidth) + leftPadding + rightPadding
    implicitHeight: Math.max(contentHeight + topPadding + bottomPadding, internal.height)

    padding: switch(control.ConstaStyle.controlSize){
        case Consta.ControlSize.XS: return 6
        case Consta.ControlSize.S: return 8
        case Consta.ControlSize.M: return 10
        case Consta.ControlSize.L: return 12
        default: return 8
    }

    QtObject {
        id: internal
        property int height: switch(control.ConstaStyle.controlSize){
            case Consta.ControlSize.XS: return 24
            case Consta.ControlSize.S: return 32
            case Consta.ControlSize.M: return 40
            case Consta.ControlSize.L: return 48
            default: return 32
        }
    }

    color: control.enabled ? ConstaTheme.palette.control_typo_default : ConstaTheme.palette.control_typo_disable
    selectionColor: ConstaTheme.palette.typo_brand
    selectedTextColor: ConstaTheme.palette.control_typo_primary
    placeholderTextColor: control.enabled ? ConstaTheme.palette.control_typo_placeholder : ConstaTheme.palette.control_typo_disable
    verticalAlignment: TextInput.AlignVCenter
    font.family: "Inter"
    font.pixelSize: switch(control.ConstaStyle.controlSize){
        case Consta.ControlSize.XS: return 12
        case Consta.ControlSize.S: return 14
        case Consta.ControlSize.M: return 16
        case Consta.ControlSize.L: return 18
        default: return 14
    }

    PlaceholderText {
        id: placeholder
        x: control.leftPadding
        y: control.topPadding
        width: control.width - (control.leftPadding + control.rightPadding)
        height: control.height - (control.topPadding + control.bottomPadding)

        text: control.placeholderText
        font: control.font
        color: control.placeholderTextColor
        verticalAlignment: control.verticalAlignment
        visible: !control.length && !control.preeditText && (!control.activeFocus || control.horizontalAlignment !== Qt.AlignHCenter)
        elide: Text.ElideRight
        renderType: control.renderType
    }

    background: RoundedFrame {
        implicitWidth: 300
        implicitHeight: internal.height
        radiusTL: switch(control.ConstaStyle.buttonForm){
            case Consta.ButtonForm.Default:
            case Consta.ButtonForm.DefaultBrick: return 4;
            case Consta.ButtonForm.Round:
            case Consta.ButtonForm.RoundBrick: return internal.height/2
            default: return 0;
        }
        radiusBL: switch(control.ConstaStyle.buttonForm){
            case Consta.ButtonForm.Default:
            case Consta.ButtonForm.DefaultBrick: return 4;
            case Consta.ButtonForm.Round:
            case Consta.ButtonForm.RoundBrick: return internal.height/2
            default: return 0;
        }
        radiusTR: switch(control.ConstaStyle.buttonForm){
            case Consta.ButtonForm.Default:
            case Consta.ButtonForm.BrickDefault: return 4;
            case Consta.ButtonForm.Round:
            case Consta.ButtonForm.BrickRound: return internal.height/2
            default: return 0;
        }
        radiusBR: switch(control.ConstaStyle.buttonForm){
            case Consta.ButtonForm.Default:
            case Consta.ButtonForm.BrickDefault: return 4;
            case Consta.ButtonForm.Round:
            case Consta.ButtonForm.BrickRound: return internal.height/2
            default: return 0;
        }
        borderWidth: 1
        color: control.enabled ? ConstaTheme.palette.control_bg_default : ConstaTheme.palette.control_bg_disable
        borderColor: {
            if(!control.enabled) return ConstaTheme.palette.control_bg_border_disable
            if(control.activeFocus) return ConstaTheme.palette.control_bg_border_focus
            if(control.hovered) return ConstaTheme.palette.control_bg_border_default_hover
            return ConstaTheme.palette.control_bg_border_default
        }
    }
}