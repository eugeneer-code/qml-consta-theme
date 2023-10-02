#ifndef QML_CONSTA_THEME_CONSTASTYLE_H
#define QML_CONSTA_THEME_CONSTASTYLE_H
#include <QObject>
#include <QtQml>

namespace consta {

class ConstaStyle : public QObject {
    Q_OBJECT
    Q_PROPERTY(int textStyle READ textStyle WRITE setTextStyle NOTIFY tsChanged)
    Q_PROPERTY(bool boldText READ boldText WRITE setBoldText NOTIFY btChanged)
    Q_PROPERTY(int controlType READ controlType WRITE setControlType NOTIFY ctChanged)
    Q_PROPERTY(int controlSize READ controlSize WRITE setControlSize NOTIFY csChanged)

signals:
    void tsChanged();
    void btChanged();
    void ctChanged();
    void csChanged();

public:
    ConstaStyle(QObject* parent = nullptr);

    static ConstaStyle* qmlAttachedProperties(QObject* object);

    int textStyle() const;
    void setTextStyle(int style);

    bool boldText() const;
    void setBoldText(bool bold);

    int controlType() const;
    void setControlType(int type);

    int controlSize() const;
    void setControlSize(int size);

private:
    int _textStyle;
    bool _boldText;
    int _controlType;
    int _controlSize;
};

}

QML_DECLARE_TYPEINFO(consta::ConstaStyle, QML_HAS_ATTACHED_PROPERTIES)

#endif //QML_CONSTA_THEME_CONSTASTYLE_H
