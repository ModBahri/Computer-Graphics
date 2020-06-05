public class Ray {
  PVector direction;
  PVector origin;
  
  public Ray(float dx, float dy, float dz, float ox, float oy, float oz) {
    direction = new PVector(dx, dy, dz);
    origin = new PVector(ox, oy, oz);
  }
  
  public Ray(PVector direction, PVector origin) {
    this.direction = direction;
    this.origin = origin;
  }
  
  public PVector getDirection() {
    return direction;
  }
  
  public PVector getOrigin() {
    return origin;
  }
}
