// Fragment shader

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_LIGHT_SHADER

// These values come from the vertex shader
varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 vertLightDir;
varying vec4 vertTexCoord;

void main() {
  float radius = 0.08;
  float PI = 3.1415926535897932384626433832795;
  if (pow(vertTexCoord.x - (0.25 * cos(-PI/4) + 0.5), 2) + pow(vertTexCoord.y - (0.25 * sin(-PI/4) + 0.5), 2) < pow(radius, 2)) {
    gl_FragColor = vec4(0, 1.0, 1.0, 1);
  } else if (pow(vertTexCoord.x - (0.25 * cos(-PI/2) + 0.5), 2) + pow(vertTexCoord.y - (0.25 * sin(-PI/2) + 0.5), 2) < pow(radius, 2)) {
    gl_FragColor = vec4(0, 1.0, 1.0, 0.875);
  } else if (pow(vertTexCoord.x - (0.25 * cos(-3*PI/4) + 0.5), 2) + pow(vertTexCoord.y - (0.25 * sin(-3*PI/4) + 0.5), 2) < pow(radius, 2)) {
    gl_FragColor = vec4(0, 1.0, 1.0, 0.75);
  } else if (pow(vertTexCoord.x - (0.25 * cos(-PI) + 0.5), 2) + pow(vertTexCoord.y - (0.25 * sin(-PI) + 0.5), 2) < pow(radius, 2)) {
    gl_FragColor = vec4(0, 1.0, 1.0, 0.625);
  } else if (pow(vertTexCoord.x - (0.25 * cos(-5*PI/4) + 0.5), 2) + pow(vertTexCoord.y - (0.25 * sin(-5*PI/4) + 0.5), 2) < pow(radius, 2)) {
    gl_FragColor = vec4(0, 1.0, 1.0, 0.5);
  } else if (pow(vertTexCoord.x - (0.25 * cos(-3*PI/2) + 0.5), 2) + pow(vertTexCoord.y - (0.25 * sin(-3*PI/2) + 0.5), 2) < pow(radius, 2)) {
    gl_FragColor = vec4(0, 1.0, 1.0, 0.475);
  } else if (pow(vertTexCoord.x - (0.25 * cos(-7*PI/4) + 0.5), 2) + pow(vertTexCoord.y - (0.25 * sin(-7*PI/4) + 0.5), 2) < pow(radius, 2)) {
    gl_FragColor = vec4(0, 1.0, 1.0, 0.25);
  } else if (pow(vertTexCoord.x - (0.25 * cos(0.0) + 0.5), 2) + pow(vertTexCoord.y - (0.25 * sin(0.0) + 0.5), 2) < pow(radius, 2)) {
    gl_FragColor = vec4(0, 1.0, 1.0, 0.125);
  } else {
    gl_FragColor = vec4(0, 0, 0, 0);
  }
}

