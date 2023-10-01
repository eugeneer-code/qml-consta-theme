#ifndef QML_CONSTA_THEME_UTILS_H
#define QML_CONSTA_THEME_UTILS_H
#include <QObject>
#include <QColor>

namespace consta {

class Utils : public QObject {
    Q_OBJECT
public:
    Utils(QObject* parent = nullptr);
    /**
	 * @brief Change alpha channel in color
	 * @param color Can be retrieve from QML as string
	 * @param alpha alpha channel value in range [0; 1]
	 */
    Q_INVOKABLE static QColor alpha(QColor color, double alpha);

    /**
     * @brief Change HSLA values of given color
     * @param color Original QColor
     * @param h, s, l, a  can be absolute ("23", "230"), diff ("-5", "+40"), percentage diff ("-10%", "+5%")
     * h is in range [0;360]
     * s, l, a in range [0;100]
     */
    Q_INVOKABLE static QColor hsla(QColor color, QString h, QString s, QString v, QString a);

};

}

#endif //QML_CONSTA_THEME_UTILS_H
