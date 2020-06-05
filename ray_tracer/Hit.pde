public class Hit {
  PVector position;
  PVector normal;
  float t;
  Object shape;
  
  public Hit(PVector position, float t, Object shape) {
    this.position = position;
    this.t = t;
    this.shape = shape;
  }
  
  public Hit(PVector position, PVector normal, float t, Object shape) {
    this.position = position;
    this.normal = normal;
    this.t = t;
    this.shape = shape;
  }
  
  public PVector getNormal() {
    return normal;
  }
  
  public PVector getPosition() {
    return position;
  }
  
  public float getT() {
    return t;
  }
  
  public Object getShape() {
    return shape;
  }
  
 
}
