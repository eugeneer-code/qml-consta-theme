import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import QtQuick.Controls
import Consta

T.ComboBox {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: internal.height

    leftPadding: internal.padding + (!control.mirrored || !indicator || !indicator.visible ? 0 : indicator.width + spacing)
    rightPadding: internal.padding + (control.mirrored || !indicator || !indicator.visible ? 0 : indicator.width + spacing)

    QtObject {
        id: internal
        property int height: switch(control.ConstaStyle.controlSize){
            case Consta.ControlSize.XS: return 24
            case Consta.ControlSize.S: return 32
            case Consta.ControlSize.M: return 40
            case Consta.ControlSize.L: return 48
            default: return 32
        }
        property int padding: switch(control.ConstaStyle.controlSize){
            case Consta.ControlSize.XS: return 6
            case Consta.ControlSize.S: return 8
            case Consta.ControlSize.M: return 10
            case Consta.ControlSize.L: return 12
            default: return 8
        }
    }

    delegate: ItemDelegate {
        width: ListView.view.width
        text: control.textRole ? (Array.isArray(control.model) ? modelData[control.textRole] : model[control.textRole]) : modelData
        palette.text: control.palette.text
        palette.highlightedText: control.palette.highlightedText
        font.weight: control.currentIndex === index ? Font.DemiBold : Font.Normal
        highlighted: control.highlightedIndex === index
        hoverEnabled: control.hoverEnabled
    }

    indicator: ColorImage {
        x: control.mirrored ? control.padding : control.width - width - control.padding
        y: control.topPadding + (control.availableHeight - height) / 2
        color: control.palette.dark
        defaultColor: "#353637"
        source: "qrc:/qt-project.org/imports/QtQuick/Controls/Basic/images/double-arrow.png"
        opacity: enabled ? 1 : 0.3
    }

    contentItem: T.TextField {
        leftPadding: internal.padding
        rightPadding: 1

        text: control.editable ? control.editText : control.displayText

        enabled: control.editable
        autoScroll: control.editable
        readOnly: control.down
        inputMethodHints: control.inputMethodHints
        validator: control.validator
        selectByMouse: control.selectTextByMouse
        verticalAlignment: Text.AlignVCenter

        background: Rectangle {
            visible: control.enabled && control.editable
            border.width: parent && parent.activeFocus ? 2 : 1
            border.color: parent && parent.activeFocus ? control.palette.highlight : control.palette.button
            color: control.palette.base
        }
    }

    background: RoundedRectangle {
        implicitWidth: 200
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
        color: control.enabled ? ConstaTheme.palette.control_bg_default : ConstaTheme.palette.control_bg_disable
        borderColor: {
                    if(!control.enabled) return ConstaTheme.palette.control_bg_border_disable
                    if(control.activeFocus) return ConstaTheme.palette.control_bg_border_focus
                    if(control.hovered) return ConstaTheme.palette.control_bg_border_default_hover
                    return ConstaTheme.palette.control_bg_border_default
                }
        borderWidth: 1
    }

    popup: T.Popup {
        y: control.height
        width: control.width
        height: Math.min(contentItem.implicitHeight, control.Window.height - topMargin - bottomMargin)
        topMargin: 6
        bottomMargin: 6

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.delegateModel
            currentIndex: control.highlightedIndex
            highlightMoveDuration: 0

            Rectangle {
                z: 10
                width: parent.width
                height: parent.height
                color: "transparent"
                border.color: control.palette.mid
            }

            T.ScrollIndicator.vertical: ScrollIndicator { }
        }

        background: Rectangle {
            color: ConstaTheme.palette.control_bg_default
            border.width: 1
            border.color: ConstaTheme.palette.control_bg_border_default
            radius: 4
        }
    }
}