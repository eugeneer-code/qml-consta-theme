#ifndef CONSTA_ROUNDEDRECTANGLENODE_H
#define CONSTA_ROUNDEDRECTANGLENODE_H

#include <QRectF>
#include <QSGGeometryNode>

class RoundedRectangleNode : public QSGGeometryNode {
public:
  RoundedRectangleNode();

  void updateGeometry(QRectF rect, qreal tlr, qreal trr, qreal brr, qreal blr);
  void updateMaterial(QColor fillColor, QColor borderColor, qreal borderWidth);
};

#endif // CONSTA_ROUNDEDRECTANGLENODE_H
