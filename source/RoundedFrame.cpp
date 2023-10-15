#include "RoundedFrame.h"
#include <algorithm>
#include <QPainter>
#include <QPainterPath>

RoundedFrame::RoundedFrame(QQuickItem *parent)
    : QQuickPaintedItem{parent},
    _color{QColor{"red"}},
    _borderColor{QColor{"transparent"}}
{
}

void RoundedFrame::paint(QPainter *painter)
{
    painter->setBrush(_color);
    painter->setPen(Qt::NoPen);
    painter->setRenderHint(QPainter::Antialiasing, true);
    painter->setRenderHint(QPainter::SmoothPixmapTransform, true);

    QPainterPath borderPath = rectPath(false);
    QPainterPath centralPath = rectPath(true);
    if(_borderWidth != 0 && _borderColor != QColor("transparent")) {
        QPainterPath clipPath = centralPath;
        clipPath.addRect(boundingRect());
        painter->setClipPath(clipPath);
        painter->fillPath(borderPath, _borderColor);
        painter->setClipPath(clipPath, Qt::NoClip);
    }
    if(_color != QColor("transparent")) {
        painter->fillPath(centralPath, _color);
    }
}

QPainterPath RoundedFrame::rectPath(bool border)
{
    qreal W = size().width();
    qreal H = size().height();
    qreal tl = _radius, tr = _radius, bl = _radius, br = _radius;
    if(_radiusTL >= 0) tl = _radiusTL;
    if(_radiusBL >= 0) bl = _radiusBL;
    if(_radiusBR >= 0) br = _radiusBR;
    if(_radiusTR >= 0) tr = _radiusTR;
    qreal B = border ? _borderWidth : 0;
    if(tl+B > H/2) tl = H/2 - B;
    if(tr+B > H/2) tr = H/2 - B;
    if(bl+B > H/2) bl = H/2 - B;
    if(br+B > H/2) br = H/2 - B;

    QPainterPath path;
    path.moveTo(tl + B, B);
    path.lineTo(W - tr - B, B);
    path.arcTo(W - tr*2 - B, B, tr*2, tr*2, 90, -90);
    path.lineTo(W-B, H - br - B);
    path.arcTo(W - br*2 - B, H - br*2 - B, br*2, br*2, 0, -90);
    path.lineTo(bl + B, H - B);
    path.arcTo(B, H - bl*2 - B, bl*2, bl*2, 270, -90);
    path.lineTo(B, tl + B);
    path.arcTo(B, B, tl*2, tl*2, 180, -90);
    path.closeSubpath();
    return path;
}

void RoundedFrame::setColor(QColor c) {
  if (c != _color) {
    _color = c;
    emit colorChanged(_color);
    update();
  }
}

void RoundedFrame::setBorderColor(QColor c) {
  if (c != _borderColor) {
    _borderColor = c;
    emit borderColorChanged(_borderColor);
    update();
  }
}

void RoundedFrame::setBorderWidth(qreal bw) {
  if (bw != _borderWidth) {
    _borderWidth = bw;
    emit borderWidthChanged(_borderWidth);
    update();
  }
}

void RoundedFrame::setRadius(qreal r) {
  if (r != _radius) {
    _radius = r;
    emit radiusChanged(_radius);
    update();
  }
}

void RoundedFrame::setRadiusTL(qreal r) {
  if (r != _radiusTL) {
    _radiusTL = r;
    emit radiusTLChanged(_radiusTL);
    update();
  }
}

void RoundedFrame::setRadiusTR(qreal r) {
  if (r != _radiusTR) {
    _radiusTR = r;
    emit radiusTRChanged(_radiusTR);
    update();
  }
}

void RoundedFrame::setRadiusBL(qreal r) {
  if (r != _radiusBL) {
    _radiusBL = r;
    emit radiusBLChanged(_radiusBL);
    update();
  }
}

void RoundedFrame::setRadiusBR(qreal r) {
  if (r != _radiusBR) {
    _radiusBR = r;
    emit radiusBRChanged(_radiusBR);
    update();
  }
}
