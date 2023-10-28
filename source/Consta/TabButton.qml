import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T

T.TabButton {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding + 2)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    padding: 6
    spacing: 8

    icon.width: internal.iconSize
    icon.height: internal.iconSize
    icon.color: internal.textColor
    font.family: ConstaTheme.fontFamily
    font.pixelSize: switch(control.ConstaStyle.controlSize){
        case Consta.ControlSize.XS: return 12
        case Consta.ControlSize.S: return 14
        case Consta.ControlSize.M: return 16
        default: return 12
    }

    QtObject {
        id: internal
        property int height: switch(control.ConstaStyle.controlSize){
            case Consta.ControlSize.XS: return 32
            case Consta.ControlSize.S: return 38
            case Consta.ControlSize.M: return 40
            default: return 38
        }
        property int iconSize: switch(control.ConstaStyle.controlSize){
            case Consta.ControlSize.XS: return 12
            case Consta.ControlSize.S: return 12
            case Consta.ControlSize.M: return 16
            default: return 12
        }
        property color textColor: {
            if(!enabled) return ConstaTheme.palette.control_typo_disable
            if(checked) return ConstaTheme.palette.typo_primary
            return ConstaTheme.palette.typo_secondary
        }
        property bool clear: control.ConstaStyle.controlType === Consta.ControlType.Clear
    }

    contentItem: IconLabel {
        spacing: control.spacing
        icon: control.icon
        text: control.text
        font: control.font
        color: internal.textColor
    }

    background: Rectangle {
        implicitHeight: internal.height
        color: ConstaTheme.palette.bg_default
        Rectangle {
            anchors.bottom: parent.bottom
            height: 1
            width: parent.width
            color: enabled ? ConstaTheme.palette.bg_border : ConstaTheme.palette.control_typo_disable
            visible: !internal.clear
        }
        Rectangle {
            anchors.bottom: parent.bottom
            height: 2
            width: parent.width - 2*padding
            x: padding
            color: ConstaTheme.palette.control_bg_primary
            visible: checked && enabled
        }
    }
}