#include "RoundedRectangleMaterial.h"
#include <QSGMaterial>

class RoundedRectangleShader : public QSGMaterialShader {
public:
  RoundedRectangleShader() {
    setShaderFileName(VertexStage,
                      QLatin1String(":/Consta/shaders/roundedrectangle.vert.qsb"));
    setShaderFileName(FragmentStage,
                      QLatin1String(":/Consta/shaders/roundedrectangle.frag.qsb"));
  }

  bool updateUniformData(RenderState &state, QSGMaterial *newMaterial,
                         QSGMaterial *oldMaterial) override;
};

RoundedRectangleMaterial::RoundedRectangleMaterial() {
  setFlag(Blending, true);
  setFlag(RequiresFullMatrix, true);
}

QSGMaterialType *RoundedRectangleMaterial::type() const {
  static QSGMaterialType type;
  return &type;
}

QSGMaterialShader *
RoundedRectangleMaterial::createShader(QSGRendererInterface::RenderMode) const {
  return new RoundedRectangleShader;
}

int RoundedRectangleMaterial::compare(const QSGMaterial *m) const {
  const RoundedRectangleMaterial *other =
      static_cast<const RoundedRectangleMaterial *>(m);

  if (int diff = int(state.fillColor.rgb()) - int(other->state.fillColor.rgb()))
    return diff;
  if (int diff =
          int(state.borderColor.rgb()) - int(other->state.borderColor.rgb()))
    return diff;

  if (int diff = state.borderWidth - other->state.borderWidth)
    return diff;

  return 0;
}

bool RoundedRectangleShader::updateUniformData(RenderState &state,
                                               QSGMaterial *newMaterial,
                                               QSGMaterial *) {
  QByteArray *buf = state.uniformData();
  Q_ASSERT(buf->size() >= 104);

  if (state.isMatrixDirty()) {
    const QMatrix4x4 m = state.combinedMatrix();
    memcpy(buf->data(), m.constData(), 64);
  }

  if (state.isOpacityDirty()) {
    const float opacity = state.opacity();
    memcpy(buf->data() + 96, &opacity, 4);
  }

  RoundedRectangleMaterial *mat =
      static_cast<RoundedRectangleMaterial *>(newMaterial);
  float fc[4] = {float(mat->state.fillColor.redF()),
                 float(mat->state.fillColor.greenF()),
                 float(mat->state.fillColor.blueF()),
                 float(mat->state.fillColor.alphaF())};
  float bc[4] = {float(mat->state.borderColor.redF()),
                 float(mat->state.borderColor.greenF()),
                 float(mat->state.borderColor.blueF()),
                 float(mat->state.borderColor.alphaF())};
  memcpy(buf->data() + 64, fc, 16);
  memcpy(buf->data() + 80, bc, 16);
  memcpy(buf->data() + 100, &mat->state.borderWidth, 4);

  return true;
}
