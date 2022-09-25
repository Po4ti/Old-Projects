//
// Simple passthrough vertex shader
//
varying vec2 fragCoord;
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    fragCoord = in_Position.xy;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 fragCoord;

uniform float iGlobalTime;
uniform vec2 iResolution;


void main()
{
	vec2 p = -1.0 + 2.0 * fragCoord.xy / iResolution.xy;
    
    float time = sin(iGlobalTime * 0.05) * 100. + 500.;
    
    p += 0.015 * sin(time * p.yx * 0.1);
    p += 0.005 * cos(time * p.xy * 0.01);
    
    float r = length(p);
    float d = pow(r, 0.3) + 0.05;
    float fade = clamp(r, 0.2, .7);
    float freq = 1.0;
    
    float rr = fade + sin(time * d * 0.5 * freq + 1.15);
    float gg = fade + sin(time * d * 0.499 * freq + 0.85);
    float bb = fade + sin(time * d * 0.498 * freq + 0.55);
    
    gl_FragColor = vec4(rr,gg,bb,1.0);
}
