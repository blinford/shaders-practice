#version 330

// from https://thebookofshaders.com/05/

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float parabola( float x, float k ){
    return pow( 4.0*x*(1.0-x), k );
}

// make it dance
float plot(vec2 st, float pct){
  return  smoothstep( pct-0.02, pct, sin(u_time)*(st.y)) -
          smoothstep( pct, pct+0.02, -sin(u_time)*st.y);
}

// oscillate between two colors based on time
vec3 color() {
	return vec3(0., 0., 1.)*0.5*(sin(u_time)+1) + vec3(1., .8, 0.)*0.5*(sin(u_time+180)+1);
}

void main() {    
	vec2 st = gl_FragCoord.xy/u_resolution;

    float y = parabola(st.x,1.0);

    vec3 color = color();

    float pct = plot(st,y);
    color = (1.0-pct)*color+pct*vec3(0.0,1.0,0.0);

    gl_FragColor = vec4(color,1.0);
}
