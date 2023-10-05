#include "RoundedRectangle.h"
#include <algorithm>
#include <QPainter>
#include <QPainterPath>

RoundedRectangle::RoundedRectangle(QQuickItem *parent)
    : QQuickPaintedItem{parent}, m_Color{QColor{"red"}}, m_BorderColor{
                                                      QColor{"transparent"}} {
}

void RoundedRectangle::paint(QPainter *painter)
{
    painter->setBrush(m_Color);
    painter->setPen(Qt::NoPen);
    painter->setRenderHint(QPainter::Antialiasing);
    qreal W = size().width();
    qreal H = size().height();
    qreal tl = m_Radius, tr = m_Radius, bl = m_Radius, br = m_Radius;
    if(m_RadiusTL != -1) tl = m_RadiusTL;
    if(m_RadiusBL != -1) bl = m_RadiusBL;
    if(m_RadiusBR != -1) br = m_RadiusBR;
    if(m_RadiusTR != -1) tr = m_RadiusTR;
    QPainterPath path;
    path.moveTo(tl, 0);
    path.lineTo(W - tr, 0);
    path.arcTo(W - tr*2, 0, tr*2, tr*2, 90, -90);
    path.lineTo(W, H - br);
    path.arcTo(W - br*2, H - br*2, br*2, br*2, 0, -90);
    path.lineTo(bl, H);
    path.arcTo(0, H - bl*2, bl*2, bl*2, 270, -90);
    path.lineTo(0, tl);
    path.arcTo(0, 0, tl*2, tl*2, 180, -90);
    path.closeSubpath();
    painter->fillPath(path, painter->brush());
}

void RoundedRectangle::setColor(QColor c) {
  if (c != m_Color) {
    m_Color = c;
    emit colorChanged(m_Color);
    update();
  }
}

void RoundedRectangle::setBorderColor(QColor c) {
  if (c != m_BorderColor) {
    m_BorderColor = c;
    emit borderColorChanged(m_BorderColor);
    update();
  }
}

void RoundedRectangle::setBorderWidth(qreal bw) {
  if (bw != m_BorderWidth) {
    m_BorderWidth = bw;
    emit borderWidthChanged(m_BorderWidth);
    update();
  }
}

void RoundedRectangle::setRadius(qreal r) {
  if (r != m_Radius) {
    m_Radius = r;
    emit radiusChanged(m_RadiusTL);
    update();
  }
}

void RoundedRectangle::setRadiusTL(qreal r) {
  if (r != m_RadiusTL) {
    m_RadiusTL = r;
    emit radiusTLChanged(m_RadiusTL);
    update();
  }
}

void RoundedRectangle::setRadiusTR(qreal r) {
  if (r != m_RadiusTR) {
    m_RadiusTR = r;
    emit radiusTRChanged(m_RadiusTR);
    update();
  }
}

void RoundedRectangle::setRadiusBL(qreal r) {
  if (r != m_RadiusBL) {
    m_RadiusBL = r;
    emit radiusBLChanged(m_RadiusBL);
    update();
  }
}

void RoundedRectangle::setRadiusBR(qreal r) {
  if (r != m_RadiusBR) {
    m_RadiusBR = r;
    emit radiusBRChanged(m_RadiusBR);
    update();
  }
}
