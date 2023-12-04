import QtQuick
import Qt5Compat.GraphicalEffects
import Consta

/*
 * Контейнер с подписями (заголовок + описание)
 */
Item {
    id: control

    property string title              // название поля ввода
    property string description        // текст пояснения
    property bool hasError: false      // отобразить ошибку
    default property alias object: container.children

    readonly property real topOffset: title.length > 0 ? 24 : 0
    readonly property real bottomOffset: description.length > 0 ? 24 : 0
    implicitWidth: {
        if(title.length > 0) return Math.max(container.width, titleLabel.implicitWidth)
        return container.width
    }
    implicitHeight: container.height + topOffset + bottomOffset

    Label {
        id: titleLabel
        y: 0
        text: control.title
        color: {
            if(!control.enabled) return ConstaTheme.palette.control_typo_disable
            return ConstaTheme.palette.typo_secondary
        }
        visible: text.length > 0
        font.weight: Text.Normal
        font.pixelSize: 13
    }

    Item {
        id: container
        x: 0
        y: topOffset
        width: childrenRect.width
        height: childrenRect.height
    }

    Label {
        id: descrLabel
        x: 8
        y: topOffset + container.height + 2
        text: control.description
        color: {
            if(!control.enabled) return ConstaTheme.palette.control_typo_disable
            if(hasError) return ConstaTheme.palette.typo_alert
            return ConstaTheme.palette.typo_ghost
        }
        visible: text.length > 0
        font.weight: Text.Normal
        font.pixelSize: 13
    }
}
