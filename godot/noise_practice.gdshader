shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

float random(in vec2 st) {
	return fract(sin(dot(st.xy, vec2(12.9898, 78.4124))) * 43758.5114);
}

float noise(in vec2 st) {
	vec2 i = floor(st);
	vec2 f = fract(st);
	
	float a = random(i);
	float b = random(i + vec2(1., 0.));
	float c = random(i + vec2(0., 1.));
	float d = random(i + vec2(1., 1.));
	
	vec2 u = smoothstep(0., 1., f);
	
	return mix(a, b, u.x) + (c - a)*u.y*(1.0-u.x) + (d - b)*u.x*u.y;
}

void fragment() {
	vec2 st = FRAGCOORD.xy * TIME * 0.001;
	COLOR = vec4(vec3(noise(st)), 1.);
}
