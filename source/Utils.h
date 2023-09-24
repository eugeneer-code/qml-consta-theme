#ifndef QML_CONSTA_THEME_UTILS_H
#define QML_CONSTA_THEME_UTILS_H
#include <QObject>
#include <QColor>

class Utils : public QObject {
    Q_OBJECT
public:
    Utils(QObject* parent = nullptr);
    /**
	 * @brief Change alpha channel in color
	 * @param color Can be retrieve from QML as string
	 * @param alpha alpha channel value in range [0; 1]
	 */
    Q_INVOKABLE static QColor getAlphaColor(QColor color, double alpha);

    /**
     * @brief Change HSVA values of given color
     * @param color Original QColor
     * @param h Hue, integer diff
     * @param s Saturation, integer diff
     * @param l Lightness, integer diff
     * @param a New alpha channel value in range [0; 1]
     */
    Q_INVOKABLE static QColor hsla(QColor color, int h, int s, int v, double a = 1.0);

};


#endif //QML_CONSTA_THEME_UTILS_H
