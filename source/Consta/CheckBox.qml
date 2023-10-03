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

    padding: 0
    spacing: control.ConstaStyle.controlSize == Consta.ControlSize.L ? 12 : 8
    activeFocusOnTab: true
    onPressed: forceActiveFocus(control)

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
        property int iconSize: switch(control.ConstaStyle.controlSize){
           case Consta.ControlSize.XS: return 10;
           case Consta.ControlSize.S: return 12;
           case Consta.ControlSize.M: return 14;
           case Consta.ControlSize.L: return 16;
           default: return 12;
       }
    }

    indicator: Rectangle {
        implicitWidth: internal.controlSize
        implicitHeight: internal.controlSize

        x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2

        color: {
            if(!control.enabled) return ConstaTheme.palette.control_bg_disable
            if(control.checkState == Qt.Unchecked) return "transparent"
            if(control.hovered || control.down) return internal.hoverColor
            return internal.normalColor
        }

        border.width: 1
        border.color: {
            if(!control.enabled) return "transparent"
            if(control.hovered && (internal.ghost || control.checkState == Qt.Unchecked))
                return ConstaTheme.palette.control_bg_border_default_hover
            if(internal.ghost) return ConstaTheme.palette.control_bg_border_default
            if(control.checkState == Qt.Unchecked) return ConstaTheme.palette.control_bg_border_default
            return "transparent"
        }
        radius: 4

        ConstaIcon {
            anchors.centerIn: parent
            visible: control.checkState != Qt.Unchecked
            size: internal.iconSize
            source: control.checkState == Qt.PartiallyChecked ?
                        "qrc:/Consta/icons/controls/checkbox_intermediate.svg" :
                        "qrc:/Consta/icons/controls/checkbox_check.svg"
            color: {
                if(!control.enabled) return ConstaTheme.palette.control_typo_disable
                if(internal.ghost) return ConstaTheme.palette.control_typo_ghost
                else return ConstaTheme.palette.control_typo_primary
            }
        }

        FocusRectangle {
            anchors.centerIn: parent
            width: parent.width + 8
            height: parent.height + 8
            radius: 4
            visible: control.activeFocus
            antialiasing: true
        }
    }

    contentItem: Label {
        leftPadding: control.indicator && !control.mirrored ? control.indicator.width + control.spacing : 0
        rightPadding: control.indicator && control.mirrored ? control.indicator.width + control.spacing : 0
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
        text: control.text
        font.pixelSize: switch(control.ConstaStyle.controlSize){
            case Consta.ControlSize.XS: return 12;
            case Consta.ControlSize.S: return 14;
            case Consta.ControlSize.M: return 16;
            case Consta.ControlSize.L: return 18;
            default: return 14;
        }
    }
}