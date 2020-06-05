// This is the starter code for the CS 3451 Ray Tracing Project.
//
// The most important part of this code is the interpreter, which will help
// you parse the scene description (.cli) files.

boolean debug_flag;  // help to print information for just one pixel
ArrayList<Object> objects;
ArrayList<Light> lights;
Ray ray;
Surface surface;
float fov_angle;
color background;
PVector eye;
Camera camera;
Hit hit;

void setup() {
  size(500, 500);  
  noStroke();
  colorMode(RGB);
  background(0, 0, 0);
}

void reset_scene() {
  //reset the global scene variables here
  objects = new ArrayList();
  lights = new ArrayList();
  ray = null;
  surface = null;
  fov_angle = 0;
  background = 0;
  eye = null;
  camera = null;
  hit = null;
}

void keyPressed() {
  reset_scene();
  switch(key) {
    case '1':  interpreter("01.cli"); break;
    case '2':  interpreter("02.cli"); break;
    case '3':  interpreter("03.cli"); break;
    case '4':  interpreter("04.cli"); break;
    case '5':  interpreter("05.cli"); break;
    case '6':  interpreter("06.cli"); break;
    case '7':  interpreter("07.cli"); break;
    case '8':  interpreter("08.cli"); break;
    case '9':  interpreter("09.cli"); break;
    case '0':  interpreter("10.cli"); break;
    case '-':  interpreter("11.cli"); break;
    case 'q':  exit(); break;
  }
}

// this routine helps parse the text in the scene description files
void interpreter(String filename) {
  
  println("Parsing '" + filename + "'");
  String str[] = loadStrings(filename);
  if (str == null) println("Error! Failed to read the cli file.");
  
  for (int i = 0; i < str.length; i++) {
    
    String[] token = splitTokens(str[i], " ");  // Get a line and parse the tokens
    
    if (token.length == 0) continue; // Skip blank lines
    
    if (token[0].equals("fov")) {
      float fov = float(token[1]);
      // call routine to save the field of view
      fov_angle = radians(fov);
    }
    else if (token[0].equals("background")) {
      float r = float(token[1]);
      float g = float(token[2]);
      float b = float(token[3]);
      // call routine to save the background color
      background = color(r * 255, g * 255, b * 255);
    }
    else if (token[0].equals("eye")) {
      float x = float(token[1]);
      float y = float(token[2]);
      float z = float(token[3]);
      // call routine to save the eye position
      eye = new PVector(x, y, z);
    }
    else if (token[0].equals("uvw")) {
      float ux = float(token[1]);
      float uy = float(token[2]);
      float uz = float(token[3]);
      float vx = float(token[4]);
      float vy = float(token[5]);
      float vz = float(token[6]);
      float wx = float(token[7]);
      float wy = float(token[8]);
      float wz = float(token[9]);
      // call routine to save the camera's values for u,v,w
      camera = new Camera(ux,uy,uz,vx,vy,vz,wx,wy,wz);
    }
    else if (token[0].equals("light")) {
      float x = float(token[1]);
      float y = float(token[2]);
      float z = float(token[3]);
      float r = float(token[4]);
      float g = float(token[5]);
      float b = float(token[6]);
      // call routine to save lighting information
      lights.add(new Light(x, y, z, r, g, b));
    }
    else if (token[0].equals("surface")) {
      float Cdr = float(token[1]);
      float Cdg = float(token[2]);
      float Cdb = float(token[3]);
      float Car = float(token[4]);
      float Cag = float(token[5]);
      float Cab = float(token[6]);
      float Csr = float(token[7]);
      float Csg = float(token[8]);
      float Csb = float(token[9]);
      float P = float(token[10]);
      float K = float(token[11]);
      // call routine to save the surface material properties
      surface = new Surface(Cdr, Cdg, Cdb, 
      Car, Cag, Cab, Csr, Csg, Csb, P, K); 
    }    
    else if (token[0].equals("ellipsoid")) {
      float x = float(token[1]);
      float y = float(token[2]);
      float z = float(token[3]);
      float rx = float(token[4]);
      float ry = float(token[5]);
      float rz = float(token[6]);
      // call routine to save ellipsoid here
      objects.add(new Ellipsoid(surface,x,y,z,rx,ry,rz));
    }
    else if (token[0].equals("disk")) {
      float x = float(token[1]);
      float y = float(token[2]);
      float z = float(token[3]);
      float nx = float(token[4]);
      float ny = float(token[5]);
      float nz = float(token[6]);
      float radius = float(token[7]);
      // call routine to save disk here
      objects.add(new Disk(surface, x, y, z, nx, ny, nz, radius));
    }
    else if (token[0].equals("write")) {
      draw_scene();   // here is where you actually perform the ray tracing
      println("Saving image to '" + token[1] + "'");
      save(token[1]); // this saves your ray traced scene to a .png file
    }
    else if (token[0].equals("#")) {
      // comment symbol (ignore this line)
    }
    else {
      println ("cannot parse this line: " + str[i]);
    }
  }
}



