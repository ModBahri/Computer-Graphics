public class Disk {
  PVector c;
  PVector n;
  Surface surface;
  float radius;
  
  public Disk(Surface surface, float cx, float cy, float cz, float nx, float ny, float nz, float radius) {
    this.surface = surface;
    c = new PVector(cx, cy, cz);
    n = new PVector(nx, ny, nz);
    this.radius = radius;
  }
  public Surface getSurface() {
    return surface;
  }
  
  public PVector getCenter() {
    return c;
  }
  public PVector getNormal() {
    return n;
  }
  public float getRadius() {
    return radius;
  }
}
