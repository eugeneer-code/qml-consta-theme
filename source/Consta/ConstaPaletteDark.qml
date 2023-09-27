import QtQuick

/**
 * Colors definition for Default theme
 * All colors are from css source code: https://github.com/consta-design-system/uikit/blob/master/src/components/Theme/_color/Theme_color_gpnDark.css
 */
QtObject {
    property color project: "#0071b2"

    // Base colors
    property color base: "#fff"
    property color essential: "#22272b"
    property color phantom: "#f6fbfd"
    property color path: "#0078d2"
    property color system: "#4b5963"
    property color shadow: "#000"

    property color success: "#22c38e"
    property color alert: "#f54d4d"
    property color warning: "#f38b00"
    property color caution: "#f2c94c"
    property color normal: "#0aa5ff"
    property color critical: "#33000f"

    // Background colors
    property color bg_default: essential
    property color bg_secondary: _ConstaUtils.hsla(essential, "+0", "+0", "-5", "100%")
    property color bg_brand: project
    property color bg_link: path
    property color bg_border: _ConstaUtils.hsla(phantom, "+0", "+0", "+10", "20%")
    property color bg_stripe: _ConstaUtils.alpha(phantom, 0.06)
    property color bg_ghost: _ConstaUtils.alpha(phantom, 0.1)
    property color bg_tone: _ConstaUtils.hsla(phantom, "+0", "+0", "-92%", "85%")
    property color bg_soft: _ConstaUtils.hsla(essential, "+0", "+0", "+100%", "90%")
    property color bg_system: _ConstaUtils.hsla(system, "219", "8", "33", "100%")
    property color bg_normal: normal
    property color bg_success: success
    property color bg_caution: caution
    property color bg_warning: warning
    property color bg_alert: _ConstaUtils.hsla(alert, "+0", "+10", "+0", "100%")
    property color bg_critical: critical

    // Typography colors
    property color typo_primary: _ConstaUtils.hsla(base, "+0", "+0", "-2", "100%")
    property color typo_secondary: _ConstaUtils.alpha(base, 0.6)
    property color typo_ghost: _ConstaUtils.alpha(base, 0.3)
    property color typo_brand: project
    property color typo_system: _ConstaUtils.hsla(system, "219", "14", "45", "100%")
    property color typo_normal: _ConstaUtils.hsla(normal, "+0", "+14", "-4", "100%")
    property color typo_success: _ConstaUtils.hsla(success, "+0", "+14", "-8", "100%")
    property color typo_caution: _ConstaUtils.hsla(caution, "+0", "+7", "-3", "100%")
    property color typo_warning: _ConstaUtils.hsla(warning, "+0", "+7", "-3", "100%")
    property color typo_alert: _ConstaUtils.hsla(alert, "+0", "+3", "-3", "100%")
    property color typo_critical: _ConstaUtils.hsla(critical, "+0", "+0", "+9%", "100%")
    property color typo_link: _ConstaUtils.hsla(path, "-2", "+0", "+12%", "100%")
    property color typo_link_minor: _ConstaUtils.hsla(path, "-2", "-55%", "+20%", "100%")
    property color typo_link_hover: _ConstaUtils.hsla(path, "-2", "+0", "+26%", "100%")

    // Controls colors
    property color scroll_bg: _ConstaUtils.alpha(phantom, 0.06)
    property color scroll_thumb: _ConstaUtils.alpha(phantom, 0.24)
    property color scroll_thumb_hover: _ConstaUtils.alpha(phantom, 0.32)
    property color control_bg_default: essential
    property color control_typo_default: _ConstaUtils.alpha(base, 0.8)
    property color control_typo_placeholder: _ConstaUtils.alpha(base, 0.35)
    property color control_bg_border_default: _ConstaUtils.alpha(phantom, 0.28)
    property color control_bg_border_default_hover: _ConstaUtils.alpha(phantom, 0.52)
    property color control_bg_border_focus: _ConstaUtils.hsla(path, "+0", "+0", "+10%", "100%")
    property color control_bg_focus: _ConstaUtils.alpha(path, 0.4)
    property color control_bg_active: _ConstaUtils.alpha(path, 0.7)
    property color control_bg_primary: path
    property color control_bg_primary_hover: _ConstaUtils.hsla(path, "+0", "+0", "+9%", "100%")
    property color control_typo_primary: _ConstaUtils.hsla(base, "+0", "+0", "+100%", "100%")
    property color control_typo_primary_hover: _ConstaUtils.hsla(base, "+0", "+0", "+100%", "100%")
    property color control_bg_secondary: _ConstaUtils.alpha(essential, 0)
    property color control_bg_border_secondary: path
    property color control_bg_border_secondary_hover: _ConstaUtils.hsla(path, "+0", "+0", "+9%", "100%")
    property color control_typo_secondary: _ConstaUtils.hsla(path, "-2", "+0", "+12%", "100%")
    property color control_typo_secondary_hover: _ConstaUtils.hsla(path, "-2", "+0", "+26%", "100%")
    property color control_bg_ghost: _ConstaUtils.hsla(phantom, "+0", "-100", "+0", "16%")
    property color control_bg_ghost_hover: _ConstaUtils.hsla(phantom, "+0", "-100", "+0", "23%")
    property color control_typo_ghost: _ConstaUtils.alpha(base, 0.75)
    property color control_typo_ghost_hover: _ConstaUtils.alpha(base, 0.9)
    property color control_bg_clear: _ConstaUtils.hsla(phantom, "+0", "-100", "+0", "0%")
    property color control_bg_clear_hover: _ConstaUtils.hsla(phantom, "+0", "-100", "+0", "23%")
    property color control_typo_clear: _ConstaUtils.alpha(base, 0.75)
    property color control_typo_clear_hover: _ConstaUtils.alpha(base, 0.9)
    property color control_bg_disable: _ConstaUtils.hsla(phantom, "+0", "-100", "+0", "16%")
    property color control_bg_border_disable: _ConstaUtils.hsla(phantom, "+0", "-100", "+0", "0%")
    property color control_typo_disable: _ConstaUtils.alpha(base, 0.24)

    // Shadow colors
    property color shadow_group_1: _ConstaUtils.alpha(shadow, 0.08)
    property color shadow_group_2: _ConstaUtils.alpha(shadow, 0.32)
    property color shadow_layer_1: _ConstaUtils.alpha(shadow, 0.08)
    property color shadow_layer_2: _ConstaUtils.alpha(shadow, 0.32)
    property color shadow_modal_1: _ConstaUtils.alpha(shadow, 0.08)
    property color shadow_modal_2: _ConstaUtils.alpha(shadow, 0.32)
}