#include "RoundedRectangleNode.h"
#include "RoundedRectangleMaterial.h"

struct RoundRect2DPoint {
  // pos
  float x{0.0f};
  float y{0.0f};

  // edge
  float ex{0.0f};
  float ey{0.0f};
  float eo{0.0f};

  void set(QPointF p, QPointF e, float eoo) {
    x = p.x();
    y = p.y();
    ex = e.x();
    ey = e.y();
    eo = eoo;
  }

  void set(QPointF p, float exx, float eyy, float eoo) {
    x = p.x();
    y = p.y();
    ex = exx;
    ey = eyy;
    eo = eoo;
  }
};

QSGGeometry::Attribute RoundRect2DPoint_Attributes[] = {
    QSGGeometry::Attribute::create(0, 2, QSGGeometry::FloatType, true),
    QSGGeometry::Attribute::create(1, 2, QSGGeometry::FloatType, false),
    QSGGeometry::Attribute::create(2, 1, QSGGeometry::FloatType, false)};

QSGGeometry::AttributeSet RoundRect2DPoint_AttributeSet = {
    3, sizeof(RoundRect2DPoint), RoundRect2DPoint_Attributes};

RoundedRectangleNode::RoundedRectangleNode() {
  auto *geom = new QSGGeometry(RoundRect2DPoint_AttributeSet, 72, 0);

  geom->setDrawingMode(QSGGeometry::DrawTriangles);
  setGeometry(geom);

  RoundedRectangleMaterial *m = new RoundedRectangleMaterial;
  setMaterial(m);

  setFlag(OwnsMaterial);
  setFlag(OwnsGeometry);
}

void RoundedRectangleNode ::updateMaterial(QColor fillColor, QColor borderColor,
                                           qreal borderWidth) {
  RoundedRectangleMaterial *m =
      dynamic_cast<RoundedRectangleMaterial *>(material());
  if (!m)
    return;

  m->state.fillColor = fillColor;
  m->state.borderColor = borderColor;
  m->state.borderWidth = borderWidth;
  markDirty(DirtyMaterial);
}

