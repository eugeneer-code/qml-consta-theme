#include "ConstaStyle.h"

using namespace consta;

ConstaStyle::ConstaStyle(QObject* parent)
    : QObject(parent),
    _textStyle(3),
    _boldText(false),
    _controlType(0),
    _controlSize(1),
    _buttonForm(0)
{
}

ConstaStyle* ConstaStyle::qmlAttachedProperties(QObject* object)
{
    return new ConstaStyle(object);
}

int ConstaStyle::textStyle() const
{
    return _textStyle;
}

void ConstaStyle::setTextStyle(int style)
{
    _textStyle = style;
    emit tsChanged();
}

bool ConstaStyle::boldText() const
{
    return _boldText;
}

void ConstaStyle::setBoldText(bool bold)
{
    _boldText = bold;
    emit btChanged();
}

int ConstaStyle::controlType() const
{
    return _controlType;
}

void ConstaStyle::setControlType(int type)
{
    _controlType = type;
    emit ctChanged();
}

int ConstaStyle::controlSize() const
{
    return _controlSize;
}

void ConstaStyle::setControlSize(int size)
{
    _controlSize = size;
    emit csChanged();
}

int ConstaStyle::buttonForm() const
{
    return _buttonForm;
}

void ConstaStyle::setButtonForm(int form)
{
    _buttonForm = form;
    emit bfChanged();
}