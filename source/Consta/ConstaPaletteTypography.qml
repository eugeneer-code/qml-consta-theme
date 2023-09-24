import QtQuick

/**
 * Colors definition
 */
QtObject {
    property var currentTheme
    property color path
    property color project

    property color primary: ConstaPalette.textColor
    property color secondary: _ConstaUtils.getAlphaColor(ConstaPalette.base[currentTheme], 0.6)
    property color brand: project
    property color ghost: _ConstaUtils.getAlphaColor(ConstaPalette.base[currentTheme], 0.3)
   /* property color link:
    property color link_hover:
    property color link_minor:
    property color system:
    property color normal:
    property color success:
    property color warning:
    property color alert:
    property color caution:
    property color critical:*/
}