void RoundedRectangleNode::updateGeometry(QRectF rect, qreal tlr, qreal trr,
                                          qreal brr, qreal blr) {
  const float x = rect.x();
  const float y = rect.y();
  const float w = rect.width();
  const float h = rect.height();

  RoundRect2DPoint *vertices =
      static_cast<RoundRect2DPoint *>(geometry()->vertexData());

  int idx = 0;

  // top left corner
  QPointF a1{x, y};
  QPointF a2{x + tlr, y};
  QPointF a3{x + tlr, y + tlr};
  QPointF a4{x, y + tlr};
  QPointF ae{tlr, tlr};

  vertices[idx++].set(a1, ae, tlr);
  vertices[idx++].set(a2, ae, tlr);
  vertices[idx++].set(a3, ae, tlr);
  vertices[idx++].set(a1, ae, tlr);
  vertices[idx++].set(a3, ae, tlr);
  vertices[idx++].set(a4, ae, tlr);

  // top right corner
  QPointF b1{x + w - trr, y};
  QPointF b2{x + w, y};
  QPointF b3{x + w, y + trr};
  QPointF b4{x + w - trr, y + trr};
  QPointF be{x + w - trr, trr};

  vertices[idx++].set(b1, be, trr);
  vertices[idx++].set(b2, be, trr);
  vertices[idx++].set(b3, be, trr);
  vertices[idx++].set(b1, be, trr);
  vertices[idx++].set(b3, be, trr);
  vertices[idx++].set(b4, be, trr);

  // bottom right corner
  QPointF c1{x + w - brr, y + h - brr};
  QPointF c2{x + w, y + h - brr};
  QPointF c3{x + w, y + h};
  QPointF c4{x + w - brr, y + h};
  QPointF ce{x + w - brr, y + h - brr};

  vertices[idx++].set(c1, ce, brr);
  vertices[idx++].set(c2, ce, brr);
  vertices[idx++].set(c3, ce, brr);
  vertices[idx++].set(c1, ce, brr);
  vertices[idx++].set(c3, ce, brr);
  vertices[idx++].set(c4, ce, brr);

  // bottom left corner
  QPointF d1{x, y + h - blr};
  QPointF d2{x + blr, y + h - blr};
  QPointF d3{x + blr, y + h};
  QPointF d4{x, y + h};
  QPointF de{x + blr, y + h - blr};

  vertices[idx++].set(d1, de, blr);
  vertices[idx++].set(d2, de, blr);
  vertices[idx++].set(d3, de, blr);
  vertices[idx++].set(d1, de, blr);
  vertices[idx++].set(d3, de, blr);
  vertices[idx++].set(d4, de, blr);

  const auto mn = 0.5 * std::min(w, h);
  QPointF m1{x + mn, y + mn};
  QPointF m2{x + w - mn, y + mn};
  QPointF m3{x + w - mn, y + h - mn};
  QPointF m4{x + mn, y + h - mn};

  // top side
  vertices[idx++].set(m1, m1.x(), y + mn, mn);
  vertices[idx++].set(a3, a3.x(), y + mn, mn);
  vertices[idx++].set(a2, a2.x(), y + mn, mn);
  vertices[idx++].set(m1, m1.x(), y + mn, mn);
  vertices[idx++].set(a2, a2.x(), y + mn, mn);
  vertices[idx++].set(b1, b1.x(), y + mn, mn);
  vertices[idx++].set(m2, m2.x(), y + mn, mn);
  vertices[idx++].set(m1, m1.x(), y + mn, mn);
  vertices[idx++].set(b1, b1.x(), y + mn, mn);
  vertices[idx++].set(m2, m2.x(), y + mn, mn);
  vertices[idx++].set(b4, b4.x(), y + mn, mn);
  vertices[idx++].set(b1, b1.x(), y + mn, mn);

  // right side
  vertices[idx++].set(m2, x + w - mn, m2.y(), mn);
  vertices[idx++].set(b3, x + w - mn, b3.y(), mn);
  vertices[idx++].set(b4, x + w - mn, b4.y(), mn);
  vertices[idx++].set(m2, x + w - mn, m2.y(), mn);
  vertices[idx++].set(b3, x + w - mn, b3.y(), mn);
  vertices[idx++].set(c2, x + w - mn, c2.y(), mn);
  vertices[idx++].set(m2, x + w - mn, m2.y(), mn);
  vertices[idx++].set(m3, x + w - mn, m3.y(), mn);
  vertices[idx++].set(c2, x + w - mn, c2.y(), mn);
  vertices[idx++].set(m3, x + w - mn, m2.y(), mn);
  vertices[idx++].set(c1, x + w - mn, c1.y(), mn);
  vertices[idx++].set(c2, x + w - mn, c2.y(), mn);

  // bottom side
  vertices[idx++].set(m4, m4.x(), y + h - mn, mn);
  vertices[idx++].set(d3, d3.x(), y + h - mn, mn);
  vertices[idx++].set(d2, d2.x(), y + h - mn, mn);
  vertices[idx++].set(m4, m4.x(), y + h - mn, mn);
  vertices[idx++].set(d3, d3.x(), y + h - mn, mn);
  vertices[idx++].set(c4, c4.x(), y + h - mn, mn);
  vertices[idx++].set(m3, m3.x(), y + h - mn, mn);
  vertices[idx++].set(m4, m4.x(), y + h - mn, mn);
  vertices[idx++].set(c4, c4.x(), y + h - mn, mn);
  vertices[idx++].set(m3, m3.x(), y + h - mn, mn);
  vertices[idx++].set(c4, c4.x(), y + h - mn, mn);
  vertices[idx++].set(c1, c1.x(), y + h - mn, mn);

  // left side
  vertices[idx++].set(m1, x + mn, m1.y(), mn);
  vertices[idx++].set(a3, x + mn, a3.y(), mn);
  vertices[idx++].set(a4, x + mn, a4.y(), mn);
  vertices[idx++].set(m1, x + mn, m1.y(), mn);
  vertices[idx++].set(a4, x + mn, a4.y(), mn);
  vertices[idx++].set(d1, x + mn, d1.y(), mn);
  vertices[idx++].set(m1, x + mn, m1.y(), mn);
  vertices[idx++].set(m4, x + mn, m4.y(), mn);
  vertices[idx++].set(d1, x + mn, d1.y(), mn);
  vertices[idx++].set(m4, x + mn, m4.y(), mn);
  vertices[idx++].set(d1, x + mn, d1.y(), mn);
  vertices[idx++].set(d2, x + mn, d2.y(), mn);

  markDirty(DirtyGeometry);
}
