#ifndef QML_CONSTA_THEME_CONSTASTYLE_H
#define QML_CONSTA_THEME_CONSTASTYLE_H
#include <QObject>
#include <QtQml>

namespace consta {

class ConstaStyle : public QObject {
    Q_OBJECT
    Q_PROPERTY(int textStyle READ textStyle WRITE setTextStyle NOTIFY tsChanged)

signals:
    void tsChanged();

public:
    ConstaStyle(QObject* parent = nullptr);

    static ConstaStyle* qmlAttachedProperties(QObject* object);

    int textStyle() const;
    void setTextStyle(int style);

private:
    int _textStyle;
};

}

QML_DECLARE_TYPEINFO(consta::ConstaStyle, QML_HAS_ATTACHED_PROPERTIES)

#endif //QML_CONSTA_THEME_CONSTASTYLE_H
