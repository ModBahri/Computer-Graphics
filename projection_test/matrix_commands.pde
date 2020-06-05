// Dummy routines for OpenGL commands.
// These are for you to write!
// You should incorporate your transformation matrix routines from part A of this project.

float[][] mat = new float[4][4];
float x0;
float y0;
float z0;
float xa;
float ya;
boolean begin;
boolean even;
float[] p1 = new float[3];
boolean ortho;
boolean persp;
float l;
float r;
float b;
float t;
float n;
float f;
float k;
float near;
float far;


void Init_Matrix()
{
  mat[0][0] = 1;
  mat[0][1] = 0;
  mat[0][2] = 0;
  mat[0][3] = 0;
  mat[1][1] = 1;
  mat[1][0] = 0;
  mat[1][2] = 0;
  mat[1][3] = 0;
  mat[2][2] = 1;
  mat[2][0] = 0;
  mat[2][1] = 0;
  mat[2][3] = 0;
  mat[3][3] = 1;
}

float[][] Mult(float[][] transform, float[][] matrix) {
  float[][] newmatrix = new float[4][4];
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      newmatrix[i][j] = transform[0][j] * matrix[i][0] + transform[1][j] *  matrix[i][1]
                 + transform[2][j] * matrix[i][2] + transform[3][j] * matrix[i][3];
    }
  }
  return newmatrix;
}

float[] vectMult(float x, float y, float z, float[][] matrix) {
  println("before: " + x + " " + y + " " + z);
  float[] newarr = new float[4];
  float[] arr = {x, y, z, 1};
  for (int j = 0; j < 4; j++) {
    newarr[j] = matrix[j][0] * arr[0] + matrix[j][1] * arr[1] 
      + matrix[j][2] * arr[2] + matrix[j][3] * arr[3];
  }
  return newarr;
}

void Translate(float x, float y, float z)
{
  float[][] trans = {
                      {1, 0, 0, x},
                      {0, 1, 0, y},
                      {0, 0, 1, z},
                      {0, 0, 0, 1}
  };
  mat = Mult(trans, mat);
}

void Scale(float x, float y, float z)
{
  float[][] scale = {
                      {x, 0, 0, 0},
                      {0, y, 0, 0},
                      {0, 0, z, 0},
                      {0, 0, 0, 1}
  };
  mat = Mult(scale, mat);
}

void RotateX(float theta)
{
  theta = theta * (PI / 180);
  float[][] rotatex = {
                      {1, 0, 0, 0},
                      {0, cos(theta), -sin(theta), 0},
                      {0, sin(theta), cos(theta), 0},
                      {0, 0, 0, 1}
  };
  mat = Mult(rotatex, mat);
}

void RotateY(float theta)
{
  theta = theta * (PI / 180);
  float[][] rotatey = {
                      {cos(theta), 0, sin(theta), 0},
                      {0, 1, 0, 0},
                      {-sin(theta), 0, cos(theta), 0},
                      {0, 0, 0, 1}
  };
  mat = Mult(rotatey, mat);
}

void RotateZ(float theta)
{
  theta = theta * (PI / 180);
  float[][] rotatez = {
                      {cos(theta), -sin(theta), 0, 0},
                      {sin(theta), cos(theta), 0, 0},
                      {0, 0, 1, 0},
                      {0, 0, 0, 1}
  };
  mat = Mult(rotatez, mat);
}

void Print_Matrix()
{
  println("[" + mat[0][0] + ", " + mat[0][1] + ", " + mat[0][2] + ", " + mat[0][3] + "]");
  println("[" + mat[1][0] + ", " + mat[1][1] + ", " + mat[1][2] + ", " + mat[1][3] + "]");
  println("[" + mat[2][0] + ", " + mat[2][1] + ", " + mat[2][2] + ", " + mat[2][3] + "]");
  println("[" + mat[3][0] + ", " + mat[3][1] + ", " + mat[3][2] + ", " + mat[3][3] + "]");
  println();
}

void Perspective(float fov, float near, float far)
{
  ortho = false;
  persp = true;
  fov = fov * (PI / 180);
  k = tan(fov / 2);
  this.near = near;
  this.far = far;
}

void Ortho(float l, float r, float b, float t, float n, float f)
{
  persp = false;
  ortho = true;
  this.l = l;
  this.r = r;
  this.b = b;
  this.t = t;
  this.n = n;
  this.f = f;
}

void BeginShape()
{
  begin = true;
  even = true;
}

void Vertex(float x, float y, float z)
{
  if (begin) {
    float[] arr = vectMult(x, y, z, mat);
    x = arr[0];
    y = arr[1];
    z = arr[2];
    println("transform: " + x + " " + y + " " + z);
    if (ortho) {
      x = ((x - l) * 500) / (r - l);
      y = ((y - b) * 500) / (t - b);
      z = ((z - n) * 500) / (f - n);
    }
    if (persp) {
      x = (((x / abs(z)) + k) * 500) / (2 * k);
      y = (((y / abs(z)) + k) * 500) / (2 * k);
      
    }
    if (even) {
      p1[0] = x;
      p1[1] = 500 - y;
      p1[2] = z;
      even = false;
    } else {
      line(p1[0], p1[1], x, 500 - y);
      even = true;
    }
  }
  
}

void EndShape()
{
  begin = false;
}
