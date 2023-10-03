import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import Consta

T.Label {
    id: control

    color: enabled ? ConstaTheme.palette.typo_primary : ConstaTheme.palette.control_typo_disable

    QtObject{
        id: internal
        property bool bold: control.ConstaStyle.boldText
    }

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
        default: return 14;
    }
    font.capitalization: control.ConstaStyle.textStyle == Consta.TextStyle.Headline_2 ?
                Font.AllUppercase : Font.MixedCase

    font.weight: switch(control.ConstaStyle.textStyle){
         case Consta.TextStyle.Headline_1: return internal.bold ? Font.Bold : Font.DemiBold;
         case Consta.TextStyle.Subheadline: return internal.bold ? Font.Medium : Font.Normal;
         case Consta.TextStyle.Headline_2: return internal.bold ? Font.ExtraBold : Font.Bold;
         case Consta.TextStyle.Body: return internal.bold ? Font.DemiBold : Font.Normal;
         case Consta.TextStyle.Caption_1: return internal.bold ? Font.DemiBold : Font.Normal;
         case Consta.TextStyle.Caption_2: return internal.bold ? Font.DemiBold : Font.Normal;
         case Consta.TextStyle.Title_1: return internal.bold ? Font.Bold : Font.Normal;
         case Consta.TextStyle.Title_2: return internal.bold ? Font.DemiBold : Font.Normal;
         case Consta.TextStyle.Title_3: return internal.bold ? Font.Medium : Font.Normal;
         case Consta.TextStyle.Subtitle_1: return internal.bold ? Font.Medium : Font.Normal;
         case Consta.TextStyle.Subtitle_2: return internal.bold ? Font.Medium : Font.Normal;
         default: return Font.Normal;
     }

    lineHeight: switch(control.ConstaStyle.textStyle){
        case Consta.TextStyle.Headline_1: 1.5;
        case Consta.TextStyle.Subheadline: 1.5;
        case Consta.TextStyle.Headline_2: 1.4;
        case Consta.TextStyle.Body: return 1.5;
        case Consta.TextStyle.Caption_1: return 1.2;
        case Consta.TextStyle.Caption_2: return 1.2;
        case Consta.TextStyle.Title_1: return 1.2;
        case Consta.TextStyle.Title_2: return 1.5;
        case Consta.TextStyle.Title_3: return 1.5;
        case Consta.TextStyle.Subtitle_1: return 1.2;
        case Consta.TextStyle.Subtitle_2: return 1.2;
        default: return 1.5;
    }

}