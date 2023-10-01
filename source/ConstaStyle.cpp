#include "ConstaStyle.h"

using namespace consta;

ConstaStyle::ConstaStyle(QObject* parent)
    : QObject(parent),
    _textStyle(3),
    _boldText(false)
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