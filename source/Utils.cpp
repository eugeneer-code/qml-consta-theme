#include "Utils.h"

Utils::Utils(QObject* parent)
    : QObject(parent)
{
}

QColor Utils::alpha(QColor color, double alpha)
{
    color.setAlphaF(alpha);
    return color;
}

QColor Utils::hsla(QColor color, QString h, QString s, QString l, QString a)
{
    auto getDiff = [](QString& str, int& value, int maxValue) {
        if (str.startsWith("-") || str.startsWith("+")) {
            int diff = 0;
            if (str.endsWith("%")) {
                diff = str.mid(1, str.length() - 2).toInt() * value / 100;
            } else {
                diff = str.mid(1, str.length() - 1).toInt() * maxValue / 100;
            }
            if (str.startsWith("-")) diff = -diff;
            value += diff;
        }
        else{
            value = str.toInt() * maxValue / 100;
        }
    };

    int newH = color.hue(), newS = color.saturation(), newL = color.lightness();
    getDiff(h, newH, 100);
    getDiff(s, newS, 255);
    getDiff(l, newL, 255);
    if(newH < 0) newH=0; if(newH > 360) newH=360;
    if(newS < 0) newS=0; if(newS > 255) newS=255;
    if(newL < 0) newL=0; if(newL > 255) newL=255;

    color.setHsl(newH, newS, newL);
    int newA = a.remove("%").toInt();
    color.setAlphaF(newA/100.0);
    return color;
}
