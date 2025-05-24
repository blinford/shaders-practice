#version 300 es

precision highp float;

uniform vec2 uResolution;
uniform float uTime;

out vec4 outColor;

vec2 current_point(float h, float k, float r) {
	// parametric
	return vec2(h+r*sin(uTime),k+r*cos(uTime));
}

float circle(vec2 uv, float h, float k, float r) {
	// cartesian
	return float(abs(pow(uv.x-h,2.)+pow(uv.y-k,2.)-pow(r,2.)) < 0.01);
}

void main()
{
    vec2 uv = gl_FragCoord.xy/uResolution;
    float h = 0.5;
    float k = 0.5;
    float r = 0.5;
    outColor = vec4(1.0-circle(uv, h, k, r)*distance(uv,current_point(h, k, r)));
}
