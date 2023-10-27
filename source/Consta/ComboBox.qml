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
    selectTextByMouse: true

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
            case Consta.ControlSize.XS: return hasRadius ? 12 : 6
            case Consta.ControlSize.S: return hasRadius ? 12 : 8
            case Consta.ControlSize.M: return hasRadius ? 16 : 10
            case Consta.ControlSize.L: return hasRadius ? 20 : 12
            default: return hasRadius ? 12 : 8
        }
        property bool hasRadius: control.ConstaStyle.buttonForm === Consta.ButtonForm.Round ||
                                 control.ConstaStyle.buttonForm === Consta.ButtonForm.RoundBrick
    }

    delegate: ItemDelegate {
        ConstaStyle.controlSize: control.ConstaStyle.controlSize
        width: ListView.view.width
        text: control.textRole ? (Array.isArray(control.model) ? modelData[control.textRole] : model[control.textRole]) : modelData
        highlighted: control.currentIndex === index
        hoverEnabled: control.hoverEnabled
    }

    indicator: ConstaIcon {
        x: control.width - (internal.height + width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2
        color: ConstaTheme.palette.control_typo_placeholder
        size: 24
        source: "qrc:/Consta/icons/controls/combobox_arrow.svg"
        rotation: control.popup.visible ? 180 : 0
    }

    contentItem: T.TextField {
        leftPadding: 0
        rightPadding: 1

        text: control.editable ? control.editText : control.displayText

        enabled: control.editable
        autoScroll: control.editable
        readOnly: control.down
        inputMethodHints: control.inputMethodHints
        validator: control.validator
        selectByMouse: control.selectTextByMouse
        verticalAlignment: Text.AlignVCenter
        color: control.enabled ? ConstaTheme.palette.control_typo_default : ConstaTheme.palette.control_typo_disable
        selectionColor: ConstaTheme.palette.typo_brand
        selectedTextColor: ConstaTheme.palette.control_typo_primary
        placeholderTextColor: control.enabled ? ConstaTheme.palette.control_typo_placeholder : ConstaTheme.palette.control_typo_disable
        font.family: "Inter"
        font.pixelSize: switch(control.ConstaStyle.controlSize){
            case Consta.ControlSize.XS: return 12
            case Consta.ControlSize.S: return 14
            case Consta.ControlSize.M: return 16
            case Consta.ControlSize.L: return 18
            default: return 14
        }

        background: Item{}
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

        contentItem: Item{
            implicitHeight: listView.contentHeight + 2
            ListView {
                id: listView
                clip: true
                width: parent.width - 2
                height: parent.height - 2
                x: 1
                y: 1
                model: control.delegateModel
                currentIndex: control.highlightedIndex
                highlightMoveDuration: 0
                T.ScrollIndicator.vertical: ScrollIndicator { }
            }
        }

        background: Rectangle {
            color: ConstaTheme.palette.control_bg_default
            border.width: 1
            border.color: ConstaTheme.palette.control_bg_border_default
            //radius: 4
        }
    }
}
