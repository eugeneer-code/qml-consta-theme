#version 440

layout(location = 0) in vec4 pos;
layout(location = 1) in vec2 ePos;
layout(location = 2) in float eOffset;

layout(location = 0) out vec2 vPos;
layout(location = 1) out vec2 vEPos;
layout(location = 2) out float vEOffset;

layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    vec4 fillColor;
    vec4 borderColor;
    float qt_Opacity;
    float borderWidth;
} ubuf;

out gl_PerVertex { vec4 gl_Position; };

void main(void)
{
    gl_Position = ubuf.qt_Matrix * pos;
    vPos = pos.xy;
    vEPos = ePos;
    vEOffset = eOffset;
}
