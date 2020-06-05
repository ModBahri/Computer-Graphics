// Vertex shader

// Our shader uses both processing's texture and light variables
#define PROCESSING_TEXLIGHT_SHADER

// Set automatically by Processing
uniform mat4 transform;
uniform mat3 normalMatrix;
uniform vec3 lightNormal;
uniform mat4 texMatrix;
uniform sampler2D texture;

// Come from the geometry/material of the object
attribute vec4 vertex;
attribute vec4 color;
attribute vec3 normal;
attribute vec2 texCoord;

// These values will be sent to the fragment shader
varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 vertLightDir;
varying vec4 vertTexCoord;
varying vec4 vertTexCoordR;
varying vec4 vertTexCoordL;

void main() {
  vertColor = color;
  vertTexCoord = texMatrix * vec4(texCoord, 1.0, 1.0);

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

  float r = (temp1color.r + temp2color.r + temp3color.r + temp4color.r - 4 * vertColor.r);
  float g = (temp1color.g + temp2color.g + temp3color.g + temp4color.g - 4 * vertColor.g);
  float b = (temp1color.b + temp2color.b + temp3color.b + temp4color.b - 4 * vertColor.b);

  float n = (r + g + b) / 3;

  vec4 pos = vertex + vec4(normal * (1 - n) * 20, 0);
  gl_Position = transform * pos;
}