// This is where you should place your code for creating the eye rays and tracing them.
void draw_scene() {
  for(int y = 0; y < height; y++) {
    for(int x = 0; x < width; x++) {
      
      // maybe turn on a debug flag for a particular pixel (so you can print ray information)
      if (x == 3000 && y == 3000)
        debug_flag = true;
      else
        debug_flag = false;
      

      // create and cast an eye ray here
      
      hit = null;
      float d = 1.0 / tan(fov_angle/2.0);
      float u = -1.0 + (2.0 * x) / (float) width;
      float v = -(-1.0 + (2.0 * y) / (float) height);
      PVector ray_direction = PVector.mult(camera.getW(), -d);
      ray_direction.add(PVector.mult(camera.getU(), u));
      ray_direction.add(PVector.mult(camera.getV(), v));
      
      Ray ray = new Ray(ray_direction, eye);
      
      hit = testIntersection(ray);
      
      //set the pixel color
      if (hit != null) {
        PVector cvector = shading(hit, ray, 0);
        color c = color(cvector.x * 255.0, cvector.y * 255.0, cvector.z * 255.0);
        fill(c);
      } else {
        fill (background);   // you should put the pixel color here, converting from [0,1] to [0,255]
      }
      rect (x, y, 1, 1);   // make a tiny rectangle to fill the pixel
      
    }
  }
}
Hit testIntersection(Ray ray) {
  ArrayList<Hit> hits = new ArrayList<Hit>();
  //eye rays
  for (Object obj : objects) {
    if (obj instanceof Disk) {
      Disk disk = (Disk) obj;
      float radius = disk.getRadius();
      if (PVector.dot(disk.getNormal(), ray.getDirection().normalize()) != 0) {
        float t = (PVector.dot(PVector.sub(disk.getCenter(), ray.getOrigin()), disk.getNormal())) / 
        PVector.dot(ray.getDirection().normalize(), disk.getNormal());
        
        PVector newRay = PVector.add(ray.getOrigin(), PVector.mult(ray.getDirection().normalize(), t));
        
        if (PVector.dist(disk.getCenter(), newRay) <= radius) {
          hits.add(new Hit(newRay, disk.getNormal(), t, disk));
        }
      }
    }
    if (obj instanceof Ellipsoid) {
      Ellipsoid el = (Ellipsoid) obj;
      PVector xyz = PVector.sub(ray.getOrigin(), el.getCenter());
      PVector direction = ray.getDirection().normalize();
      float a = pow(direction.x, 2) / pow(el.getRadii().x, 2) + pow(direction.y, 2) / pow(el.getRadii().y, 2) 
        + pow(direction.z, 2) / pow(el.getRadii().z, 2);
      float b = 2 * (xyz.x * direction.x / pow(el.getRadii().x, 2) 
        + xyz.y * direction.y / pow(el.getRadii().y, 2) 
        + xyz.z * direction.z / pow(el.getRadii().z, 2));
      float c = pow(xyz.x, 2) / pow(el.getRadii().x, 2) + pow(xyz.y, 2) / pow(el.getRadii().y, 2) 
        + pow(xyz.z, 2) / pow(el.getRadii().z, 2) - 1;
      float determinant = sq(b) - 4.0 * a * c;
      if (determinant >= 0) {
        
        float t1 = (-b + sqrt(determinant)) / (2.0 * a);
        float t2 = (-b - sqrt(determinant)) / (2.0 * a);
        
        PVector hit_origin = PVector.add(ray.getOrigin(), PVector.mult(ray.getDirection(), t1));
        PVector hit_normal = PVector.sub(hit_origin, el.getCenter());
        hit_normal.x /= sq(el.getRadii().x);
        hit_normal.y /= sq(el.getRadii().y);
        hit_normal.z /= sq(el.getRadii().z);
        hit_normal.normalize();
        hit = new Hit(hit_origin, hit_normal, t1, el);
        hits.add(hit);
        
        hit_origin = PVector.add(ray.getOrigin(), PVector.mult(ray.getDirection(), t2));
        hit_normal = PVector.sub(hit_origin, el.getCenter()).normalize();
        hit_normal.x /= sq(el.getRadii().x);
        hit_normal.y /= sq(el.getRadii().y);
        hit_normal.z /= sq(el.getRadii().z);
        hit_normal.normalize();
        hit = new Hit(hit_origin, hit_normal, t2, el);
        hits.add(hit);
      }
    }
  }
  hit = null;
  float near_t = Float.MAX_VALUE;
  for (Hit some_hit : hits) {
    if (some_hit.getT() < near_t && some_hit.getT() >= 0) {
      near_t = some_hit.getT();
      hit = some_hit;
    }
  }
  return hit;
}
PVector shading(Hit hit, Ray eye_ray, int depth) {
  PVector c = new PVector();
  
  
  if (hit != null) {
    PVector diff = new PVector(0,0,0);
    PVector amb = new PVector(0,0,0);
    PVector spec = new PVector(0,0,0);
    PVector normal = new PVector(0,0,0);
    float p = 0;
    float krefl = 0;
    
    if (hit.getShape() instanceof Disk) {
      Disk shape = (Disk) hit.getShape();
      diff = shape.getSurface().getDiffuse();
      amb = shape.getSurface().getAmbient();
      spec = shape.getSurface().getSpecular();
      p = shape.getSurface().getP();
      krefl = shape.getSurface().getKRefl();
    }
    if (hit.getShape() instanceof Ellipsoid) {
      Ellipsoid shape = (Ellipsoid) hit.getShape();
      diff = shape.getSurface().getDiffuse();
      amb = shape.getSurface().getAmbient();
      spec = shape.getSurface().getSpecular();
      p = shape.getSurface().getP();
      krefl = shape.getSurface().getKRefl();
    }
    
    PVector e = PVector.sub(eye_ray.getOrigin(), hit.getPosition()).normalize();
    normal = hit.getNormal().normalize();
    
    
    PVector refl = new PVector(0,0,0);
    if (krefl > 0 && depth < 10) {
      PVector r = PVector.sub(PVector.mult(normal, PVector.dot(normal, e) * 2.0), e);
      Ray refl_Ray = new Ray(r, PVector.add(hit.getPosition(), PVector.mult(r, 0.0001)));
      Hit reflHit = testIntersection(refl_Ray);
      if (reflHit == null) {
        PVector bg = new PVector(red(background)/255, green(background)/255, blue(background)/255);
        refl = PVector.add(refl, bg);
      } else {
        refl.add(shading(reflHit, refl_Ray, depth + 1));
      }
    }
    c.x += refl.x * krefl;
    c.y += refl.y * krefl;
    c.z += refl.z * krefl;
    
    
    c.x += diff.x * amb.x;
    c.y += diff.y * amb.y;
    c.z += diff.z * amb.z;
    
    for (Light light : lights) {
      PVector shadow_origin = hit.getPosition();
      PVector shadow_direction = PVector.sub(light.getOrigin(), hit.getPosition());
      Ray shadow_ray = new Ray(shadow_direction, PVector.add(shadow_origin, PVector.mult(shadow_direction, 0.0001)));
      Hit shadow_hit = testIntersection(shadow_ray);
      if (shadow_hit == null || PVector.sub(light.getOrigin(), hit.getPosition()).mag() < shadow_hit.getT()) {
        PVector l = PVector.sub(light.getOrigin(), hit.getPosition()).normalize();
        
        c.x += diff.x * light.getColor().x * max(0, PVector.dot(normal, l));
        c.y += diff.y * light.getColor().y * max(0, PVector.dot(normal, l));
        c.z += diff.z * light.getColor().z * max(0, PVector.dot(normal, l));
        
        PVector h = PVector.add(l, e).normalize();
        PVector spec_color = new PVector(0, 0, 0);
        spec_color.x = light.getColor().x * spec.x * max(0, pow(PVector.dot(h, normal), p));
        spec_color.y = light.getColor().y * spec.y * max(0, pow(PVector.dot(h, normal), p));
        spec_color.z = light.getColor().z * spec.z * max(0, pow(PVector.dot(h, normal), p));
        
        c.x += spec_color.x;
        c.y += spec_color.y;
        c.z += spec_color.z;
      
      }
    }
  }
 
  return c;
}

void draw() {
  // nothing should be put here for this project
}

// use this routine to find the coordinates of a particular pixel (for debugging)
void mousePressed()
{
  println ("Mouse pressed at location: " + mouseX + " " + mouseY);
}
