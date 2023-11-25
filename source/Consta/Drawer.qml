import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import Consta

T.Drawer {
    id: control

    parent: T.Overlay.overlay

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)

    topPadding: control.edge === Qt.BottomEdge
    leftPadding: control.edge === Qt.RightEdge
    rightPadding: control.edge === Qt.LeftEdge
    bottomPadding: control.edge === Qt.TopEdge

    enter: Transition { SmoothedAnimation { velocity: 5 } }
    exit: Transition { SmoothedAnimation { velocity: 5 } }

    background: Rectangle {
        color: ConstaTheme.palette.bg_default
    }

    T.Overlay.modal: Rectangle {
        color: ConstaTheme.palette.bg_tone
    }

    T.Overlay.modeless: Rectangle {
        color: ConstaTheme.palette.bg_tone
    }
}