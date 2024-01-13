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
    Q_PROPERTY(int buttonForm READ buttonForm WRITE setButtonForm NOTIFY bfChanged)
    Q_PROPERTY(bool hasError READ hasError WRITE setHasError NOTIFY heChanged)

signals:
    void tsChanged();
    void btChanged();
    void ctChanged();
    void csChanged();
    void bfChanged();
    void heChanged();

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

    int buttonForm() const;
    void setButtonForm(int form);

    bool hasError() const;
    void setHasError(bool error);

private:
    int _textStyle;
    bool _boldText;
    int _controlType;
    int _controlSize;
    int _buttonForm;
    bool _hasError;
};

}

QML_DECLARE_TYPEINFO(consta::ConstaStyle, QML_HAS_ATTACHED_PROPERTIES)

#endif //QML_CONSTA_THEME_CONSTASTYLE_H
