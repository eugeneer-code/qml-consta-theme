#include "RoundedRectangle.h"
#include "RoundedRectangleNode.h"
#include <algorithm>

RoundedRectangle::RoundedRectangle(QQuickItem *parent)
    : QQuickItem{parent}, m_Color{QColor{"red"}}, m_BorderColor{
                                                      QColor{"transparent"}} {
  setFlag(ItemHasContents, true);
}

QSGNode *RoundedRectangle::updatePaintNode(
    QSGNode *oldNode, QQuickItem::UpdatePaintNodeData *updatePaintNodeData) {

  auto *node = dynamic_cast<RoundedRectangleNode *>(oldNode);
  if (!node) {
    node = new RoundedRectangleNode;
  }
  const auto newNode = node != oldNode;
  if (newNode || m_MaterialChanged) {
    node->updateMaterial(m_Color, m_BorderColor, m_BorderWidth);
    m_MaterialChanged = false;
  }
  if (newNode || m_GeometryChanged) {
    const qreal mn = 0.5 * std::min(width(), height());
    const qreal rtl =
        std::clamp(m_RadiusTL < 0 ? m_Radius : m_RadiusTL, 0.0, mn);
    const qreal rtr =
        std::clamp(m_RadiusTR < 0 ? m_Radius : m_RadiusTR, 0.0, mn);
    const qreal rbr =
        std::clamp(m_RadiusBR < 0 ? m_Radius : m_RadiusBR, 0.0, mn);
    const qreal rbl =
        std::clamp(m_RadiusBL < 0 ? m_Radius : m_RadiusBL, 0.0, mn);
    node->updateGeometry(boundingRect(), rtl, rtr, rbr, rbl);
    m_GeometryChanged = false;
  }
  return node;
}

void RoundedRectangle::geometryChange(const QRectF &newGeom,
                                      const QRectF &oldGeom) {
  m_GeometryChanged = true;
  update();
}

void RoundedRectangle::setColor(QColor c) {
  if (c != m_Color) {
    m_Color = c;
    emit colorChanged(m_Color);
    m_MaterialChanged = true;
    update();
  }
}

void RoundedRectangle::setBorderColor(QColor c) {
  if (c != m_BorderColor) {
    m_BorderColor = c;
    emit borderColorChanged(m_BorderColor);
    m_MaterialChanged = true;
    update();
  }
}

void RoundedRectangle::setBorderWidth(qreal bw) {
  if (bw != m_BorderWidth) {
    m_BorderWidth = bw;
    emit borderWidthChanged(m_BorderWidth);
    m_MaterialChanged = true;
    update();
  }
}

void RoundedRectangle::setRadius(qreal r) {
  if (r != m_Radius) {
    m_Radius = r;
    emit radiusChanged(m_RadiusTL);
    m_GeometryChanged = true;
    update();
  }
}

void RoundedRectangle::setRadiusTL(qreal r) {
  if (r != m_RadiusTL) {
    m_RadiusTL = r;
    emit radiusTLChanged(m_RadiusTL);
    m_GeometryChanged = true;
    update();
  }
}

void RoundedRectangle::setRadiusTR(qreal r) {
  if (r != m_RadiusTR) {
    m_RadiusTR = r;
    emit radiusTRChanged(m_RadiusTR);
    m_GeometryChanged = true;
    update();
  }
}

void RoundedRectangle::setRadiusBL(qreal r) {
  if (r != m_RadiusBL) {
    m_RadiusBL = r;
    emit radiusBLChanged(m_RadiusBL);
    m_GeometryChanged = true;
    update();
  }
}

void RoundedRectangle::setRadiusBR(qreal r) {
  if (r != m_RadiusBR) {
    m_RadiusBR = r;
    emit radiusBRChanged(m_RadiusBR);
    m_GeometryChanged = true;
    update();
  }
}

//#include "moc_roundedrectangle.cpp"
