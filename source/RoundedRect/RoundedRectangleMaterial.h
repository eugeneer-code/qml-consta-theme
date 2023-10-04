#ifndef CONSTA_ROUNDEDRECTANGLEMATERIAL_H
#define CONSTA_ROUNDEDRECTANGLEMATERIAL_H

#include <QSGMaterial>

class RoundedRectangleMaterial : public QSGMaterial {
public:
  RoundedRectangleMaterial();

  QSGMaterialType *type() const override;
  QSGMaterialShader *
      createShader(QSGRendererInterface::RenderMode) const override;
  int compare(const QSGMaterial *m) const override;

  struct {
    float borderWidth;
    QColor fillColor;
    QColor borderColor;
  } state;
};
#endif // CONSTA_ROUNDEDRECTANGLEMATERIAL_H
