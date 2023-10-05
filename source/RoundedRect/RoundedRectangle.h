#ifndef CONSTA_ROUNDEDRECTANGLE_H
#define CONSTA_ROUNDEDRECTANGLE_H

#include <QQuickPaintedItem>

class RoundedRectangle : public QQuickPaintedItem {
  Q_OBJECT
  QML_ELEMENT

  Q_PROPERTY(QColor color MEMBER _color WRITE setColor NOTIFY colorChanged)
  Q_PROPERTY(QColor borderColor MEMBER _borderColor WRITE setBorderColor NOTIFY borderColorChanged)
  Q_PROPERTY(qreal borderWidth MEMBER _borderWidth WRITE setBorderWidth NOTIFY borderWidthChanged)
  Q_PROPERTY(qreal radius MEMBER _radius WRITE setRadius NOTIFY radiusChanged)
  Q_PROPERTY(qreal radiusTL MEMBER _radiusTL WRITE setRadiusTL NOTIFY radiusTLChanged)
  Q_PROPERTY(qreal radiusTR MEMBER _radiusTR WRITE setRadiusTR NOTIFY radiusTRChanged)
  Q_PROPERTY(qreal radiusBL MEMBER _radiusBL WRITE setRadiusBL NOTIFY radiusBLChanged)
  Q_PROPERTY(qreal radiusBR MEMBER _radiusBR WRITE setRadiusBR NOTIFY radiusBRChanged)

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
    void paint(QPainter *painter) override;

private:
    QPainterPath rectPath(bool border);

private:
  QColor _color;
  QColor _borderColor;
  qreal _borderWidth{0.0};
  qreal _radius{0.0};
  qreal _radiusTL{-1.0};
  qreal _radiusTR{-1.0};
  qreal _radiusBR{-1.0};
  qreal _radiusBL{-1.0};
};

#endif // CONSTA_ROUNDEDRECTANGLE_H
