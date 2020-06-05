int i = 5;
void setup() {
  size(600, 600); //set size of screen
}

void draw() {
  
  background(255, 255, 255);
  noStroke();
  int teal = 0;
  float centerx = width / 2.0;
  float centery = height / 2.0;
  float x = width / 2.0 - width / 6.0;
  float y = height / 2.0 - height / 6.0;
  float xwidth = width / 3.0;
  fill(0, teal, teal);
  rect(x, y, xwidth, xwidth);
  teal += 50;
  fill(0, teal, teal);
  xwidth /= 2;
  float movex = mouseX - xwidth / 2;
  float movey = mouseY - xwidth / 2;
  float offsetx = centerx - mouseX;
  float offsety = centery - mouseY;
  rect(movex, movey, xwidth, xwidth);
  rect(centerx + (offsetx - xwidth / 2), centery + (offsety - xwidth / 2), xwidth, xwidth);
  rect(centerx + (-offsety - xwidth / 2), centery + (offsetx - xwidth / 2), xwidth, xwidth);
  rect(centerx + (offsety - xwidth / 2), centery + (-offsetx - xwidth / 2), xwidth, xwidth);
  teal += 50;
  draw2(i, teal, mouseX, mouseY, offsetx / 2, offsety / 2, xwidth / 2);
  draw2(i, teal, centerx + offsetx, centery + offsety, offsetx / 2, offsety / 2, xwidth / 2);
  draw2(i, teal, centerx - offsety, centery + offsetx, offsetx / 2, offsety / 2, xwidth / 2);
  draw2(i, teal, centerx + offsety, centery - offsetx, offsetx / 2, offsety / 2, xwidth / 2);
}

void draw2(int i, int teal, float centerx, float centery, float offsetx, float offsety, float xwidth) {
  if (i == 0) {
    return;
  } else {
  
    fill(0, teal, teal);
    rect(centerx + (-offsetx - xwidth / 2), centery + (-offsety - xwidth / 2), xwidth, xwidth);
    rect(centerx + (offsetx - xwidth / 2), centery + (offsety - xwidth / 2), xwidth, xwidth);
    rect(centerx + (-offsety - xwidth / 2), centery + (offsetx - xwidth / 2), xwidth, xwidth);
    rect(centerx + (offsety - xwidth / 2), centery + (-offsetx - xwidth / 2), xwidth, xwidth);
    teal += 50;
    i--;
    draw2(i, teal, centerx - offsetx, centery - offsety, offsetx / 2, offsety / 2, xwidth / 2);
    draw2(i, teal, centerx + offsetx, centery + offsety, offsetx / 2, offsety / 2, xwidth / 2);
    draw2(i, teal, centerx - offsety, centery + offsetx, offsetx / 2, offsety / 2, xwidth / 2);
    draw2(i, teal, centerx + offsety, centery - offsetx, offsetx / 2, offsety / 2, xwidth / 2);
    
  }
}
