#ifndef CONSTA_ROUNDEDRECTANGLE_H
#define CONSTA_ROUNDEDRECTANGLE_H

#include <QQuickItem>

class RoundedRectangle : public QQuickItem {
  Q_OBJECT
  QML_ELEMENT

  Q_PROPERTY(QColor color MEMBER m_Color WRITE setColor NOTIFY colorChanged)
  Q_PROPERTY(QColor borderColor MEMBER m_BorderColor WRITE setBorderColor NOTIFY
                 borderColorChanged)
  Q_PROPERTY(qreal borderWidth MEMBER m_BorderWidth WRITE setBorderWidth NOTIFY
                 borderWidthChanged)
  Q_PROPERTY(qreal radius MEMBER m_Radius WRITE setRadius NOTIFY radiusChanged)
  Q_PROPERTY(
      qreal radiusTL MEMBER m_RadiusTL WRITE setRadiusTL NOTIFY radiusTLChanged)
  Q_PROPERTY(
      qreal radiusTR MEMBER m_RadiusTR WRITE setRadiusTR NOTIFY radiusTRChanged)
  Q_PROPERTY(
      qreal radiusBL MEMBER m_RadiusBL WRITE setRadiusBL NOTIFY radiusBLChanged)
  Q_PROPERTY(
      qreal radiusBR MEMBER m_RadiusBR WRITE setRadiusBR NOTIFY radiusBRChanged)

public:
  explicit RoundedRectangle(QQuickItem *parent = nullptr);

  void setColor(QColor c);
  void setBorderColor(QColor c);
  void setBorderWidth(qreal bw);
  void setRadius(qreal r);
  void setRadiusTL(qreal r);
  void setRadiusTR(qreal r);
  void setRadiusBL(qreal r);
  void setRadiusBR(qreal r);

signals:
  void colorChanged(QColor c);
  void borderColorChanged(QColor c);
  void borderWidthChanged(qreal bw);
  void radiusChanged(qreal r);
  void radiusTLChanged(qreal r);
  void radiusTRChanged(qreal r);
  void radiusBLChanged(qreal r);
  void radiusBRChanged(qreal r);

protected:
  QSGNode *updatePaintNode(
      QSGNode *oldNode,
      QQuickItem::UpdatePaintNodeData *updatePaintNodeData) override;

  void geometryChange(const QRectF &newGeom, const QRectF &oldGeom) override;

private:
  QColor m_Color;
  QColor m_BorderColor;
  qreal m_BorderWidth{0.0};
  qreal m_Radius{0.0};
  qreal m_RadiusTL{-1.0};
  qreal m_RadiusTR{-1.0};
  qreal m_RadiusBR{-1.0};
  qreal m_RadiusBL{-1.0};

  bool m_GeometryChanged{false};
  bool m_MaterialChanged{false};
};

#endif // CONSTA_ROUNDEDRECTANGLE_H
