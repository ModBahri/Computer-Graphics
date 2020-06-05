// Matrix Stack Library
// You should modify the routines listed below to complete the assignment.
// Feel free to define any classes, global variables and helper routines that you need.

float[][] mat = new float[4][4];

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
