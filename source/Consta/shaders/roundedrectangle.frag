#version 440

layout(location = 0) in vec2 vPos;
layout(location = 1) in vec2 vEPos;
layout(location = 2) in float vEOffset;

layout(location = 0) out vec4 fragColor;

layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    vec4 fillColor;
    vec4 borderColor;
    float qt_Opacity;
    float borderWidth;
} ubuf;

void main(void)
{
    float d = distance(vPos, vEPos) - vEOffset;
    float bw = ubuf.borderWidth;
    vec4 fc = ubuf.fillColor;
    vec4 bc = bw > 0 ? ubuf.borderColor : fc;

    float m = clamp(d + bw + 1, 0, 1);
    vec4 fillAndBorder = vec4(mix(fc.rgb, bc.rgb, m), 1) * mix(fc.a, bc.a, m) * ubuf.qt_Opacity;
    vec4 borderAndBG =  vec4(bc.rgb, clamp(0.5 - d, 0, 1) * ubuf.qt_Opacity);
    fragColor = (bw > 0 && d < -bw) ? fillAndBorder : borderAndBG;
}

