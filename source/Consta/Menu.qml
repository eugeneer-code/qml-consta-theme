import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import Qt5Compat.GraphicalEffects
import Consta
import QtQuick.Controls as C

T.Menu {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
        contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
        contentHeight + topPadding + bottomPadding)

    margins: 0
    overlap: 1

    delegate: MenuItem { }

    contentItem: ListView {
        implicitHeight: contentHeight
        model: control.contentModel
        interactive: Window.window
            ? contentHeight + control.topPadding + control.bottomPadding > Window.window.height
            : false
        clip: true
        currentIndex: control.currentIndex

        C.ScrollIndicator.vertical: C.ScrollIndicator {}
    }

    background:  Item {
        implicitWidth: 100
        implicitHeight: 40
        DropShadow {
            anchors.fill: parent
            horizontalOffset: 0
            verticalOffset: 2
            radius: 14.0
            samples: 17
            spread: 0.1
            color: ConstaTheme.palette.shadow_group_2
            source: rect
        }
        Rectangle {
            id: rect
            anchors.fill: parent
            color: ConstaTheme.palette.bg_default
            border.color: ConstaTheme.palette.bg_border
            border.width: 1
            radius: 4
        }
    }

    T.Overlay.modal: Rectangle {
        color: ConstaTheme.palette.bg_tone
    }

    T.Overlay.modeless: Rectangle {
        color: ConstaTheme.palette.bg_tone
    }
}