import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Consta

Item {

    property var textModel: [
        {value: Consta.TextStyle.Headline_1, name: "Headline_1"},
        {value: Consta.TextStyle.Subheadline, name: "Subheadline"},
        {value: Consta.TextStyle.Headline_2, name: "Headline_2"},
        {value: Consta.TextStyle.Body, name: "Body"},
        {value: Consta.TextStyle.Caption_1, name: "Caption_1"},
        {value: Consta.TextStyle.Caption_2, name: "Caption_2"},
        {value: Consta.TextStyle.Title_1, name: "Title_1"},
        {value: Consta.TextStyle.Title_2, name: "Title_2"},
        {value: Consta.TextStyle.Title_3, name: "Title_3"},
        {value: Consta.TextStyle.Subtitle_1, name: "Subtitle_1"},
        {value: Consta.TextStyle.Subtitle_2, name: "Subtitle_2"}
    ]

    Flickable {
        anchors.fill: parent
        contentHeight: column.height + column.y + 12
        clip: true
        boundsBehavior: Flickable.StopAtBounds
        ScrollBar.vertical: ScrollBar{}
        CheckBox{
            id: checkBox
            x: 12
            y: 12
            text: "Bold text"
        }
        Column {
            id: column
            x: 12
            y: 60
            spacing: 12
            Repeater {
                model: textModel
                Label {
                    id: label
                    text: modelData.name
                    ConstaStyle.textStyle: modelData.value
                    ConstaStyle.boldText: checkBox.checked
                }
            }
        }
    }

}