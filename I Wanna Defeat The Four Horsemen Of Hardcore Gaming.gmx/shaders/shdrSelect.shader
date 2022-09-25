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

//######################_==_YOYO_SHADER_MARKER_==_######################@~// Star Nest by Pablo RomÃ¡n Andrioli

// This content is under the MIT License.
varying vec2 fragCoord;

uniform float iGlobalTime;
uniform vec2 iResolution;

void main()
{
    //get coords and direction
    vec2 uv=fragCoord.xy/iResolution.xy-0.5;
    uv.y*=iResolution.y/iResolution.x;
    vec3 dir=vec3(uv*0.8,1.0);
    float time=iGlobalTime*0.010+0.25;
    
    //mouse rotation
    float a1=0.5/iResolution.x*2.0;
    float a2=0.8/iResolution.y*2.0;
    mat2 rot1=mat2(cos(a1),sin(a1),-sin(a1),cos(a1));
    mat2 rot2=mat2(cos(a2),sin(a2),-sin(a2),cos(a2));
    dir.xz*=rot1;
    dir.xy*=rot2;
    vec3 from=vec3(1.0,0.5,0.5);
    from+=vec3(time*2.0,time,-2.0);
    from.xz*=rot1;
    from.xy*=rot2;
    
    //volumetric rendering
    float s=0.1,fade=1.0;
    vec3 v=vec3(0.0);
    for (int r=0; r<6; r++) {
        vec3 p=from+s*dir*0.5;
        p = abs(vec3(0.85)-mod(p,vec3(0.85*2.0))); // tiling fold
        float pa,a=pa=0.0;
        for (int i=0; i<18; i++) { 
            p=abs(p)/dot(p,p)-0.53; // the magic formula
            a+=abs(length(p)-pa); // absolute sum of average change
            pa=length(p);
        }
        float dm=max(0.0,0.3-a*a*0.001); //dark matter
        a*=a*a; // add contrast
        if (r>6) {
            fade*=1.0-dm; // dark matter, don't render near
        }
        //v+=vec3(dm,dm*.5,0.);
        v+=fade;
        v+=vec3(s,s*s,s*s*s*s)*a*0.0015*fade; // coloring based on distance
        fade*=0.73; // distance fading
        s+=0.1;
    }
    v=mix(vec3(length(v)),v,0.85); //color adjust
    gl_FragColor = vec4(v*0.01,1.0);
}
