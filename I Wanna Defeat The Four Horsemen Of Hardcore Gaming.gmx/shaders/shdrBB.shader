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

uniform float iRed;
uniform float iBlue;
uniform float iFinal;
// procedural noise from IQ


vec2 hash( vec2 p )
{
    p = vec2( dot(p,vec2(127.1,311.7)),
              dot(p,vec2(269.5,183.3)) );
    //setting p mult to 0.0001 seems to get slightly smoother results
    return -1.0 + 2.0*fract(sin(p*0.0001)*43758.5453123);
}

float noise( in vec2 p )
{
    const float K1 = 0.366025404; // (sqrt(3)-1)/2;
    const float K2 = 0.211324865; // (3-sqrt(3))/6;
    
    vec2 i = floor( p + (p.x+p.y)*K1 );
    
    vec2 a = p - i + (i.x+i.y)*K2;
    vec2 o = (a.x>a.y) ? vec2(1.0,0.0) : vec2(0.0,1.0);
    vec2 b = a - o + K2;
    vec2 c = a - 1.0 + 2.0*K2;
    
    vec3 h = max( 0.5-vec3(dot(a,a), dot(b,b), dot(c,c) ), 0.0 );
    
    vec3 n = h*h*h*h*vec3( dot(a,hash(i+0.0)), dot(b,hash(i+o)), dot(c,hash(i+1.0)));
    
    return dot( n, vec3(70.0) );
}

void main()
{
    vec2 uv = fragCoord.xy / iResolution.xy;
    uv=uv*2.0-1.0;
    
    float fadeToBlack = 0.55;
    
    if(iFinal == 1.0) {
        fadeToBlack = 0.8;
    }
    fadeToBlack += noise(vec2(uv.x*0.1+sin(iGlobalTime),uv.y*0.1+cos(iGlobalTime+2.6)));

    vec3 _color = vec3(fadeToBlack+iRed,fadeToBlack,(pow(fadeToBlack,3.0)+iBlue));
    
    if(iFinal == 1.0) {
        _color = vec3(pow(fadeToBlack,3.0),pow(fadeToBlack,3.0),pow(fadeToBlack,3.0));
    }
    
    gl_FragColor = vec4(_color,1.0);

}
