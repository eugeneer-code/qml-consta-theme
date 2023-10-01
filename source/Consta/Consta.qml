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
        Sp_3XS = 2,
        Sp_2XS = 4,
        Sp_XS = 8,
        Sp_S = 12,
        Sp_M = 16,
        Sp_L = 20,
        Sp_XL = 24,
        Sp_2L = 32,
        Sp_3XL = 40,
        Sp_4XL = 48,
        Sp_5XL = 72,
        Sp_6XL = 96
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