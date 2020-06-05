/******************************************************************************
Draw your initials here in perspective.
******************************************************************************/

void persp_initials()
{
  // you should write this routine!
  Init_Matrix();
  Perspective(60, 1, 100);
  
  
  Init_Matrix();
  BeginShape();
  
  Vertex(-2, 0.5, -5);
  Vertex(-2, 2.5, -6);
  
  Vertex(-2, 2.5, -6);
  Vertex(-1, 1, -5);
  
  Vertex(-1, 1, -5);
  Vertex(-0.5, 2.5, -6);
  
  Vertex(-0.5, 2.5, -6);
  Vertex(0.15, -.3, -1);
  
  Vertex(0.15, -.3, -1);
  Vertex(6, -0.5, -20);
  
  Vertex(6, -0.5, -20);
  Vertex(0.15, 0, -1);
  
  Vertex(0.15, 0, -1);
  Vertex(6, 5, -20);
  
  Vertex(6, 5, -20);
  Vertex(0, 0.25, -1);
  
  
  EndShape();
  
}
