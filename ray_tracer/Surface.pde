public class Surface {
  PVector diffuse;
  PVector ambient;
  PVector specular;
  float p;
  float krefl;
  
  public Surface(float cdr, float cdg, float cdb, float car, float cag, float cab, 
  float csr, float csg, float csb, float p, float krefl) {
    diffuse = new PVector(cdr, cdg, cdb);
    ambient = new PVector(car, cag, cab);
    specular = new PVector(csr, csg, csb);
    this.p = p;
    this.krefl = krefl;
  }
  
  public PVector getDiffuse() {
    return diffuse;
  }
  
  public PVector getAmbient() {
    return ambient;
  }
  
  public PVector getSpecular() {
    return specular;
  }
  
  public float getP() {
    return p;
  }
  public float getKRefl() {
    return krefl;
  }
}
