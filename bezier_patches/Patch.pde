public class Patch {
  PVector[][] controlPts;
  color randColor;
  PVector[][] bezierControlPts;
  
  public Patch() {
    controlPts = new PVector[4][4];
    randColor = color(random(255), random(255), random(255));
    bezierControlPts = new PVector[11][11];
  }
  
  public PVector bezier(PVector p0, PVector p1, PVector p2, PVector p3, float t) {
    PVector term0 = PVector.mult(p0, pow(1 - t, 3));
    PVector term1 = PVector.mult(p1, 3 * t * pow(1 - t, 2));
    PVector term2 = PVector.mult(p2, 3 * (1 - t) * pow(t, 2));
    PVector term3 = PVector.mult(p3, pow(t, 3));
    return PVector.add(term0, PVector.add(term1, PVector.add(term2, term3)));
    
  }
  
  public void setBezierControlPts() {
    for (int i = 0; i < 11; i++) {
      for (int j = 0; j < 11; j++) {
        float s = i / 10.0;
        float t = j / 10.0;
        PVector a = bezier(controlPts[0][0], controlPts[0][1], controlPts[0][2], controlPts[0][3], s);
        PVector b = bezier(controlPts[1][0], controlPts[1][1], controlPts[1][2], controlPts[1][3], s);
        PVector c = bezier(controlPts[2][0], controlPts[2][1], controlPts[2][2], controlPts[2][3], s);
        PVector d = bezier(controlPts[3][0], controlPts[3][1], controlPts[3][2], controlPts[3][3], s);
        PVector tPt = bezier(a, b, c, d, t);
        println("bezier pt " + " " + i + " " + j + " " + tPt.x + " " + tPt.y + " " + tPt.z);
        bezierControlPts[i][j] = tPt;
      }
    }
  }
  
  public color getColor() {
    return randColor;
  }
  
  public PVector[][] getControlPts() {
    return controlPts;
  }
  
  public PVector getControlPt(int i, int j) {
    return controlPts[i][j];
  }
  
  public PVector getBezierPt(int i, int j) {
    return bezierControlPts[i][j];
  }
  
  public void addControlPt(int i, int j, float x, float y, float z) {
    controlPts[i][j] = new PVector(x, y, z);
  }

}
