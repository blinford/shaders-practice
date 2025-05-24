#version 300 es

precision highp float;

uniform vec2 uResolution;
uniform float uTime;

out vec4 outColor;

float circle_x(float x) {
	return float(abs(x - 0.5*(sin(uTime)+1.)) < 0.01);
}

float circle_y(float y) {
	return float(abs(y - 0.5*(cos(uTime)+1.)) < 0.01);
}

void main()
{
    vec2 uv = gl_FragCoord.xy/uResolution;
    outColor = vec4(circle_x(uv.x) * circle_y(uv.y));
}
