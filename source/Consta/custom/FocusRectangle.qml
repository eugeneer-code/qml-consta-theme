import QtQuick
import QtQuick.Shapes
import Consta

Item {
    id: root
    property int radius: 0
    property int radiusTL: -1
    property int radiusTR: -1
    property int radiusBL: -1
    property int radiusBR: -1

    onVisibleChanged: {
        if(visible){
            borderOpacity = 1.0
            borderOpacity2 = 0.0
            borderOpacity3 = 1.0
        }
    }

    property real borderWidth: visible ? 3 : 0
    property real borderWidth2: visible ? 6 : 0
    property real borderWidth3: visible ? 6 : 0
    property real borderOpacity: 1.0
    property real borderOpacity2: 1.0
    property real borderOpacity3: 1.0

    Behavior on borderWidth {
        SequentialAnimation {
            PauseAnimation { duration: 150 }
            NumberAnimation { duration: 150 }
        }
    }

    Behavior on borderWidth2 {
        ParallelAnimation {
            SequentialAnimation {
                PauseAnimation { duration: 100 }
                NumberAnimation { duration: 400 }
            }
            SequentialAnimation {
                PauseAnimation { duration: 300 }
                PropertyAnimation { target: root; property: "borderOpacity2"; to: 0; duration: 150 }
            }
        }
    }

    Behavior on borderWidth3 {
        ParallelAnimation {
            SequentialAnimation {
                PauseAnimation { duration: 0 }
                NumberAnimation { duration: 450 }
            }
            SequentialAnimation {
                PauseAnimation { duration: 300 }
                PropertyAnimation { target: root; property: "borderOpacity3"; to: 0; duration: 150 }
            }
        }
    }


    Repeater {
        model: 3

        Item {
            id: rect
            anchors.centerIn: root
            property real borderWidth: switch(index){
                case 0: return root.borderWidth3
                case 1: return root.borderWidth2
                case 2: return root.borderWidth
            }
            opacity: switch(index){
                case 0: return root.borderOpacity3
                case 1: return root.borderOpacity2
                case 2: return root.borderOpacity
            }
            width: root.width + rect.borderWidth*2
            height: root.height + rect.borderWidth*2

            RoundedFrame {
                anchors.fill: parent
                radius: root.radius * 1.5
                radiusTL: root.radiusTL * 1.5
                radiusTR: root.radiusTR * 1.5
                radiusBL: root.radiusBL * 1.5
                radiusBR: root.radiusBR * 1.5
                borderWidth: rect.borderWidth
                borderColor: ConstaTheme.palette.control_bg_focus
                color: "transparent"
            }
        }
    }
}