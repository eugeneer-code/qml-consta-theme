import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import Consta

Item {

    property var bgColors: [
        {name: "bg_default", value: ConstaTheme.palette.bg_default},
        {name: "bg_secondary", value: ConstaTheme.palette.bg_secondary},
        {name: "bg_brand", value: ConstaTheme.palette.bg_brand},
        {name: "bg_link", value: ConstaTheme.palette.bg_link},
        {name: "bg_border", value: ConstaTheme.palette.bg_border},
        {name: "bg_stripe", value: ConstaTheme.palette.bg_stripe},
        {name: "bg_ghost", value: ConstaTheme.palette.bg_ghost},
        {name: "bg_tone", value: ConstaTheme.palette.bg_tone},
        {name: "bg_soft", value: ConstaTheme.palette.bg_soft},
        {name: "bg_system", value: ConstaTheme.palette.bg_system},
        {name: "bg_normal", value: ConstaTheme.palette.bg_normal},
        {name: "bg_success", value: ConstaTheme.palette.bg_success},
        {name: "bg_caution", value: ConstaTheme.palette.bg_caution},
        {name: "bg_warning", value: ConstaTheme.palette.bg_warning},
        {name: "bg_alert", value: ConstaTheme.palette.bg_alert},
        {name: "bg_critical", value: ConstaTheme.palette.bg_critical}
    ]

    property var typoColors: [
        {name: "typo_primary", value: ConstaTheme.palette.typo_primary},
        {name: "typo_secondary", value: ConstaTheme.palette.typo_secondary},
        {name: "typo_ghost", value: ConstaTheme.palette.typo_ghost},
        {name: "typo_brand", value: ConstaTheme.palette.typo_brand},
        {name: "typo_system", value: ConstaTheme.palette.typo_system},
        {name: "typo_normal", value: ConstaTheme.palette.typo_normal},
        {name: "typo_success", value: ConstaTheme.palette.typo_success},
        {name: "typo_caution", value: ConstaTheme.palette.typo_caution},
        {name: "typo_warning", value: ConstaTheme.palette.typo_warning},
        {name: "typo_alert", value: ConstaTheme.palette.typo_alert},
        {name: "typo_critical", value: ConstaTheme.palette.typo_critical},
        {name: "typo_link", value: ConstaTheme.palette.typo_link},
        {name: "typo_link_minor", value: ConstaTheme.palette.typo_link_minor},
        {name: "typo_link_hover", value: ConstaTheme.palette.typo_link_hover}
    ]

    property var controlColors: [
        {name: "scroll_bg", value: ConstaTheme.palette.scroll_bg},
        {name: "scroll_thumb", value: ConstaTheme.palette.scroll_thumb},
        {name: "scroll_thumb_hover", value: ConstaTheme.palette.scroll_thumb_hover},
        {name: "control_bg_default", value: ConstaTheme.palette.control_bg_default},
        {name: "control_typo_default", value: ConstaTheme.palette.control_typo_default},
        {name: "control_typo_placeholder", value: ConstaTheme.palette.control_typo_placeholder},
        {name: "control_bg_border_default", value: ConstaTheme.palette.control_bg_border_default},
        {name: "control_bg_border_default_hover", value: ConstaTheme.palette.control_bg_border_default_hover},
        {name: "control_bg_border_focus", value: ConstaTheme.palette.control_bg_border_focus},
        {name: "control_bg_focus", value: ConstaTheme.palette.control_bg_focus},
        {name: "control_bg_active", value: ConstaTheme.palette.control_bg_active},
        {name: "control_bg_primary", value: ConstaTheme.palette.control_bg_primary},
        {name: "control_bg_primary_hover", value: ConstaTheme.palette.control_bg_primary_hover},
        {name: "control_typo_primary", value: ConstaTheme.palette.control_typo_primary},
        {name: "control_typo_primary_hover", value: ConstaTheme.palette.control_typo_primary_hover},
        {name: "control_bg_secondary", value: ConstaTheme.palette.control_bg_secondary},
        {name: "control_bg_border_secondary", value: ConstaTheme.palette.control_bg_border_secondary},
        {name: "control_bg_border_secondary_hover", value: ConstaTheme.palette.control_bg_border_secondary_hover},
        {name: "control_typo_secondary", value: ConstaTheme.palette.control_typo_secondary},
        {name: "control_typo_secondary_hover", value: ConstaTheme.palette.control_typo_secondary_hover},
        {name: "control_bg_ghost", value: ConstaTheme.palette.control_bg_ghost},
        {name: "control_bg_ghost_hover", value: ConstaTheme.palette.control_bg_ghost_hover},
        {name: "control_typo_ghost", value: ConstaTheme.palette.control_typo_ghost},
        {name: "control_typo_ghost_hover", value: ConstaTheme.palette.control_typo_ghost_hover},
        {name: "control_bg_clear", value: ConstaTheme.palette.control_bg_clear},
        {name: "control_bg_clear_hover", value: ConstaTheme.palette.control_bg_clear_hover},
        {name: "control_typo_clear", value: ConstaTheme.palette.control_typo_clear},
        {name: "control_typo_clear_hover", value: ConstaTheme.palette.control_typo_clear_hover},
        {name: "control_bg_disable", value: ConstaTheme.palette.control_bg_disable},
        {name: "control_bg_border_disable", value: ConstaTheme.palette.control_bg_border_disable},
        {name: "control_typo_disable", value: ConstaTheme.palette.control_typo_disable}
    ]

    Component{
        id: colorDelegate
        Item {
            width: 250
            height: 60
            property bool isTransparent: modelData.value.a < 1.0
            Rectangle {
                id: rectShadow
                x: 5
                y: 5
                width: 50
                height: 50
                radius: width/2
                layer.enabled: true
                visible: false
                color: ConstaTheme.palette.bg_default
            }
            DropShadow {
                anchors.fill: rectShadow
                horizontalOffset: 2
                verticalOffset: 2
                radius: 8.0
                color: ConstaTheme.palette.shadow_layer_2
                source: rectShadow
            }
            Item{
                id: colorItem
                x: 5
                y: 5
                width: 50
                height: 50
                Image {
                    id: image
                    anchors.centerIn: parent
                    source: "qrc:/icons/rect_pattern.png"
                    visible: true
                    opacity: ConstaTheme.currentTheme == Consta.Theme.Default ? 1.0 : 0.1
                }
                Rectangle {
                    id: rect
                    x: isTransparent ? -0.75*width/2 : 0
                    y: isTransparent ? 0.75*height/2 : 0
                    width: 50
                    height: 50
                    radius: isTransparent ? 0 : width/2
                    color: modelData.value
                    rotation: isTransparent ? 45 : 0
                }
                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: Item {
                        width: colorItem.width
                        height: colorItem.height
                        Rectangle {
                            width: colorItem.width
                            height: colorItem.height
                            radius: width/2
                        }
                    }
                }
            }

            Label {
                text: modelData.name
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                    leftMargin: 70
                }
            }
        }
    }

    Flickable {
        anchors.fill: parent
        contentHeight: column.height
        clip: true
        boundsBehavior: Flickable.StopAtBounds
        ScrollBar.vertical: ScrollBar{}
        Column {
            id: column
            x: 12
            y: 12
            width: parent.width - 24
            spacing: 12
            Label {
                text: "Background colors"
            }
            Flow {
                width: parent.width
                Repeater {
                    model: bgColors
                    delegate: colorDelegate
                }
            }

            Label {
                text: "Typography colors"
            }
            Flow {
                width: parent.width
                Repeater {
                    model: typoColors
                    delegate: colorDelegate
                }
            }

            Label {
                text: "Control colors"
            }
            Flow {
                width: parent.width
                Repeater {
                    model: controlColors
                    delegate: colorDelegate
                }
            }
        }
    }
}