// Fragment shader

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXLIGHT_SHADER

// set by host code
uniform float time;

// Set in Processing
uniform sampler2D texture;

// These values come from the vertex shader
varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 vertLightDir;
varying vec4 vertTexCoord;


void main() {
  vec4 diffuse_color = texture2D(texture, vertTexCoord.xy);
  float diffuse = clamp(dot (vertNormal, vertLightDir),0.0,1.0);

  vec2 size = textureSize(texture, 0);
  float dx = 1 / size.x;
  float dy = 1 / size.y;

  vec4 temp1 = vec4(vertTexCoord.x, vertTexCoord.y - dy, 1, 1);
  vec4 temp2 = vec4(vertTexCoord.x, vertTexCoord.y + dy, 1, 1);
  vec4 temp3 = vec4(vertTexCoord.x - dx, vertTexCoord.y, 1, 1);
  vec4 temp4 = vec4(vertTexCoord.x + dx, vertTexCoord.y, 1, 1);

  vec4 temp1color = texture2D(texture, temp1.xy);
  vec4 temp2color = texture2D(texture, temp2.xy);
  vec4 temp3color = texture2D(texture, temp3.xy);
  vec4 temp4color = texture2D(texture, temp4.xy);

  float r = (temp1color.r + temp2color.r + temp3color.r + temp4color.r - 4 * diffuse_color.r);
  float g = (temp1color.g + temp2color.g + temp3color.g + temp4color.g - 4 * diffuse_color.g);
  float b = (temp1color.b + temp2color.b + temp3color.b + temp4color.b - 4 * diffuse_color.b);

  float n = (r + g + b) / 3;


  if (time > vertTexCoord.x) {
    gl_FragColor = vec4(3 * n + 0.5, 3 * n + 0.5, 3 * n + 0.5, 1.0);
  } else {
    gl_FragColor = vec4(diffuse * diffuse_color.rgb, 1.0);
  }

}

