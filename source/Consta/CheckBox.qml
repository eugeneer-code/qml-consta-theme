import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import Consta

T.CheckBox {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)

    padding: 6
    spacing: 6

    QtObject {
        id: internal
        property bool ghost: control.ConstaStyle.controlType == Consta.ControlType.Ghost
        property color normalColor: ghost ? ConstaTheme.palette.control_bg_ghost : ConstaTheme.palette.control_bg_primary
        property color hoverColor: ghost ? ConstaTheme.palette.control_bg_ghost_hover : ConstaTheme.palette.control_bg_primary_hover
        property int controlSize: switch(control.ConstaStyle.controlSize){
            case Consta.ControlSize.XS: return 12;
            case Consta.ControlSize.S: return 14;
            case Consta.ControlSize.M: return 16;
            case Consta.ControlSize.L: return 20;
            default: return 14;
        }
    }

    indicator: Rectangle {
        implicitWidth: internal.controlSize
        implicitHeight: internal.controlSize

        x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2

        color: {
            if(!control.enabled) return ConstaTheme.palette.control_bg_disable
            if(!control.checked) return "transparent"
            if(control.hovered || control.down) return internal.hoverColor
            return internal.normalColor
        }

        border.width: 1
        border.color: {
            if(!control.enabled) return "transparent"
            if(internal.ghost) return ConstaTheme.palette.control_bg_border_default
            if(!control.checked) return ConstaTheme.palette.control_bg_border_default
            return "transparent"
        }
        radius: 4

        Image {
            anchors.fill: parent
            source: "qrc:/Consta/icons/controls/checkbox_check.svg"
        }
    }

    contentItem: CheckLabel {
        leftPadding: control.indicator && !control.mirrored ? control.indicator.width + control.spacing : 0
        rightPadding: control.indicator && control.mirrored ? control.indicator.width + control.spacing : 0

        text: control.text
        font: control.font
        color: control.palette.windowText
    }
}