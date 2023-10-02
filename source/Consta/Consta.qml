pragma Singleton
import QtQuick

/**
 *  Enums for using in Consta project
 */
Item {
    enum Theme {
        Default = 0,
        Dark,
        Display
    }

    enum TextStyle {
        Headline_1 = 0,
        Subheadline,
        Headline_2,
        Body,
        Caption_1,
        Caption_2,
        Title_1,
        Title_2,
        Title_3,
        Subtitle_1,
        Subtitle_2
    }

    enum Spacing {
        XS_3 = 2,
        XS_2 = 4,
        XS = 8,
        S = 12,
        M = 16,
        L = 20,
        XL = 24,
        XL_2 = 32,
        XL_3 = 40,
        XL_4 = 48,
        XL_5 = 72,
        XL_6 = 96
    }

    enum ControlSize {
        XS,
        S,
        M,
        L
    }

    enum ControlType {
        Primary,
        Ghost
    }
}