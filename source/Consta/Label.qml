import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import Consta

T.Label {
    id: control

    color: ConstaTheme.palette.typo_primary

    font.family: "Inter"
    font.pixelSize: switch(control.ConstaStyle.textStyle){
        case Consta.TextStyle.Headline_1: return 16;
        case Consta.TextStyle.Subheadline: return 14;
        case Consta.TextStyle.Headline_2: return 12;
        case Consta.TextStyle.Body: return 14;
        case Consta.TextStyle.Caption_1: return 12;
        case Consta.TextStyle.Caption_2: return 10;
        case Consta.TextStyle.Title_1: return 32;
        case Consta.TextStyle.Title_2: return 24;
        case Consta.TextStyle.Title_3: return 20;
        case Consta.TextStyle.Subtitle_1: return 18;
        case Consta.TextStyle.Subtitle_2: return 16;
    }

}