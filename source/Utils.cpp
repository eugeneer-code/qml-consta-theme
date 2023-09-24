#include "Utils.h"

Utils::Utils(QObject* parent)
    : QObject(parent)
{
}

QColor Utils::getAlphaColor(QColor color, double alpha)
{
    color.setAlphaF(alpha);
    return color;
}

QColor Utils::hsla(QColor color, int h, int s, int l, double a)
{
    color.setHsl(
            color.hue() + h,
            color.saturation() + s*2.55,
            color.lightness() + l*2.55
            );
    color.setAlphaF(a);
    return color;
}
