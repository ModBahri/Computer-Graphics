public class Ellipsoid {
  PVector center;
  PVector radii;
  Surface surface;
  
  public Ellipsoid(Surface surface, float x, float y, float z, float rx, float ry, float rz) {
    center = new PVector(x, y, z);
    radii = new PVector(rx, ry, rz);
    this.surface = surface;
  }
  
  public Surface getSurface() {
    return surface;
  }
  
  public PVector getCenter() {
    return center;
  }
  
  public PVector getRadii() {
    return radii;
  }
}
