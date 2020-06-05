public class Light {
  PVector origin;
  PVector c;
  
  public Light(float x, float y, float z, float r, float g, float b) {
    origin = new PVector(x, y, z);
    c = new PVector(r, g, b);
  }
  
  public PVector getOrigin() {
    return origin;
  }
  
  public PVector getColor() {
    return c;
  }
}
