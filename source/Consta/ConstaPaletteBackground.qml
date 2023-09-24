import QtQuick

/**
 * Colors definition
 */
QtObject {
    property var currentTheme
    property color path
    property color project

    property color defaultColor: ConstaPalette.essential[currentTheme]
    property color secondary: _ConstaUtils.hsla(ConstaPalette.base[currentTheme], 0, -75, 59, 1)
    property color link: path
    property color brand: project
    property color normal: ConstaPalette.normal[currentTheme]
    property color system: ConstaPalette.system[currentTheme]
    property color success: ConstaPalette.success[currentTheme]
    property color caution: ConstaPalette.caution[currentTheme]
    property color warning: ConstaPalette.warning[currentTheme]
    property color alert: ConstaPalette.alert[currentTheme]
    property color critical: ConstaPalette.critical[currentTheme]
    property color stripe: _ConstaUtils.getAlphaColor(ConstaPalette.phantom[currentTheme], 0.05)
    property color tone: _ConstaUtils.getAlphaColor(ConstaPalette.tone[currentTheme], 0.85)
    property color soft: _ConstaUtils.getAlphaColor("#FFFFFF", 0.9)
    property color border: ConstaPalette.border[currentTheme]
    property color ghost: _ConstaUtils.getAlphaColor(ConstaPalette.phantom[currentTheme], 0.08)
    property color shadow: ConstaPalette.shadow[currentTheme]

}