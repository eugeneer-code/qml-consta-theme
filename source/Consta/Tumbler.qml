import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import Consta

T.Tumbler {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
        implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
        implicitContentHeight + topPadding + bottomPadding)

    delegate: Label {
        text: modelData
        color: index == currentIndex ? ConstaTheme.palette.typo_brand : ConstaTheme.palette.typo_primary
        font.pixelSize: 14 - 2*Math.abs(Tumbler.displacement)
        opacity: 1.0 - Math.abs(Tumbler.displacement) / (control.visibleItemCount / 2) + 0.5
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        // We use required property here to satisfy qmllint, but that means
        // we also need to declare the index for the attached properties
        // (see QQuickTumblerAttachedPrivate::init).
        required property var modelData
        required property int index
    }

    background: Item {
        property real itemHeight: height / control.visibleItemCount
        Rectangle {
            height: 1
            width: parent.width
            color: ConstaTheme.palette.bg_border
            y: (parent.height - parent.itemHeight)/2 - 4
        }
        Rectangle {
            height: 1
            width: parent.width
            color: ConstaTheme.palette.bg_border
            y: (parent.height + parent.itemHeight)/2 + 4
        }
    }

    contentItem: TumblerView {
        implicitWidth: 60
        implicitHeight: 200
        model: control.model
        delegate: control.delegate
        path: Path {
            startX: control.contentItem.width / 2
            startY: -control.contentItem.delegateHeight / 2
            PathLine {
                x: control.contentItem.width / 2
                y: (control.visibleItemCount + 1) * control.contentItem.delegateHeight - control.contentItem.delegateHeight / 2
            }
        }

        property real delegateHeight: control.availableHeight / control.visibleItemCount
    }
}