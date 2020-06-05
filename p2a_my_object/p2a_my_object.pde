// 3D Scene Example

float time = 0;  // keep track of the passing of time
float time2 = 0;
float time3 = 0;
float time4 = 0;
float rate = 1;
float rate2 = 1;
float walkrhythm = 0;
float tailY = -PI/8;
float tailZ = PI/32; 
float tail2y = -PI/8; 
float tail2z = PI/32; 
float neckY = 0; 
float neckZ = -PI/48; 
float leg = -PI/12; 
float section2y = 0; 
float section2z = -PI/48; 
float headX = 0; 
float headY = 0; 
float headZ = 0; 
float jaw = 0; 
float xeye = 0; 
float yeye = 0; 
float zeye = 0;
float leafsize = 1;
boolean run = false;
float i = 0;

void setup() {
  size(800, 800, P3D);  // must use 3D here!
  noStroke();           // do not draw the edges of polygons
}

// Draw a scene with a cylinder, a box and a sphere
void draw() {
  
  resetMatrix();  // set the transformation matrix to the identity (important!)

  background(150, 200, 255);  

  // set up for perspective projection
  perspective (PI * 0.333, 1.0, 0.01, 1000.0);

  
  
  // create an ambient light source
  ambientLight (102, 102, 102);

  // create two directional light sources
  lightSpecular (204, 204, 204);
  directionalLight (202, 202, 202, -0.7, -0.7, -1);
  directionalLight (202, 202, 202, -0.7, -0.7, 1);
  directionalLight (202, 202, 202, 0, 1, 1);
  directionalLight(152, 152, 152, 0, 1, 0);
  
  // place the camera in the scene
  
  if (time < 25) {
    camera (50.0 + time*40, -50.0, 100.0, 0.0, 1.0, -1.0, 0.0, 1.0, 0.0);
  } else if (time >= 25 && time < 30) {
    camera (80 + time*20, 10, 60, time*20, 0.0, -1.0, 0.0, 1.0, 0.0);
  } else if (time >= 30 && time < 35) {
    camera (-10 + time*20, -60, -100, time*20, 0.0, -1.0, 0.0, 1.0, 0.0);
  } else if (time >= 35 && time < 40) {
    camera (80 + time*20, -20, 20, 0.0, 0.0, -1.0, 0.0, 1.0, 0.0);
  } else if (time > 40 && time < 45) {
    camera (80 + 40*20, -20, 20, 0, 0, -1, 0, 1, 0);
    time4 = time;
  } else if (time > 45 && time < 47.5) {
    camera ((time - 10)*30 - 100, -20, -40, 1500, 0, 0, 0, 1, 0);
    time4 += 0.03;
    rate2 += 0.01;
  } else if (time > 47.5 && time < 56) {
    camera (80 + 40*20, -20, 20, 0, 0, 0, 0, 1, 0);
  } /*else if (time > 50 && time < 56) {
    camera (700, -20, -40, 800, 0, 0, 0, 1, 0);
  }*/ else if (time > 56 && time < 60) {
    camera ((time - 16)*30 - 100, -20, -40, 1500, 0, 0, 0, 1, 0);
  } else if (time > 60 && time < 64.5) {
    camera ((time - 16)*30 - 100, -40, 100 - time3, (time - 16)*30, 0, 0, 0, 1, 0);
    time3 += 0.03;
  } else if (time > 64.5 && time < 67.5) {
    camera(1450, -20, 100, 1450, 0, 0, 0, 1, 0);
    time3 = 0;
  } else if (time > 67.5 && time < 71) {
    camera(1600, -70, 0, 1450, 0, 0, 0, 1, 0);
  } else if (time > 71 && time < 74.5) {
    camera(1500, -70, -50, 1450, 0, 0, 0, 1, 0);
  } else if (time > 74.5 && time < 80) {
    camera(1500, -15, 40, 1450, 0, 0, 0, 1, 0);
  } else if (time > 80 && time < 86) {
    camera(1500 - time3*10, -15, 40, 1250, 0, 0, 0, 1, 0);
    time3 += 0.03;
  } else if (time > 86 && time < 86.5) {
    camera(1500 - time3*10, -15, 40, 1250, 0, 0, 0, 1, 0);
    time3 += 0.03;
  } else if (time > 86.5 && time < 95) {
    camera(1500 - time3*10, -15, 40, 1250, 0, 0, 0, 1, 0);
  }
  //camera (0, 0, 100, 0, 1, -1, 0, 1, 0);
  pushMatrix();
    fill(150, 150, 120);
    translate(-1000, 28, 1000);
    rotateX(PI/2);
    rect(-2500, -2500, 10000, 5000);
  popMatrix();
  
  pushMatrix();
    translate(1500, -22, 0);
    livingTree(leafsize);
  popMatrix();
  
  pushMatrix();
    translate(50, -22, 60);
    rotateY(PI/6);
    deadTree();
  popMatrix();
  pushMatrix();
    translate(-100, -22, -50);
    deadTree();
  popMatrix();
  pushMatrix();
    translate(300, -22, 100);
    rotateY(-PI/6);
    deadTree();
  popMatrix();
  pushMatrix();
    translate(200, -22, -300);
    rotateY(PI/3);
    deadTree();
  popMatrix();
  pushMatrix();
    translate(50, -22, 60);
    rotateY(PI/6);
    deadTree();
  popMatrix();
  pushMatrix();
    translate(400, -22, -150);
    deadTree();
  popMatrix();
  pushMatrix();
    translate(500, -22, 150);
    rotateY(-PI/6);
    deadTree();
  popMatrix();
  pushMatrix();
    translate(600, -22, -100);
    rotateY(PI/3);
    deadTree();
  popMatrix();
  pushMatrix();
    translate(900, -22, -44);
    deadTree();
  popMatrix();
  pushMatrix();
    translate(700, -22, 44);
    rotateY(-PI/6);
    deadTree();
  popMatrix();
  pushMatrix();
    translate(800, -22, -50);
    rotateY(PI/3);
    deadTree();
  popMatrix();
  pushMatrix();
    translate(1450, -22, -104);
    deadTree();
  popMatrix();
  pushMatrix();
    translate(1300, -22, 80);
    rotateY(-PI/6);
    deadTree();
  popMatrix();
  pushMatrix();
    translate(1200, -22, -150);
    rotateY(PI/3);
    deadTree();
  popMatrix();
  if (time < 40) {
    if (walkrhythm > 1.5) {
      walkrhythm = 0;
    }
    if (walkrhythm == 0) {
      pushMatrix();
      translate(time*20, 0, 0);
      littlefoot();
      popMatrix();
    }
    if (walkrhythm > 0 && walkrhythm < 0.75) {

      pushMatrix();
  
      ambient (25, 25, 25);
      specular (55, 55, 55);
    
      translate(time*20, 0, 0);
      tailY += PI/100;
      tail2y += PI/100;
      leg += PI/150;
      neckZ += PI/600;
      section2z += PI/600;
      littlefoot();

      popMatrix();
    }
    if (walkrhythm > 0.75) {

      pushMatrix();
  
      ambient (25, 25, 25);
      specular (55, 55, 55);
    
      translate(time*20, 0, 0);
      tailY -= PI/100;
      tail2y -= PI/100;
      leg -= PI/150;
      neckZ -= PI/600;
      section2z -= PI/600;
      littlefoot();

      popMatrix();
      
    }
    walkrhythm += 0.03;
  }
  if (time > 40 && time < 42) {
    pushMatrix();
     while (tailY > 0) {
       tailY -= PI/100;
     }
     while (tailY < 0) {
       tailY += PI/100;
     }
     while (tail2y > 0) {
       tail2y -= PI/100;
     }
     while (tail2y < 0) {
       tail2y += PI/100;
     }
     while (leg > 0) {
       leg -= PI/150;
     }
     while (leg < 0) {
       leg += PI/150;
     }
     while (neckZ > 0) {
       neckZ -= PI/600;
     }
     while (neckZ < 0) {
       neckZ += PI/600;
     }
     while (section2z > 0) {
       section2z -= PI/600;
     }
     while (section2z < 0) {
       section2z += PI/600;
     }
     translate(40 * 20, 0, 0);
     littlefoot();
    popMatrix();
  }
  if (time > 42 && time < 42.5) {
    pushMatrix();
      jaw += PI/100;
      translate(40*20, 0, 0);
      littlefoot();
    popMatrix();
  }
  if (time > 42.5 && time < 56) {
    pushMatrix();
      translate(40*20, 0, 0);
      littlefoot();
    popMatrix();
  }
  if (time == 56) {
    walkrhythm = 0;
    run = true;
  }
  if (time > 56 && time < 64) {
    run = true;
    if (walkrhythm > 1.5) {
      walkrhythm = 0;
    }
    if (walkrhythm == 0) {
      pushMatrix();
      translate((time - 16)*30, 0, 0);
      littlefoot();
      popMatrix();
    }
    if (walkrhythm > 0 && walkrhythm < 0.75) {

      pushMatrix();
  
      ambient (25, 25, 25);
      specular (55, 55, 55);
    
      translate((time - 16) * 30, 0, 0);
      tailZ += PI/120;
      tail2z += PI/120;
      leg -= PI/100;
      neckZ += PI/300;
      section2z += PI/300;
      jaw -= PI/150;
      littlefoot();

      popMatrix();
    }
    if (walkrhythm > 0.75) {

      pushMatrix();
  
      ambient (25, 25, 25);
      specular (55, 55, 55);
    
      translate((time - 16)*30, 0, 0);
      tailZ -= PI/120;
      tail2z -= PI/120;
      leg += PI/100;
      neckZ -= PI/300;
      section2z -= PI/300;
      jaw += PI/150;
      littlefoot();

      popMatrix();
      
    }
    
    walkrhythm += 0.03;
  }
  
  if (time > 64 && time < 64.5) {
    pushMatrix();
     while (tailZ > 0) {
       tailZ -= PI/100;
     }
     while (tailZ < 0) {
       tailZ += PI/100;
     }
     while (tail2z > 0) {
       tail2z -= PI/100;
     }
     while (tail2z < 0) {
       tail2z += PI/100;
     }
     while (leg > 0) {
       leg -= PI/150;
     }
     while (leg < 0) {
       leg += PI/150;
     }
     while (neckZ > 0) {
       neckZ -= PI/600;
     }
     while (neckZ < 0) {
       neckZ += PI/600;
     }
     while (section2z > 0) {
       section2z -= PI/600;
     }
     while (section2z < 0) {
       section2z += PI/600;
     }
     while (jaw > 0) {
       jaw -= PI/100;
     }
     while (jaw < 0) {
       jaw += PI/100;
     }
     translate(48*30, 0, 0);
     littlefoot();
    popMatrix();
  }
  
  if (time == 64.5) {
    walkrhythm = 0;
  }
  if (time > 64.5 && time < 74.5) {
    if (walkrhythm > 1) {
      walkrhythm = 0;
    }
    if (walkrhythm < 0.5) {
      pushMatrix(); 
        neckZ += PI/150;
        section2z += PI/150;
        headZ += PI/150;
        jaw -= PI/50;
        translate(48*30, 0, 0);
        littlefoot();
      popMatrix();
    }
    if (walkrhythm > 0.5) {
      leafsize -= 0.006;
      pushMatrix(); 
        neckZ -= PI/150;
        section2z -= PI/150;
        headZ -= PI/150;
        jaw += PI/50;
        translate(48*30, 0, 0);
        littlefoot();
      popMatrix();
    }
    walkrhythm += 0.03;
  }
  if (time > 74.5 && time < 78.5) {
    pushMatrix();
     while (tailZ > 0) {
       tailZ -= PI/100;
     }
     while (tailZ < 0) {
       tailZ += PI/100;
     }
     while (tail2z > 0) {
       tail2z -= PI/100;
     }
     while (tail2z < 0) {
       tail2z += PI/100;
     }
     while (leg > 0) {
       leg -= PI/150;
     }
     while (leg < 0) {
       leg += PI/150;
     }
     while (neckZ > 0) {
       neckZ -= PI/600;
     }
     while (neckZ < 0) {
       neckZ += PI/600;
     }
     while (section2z > 0) {
       section2z -= PI/600;
     }
     while (section2z < 0) {
       section2z += PI/600;
     }
     while (jaw > 0) {
       jaw -= PI/100;
     }
     while (jaw < 0) {
       jaw += PI/100;
     }
     translate(48*30, 0, 0);
     littlefoot();
    popMatrix();
    pushMatrix();
      translate(48*28, 0, 0);
      littlefoot(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
    popMatrix();
  }
  if (time > 78.5 && time < 80) {
    yeye += PI/200;
    pushMatrix();
      translate(48*30, 0, 0);
      littlefoot();
    popMatrix();
    pushMatrix();
      translate(48*28, 0, 0);
      littlefoot(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
    popMatrix();
  }
  if (time > 80 && time < 86.5) {
    pushMatrix();
      translate(48*30, 0, 0);
      littlefoot();
    popMatrix();
    pushMatrix();
      translate(48*28, 0, 0);
      littlefoot(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
    popMatrix();
  }
  if (time == 86.5) {
    walkrhythm = 0;
  }
  if (time > 86.5 && time < 87) {
    pushMatrix();
      translate(48*30, 0, 0);
      littlefoot();
    popMatrix();
    pushMatrix();
      translate(48*28, 0, 0);
      littlefoot(0,0,0,0,0,0,0,0,0,i,0,0,0,0,0,0);
    popMatrix();
    i += PI / 200;
  }
  if (time > 87 && time < 95) {
    pushMatrix();
      translate(48*30, 0, 0);
      littlefoot();
    popMatrix();
    if (walkrhythm > 2) {
      walkrhythm = 0;
    }
    if (walkrhythm < 1) {
      pushMatrix();
        translate(48*28, 0, 0);
        littlefoot(0,0,0,0,0,0,0,0,0,i,0,0,0,0,0,0);
      popMatrix();
      i -= PI / 200;
    }
    if (walkrhythm > 1) {
      pushMatrix();
        translate(48*28, 0, 0);
        littlefoot(0,0,0,0,0,0,0,0,0,i,0,0,0,0,0,0);
      popMatrix();
      i += PI / 200;
    }
    walkrhythm += 0.03;
  }
  
  // step forward the time
  time += 0.03;
}

void deadTree() {
  pushMatrix();
    fill(90, 90, 50);
    truncatedCone(1, 4, 50, 7);
   popMatrix();
   pushMatrix();
     translate(0, 10, 0);
     rotateZ(PI/2);
     truncatedCone(1.5, 0.5, 20, 7);
   popMatrix();
   pushMatrix();
     translate(0, 20, 0);
     rotateX(PI/2);
     truncatedCone(1.5, 0.5, 15, 7);
   popMatrix();
   pushMatrix();
     translate(0, 25, 0);
     rotateY(PI/3);
     rotateX(-PI/2);
     truncatedCone(1.5, 0.5, 25, 7);
   popMatrix();
   pushMatrix();
     translate(0, 5, 0);
     rotateY(PI/2);
     rotateZ(PI/1.9);
     truncatedCone(1.5, 0.5, 20, 7);
   popMatrix();
   pushMatrix();
     translate(0, 15, 0);
     rotateY(PI/3);
     rotateX(PI/1.7);
     truncatedCone(1.5, 0.5, 15, 7);
   popMatrix();
   pushMatrix();
     translate(0, 30, 0);
     rotateY(-PI/6);
     rotateX(-PI/2.4);
     truncatedCone(1.5, 0.5, 25, 7);
   popMatrix();
}

void livingTree(float leafsize) {
  pushMatrix();
    deadTree();
  popMatrix();
  pushMatrix();
    fill(0, 255, 0);
    translate(-20, 10, 0);
    scale(leafsize);
    
    sphere(7);
  popMatrix();
}

void littlefoot(float tailY, float tailZ, float tail2y, float tail2z, float neckY, float neckZ, 
float section2y, float section2z, float headX, float headY, float headZ, float jaw, float xeye, 
float yeye, float zeye, float leg) {
  torso();
  pushMatrix();
    translate(-12, 0, 0);
    rotateY(tailY);
    rotateZ(tailZ);
    tailsection1(tail2y, tail2z);
  popMatrix();
  pushMatrix();
    translate(12, 0, 0);
    rotateY(neckY);
    rotateZ(neckZ);
    necksection1(section2y, section2z, headX, headY, headZ, jaw, xeye, yeye, zeye);
  popMatrix();
  pushMatrix();
    translate(-5*cos(60), -5*cos(65), -5*cos(60));
    rotateZ(leg);
    frontRight();
  popMatrix();
  pushMatrix();
    translate(-5*cos(60), -5*cos(65), 5*cos(60));
    if (run) {
      rotateZ(leg);
    } else {
      rotateZ(-leg);
    }
    frontLeft();
  popMatrix();
  pushMatrix();
    translate(5*cos(60), -5*cos(65), 5*cos(60));
    if (run) {
      rotateZ(-leg);
    } else {
      rotateZ(leg);
    }
    backLeft();
  popMatrix();
  pushMatrix();
    translate(5*cos(60), -5*cos(65), -5*cos(60));
    rotateZ(-leg);
    backRight();
  popMatrix();
}

void littlefoot() {
  torso();
  pushMatrix();
    translate(-12, 0, 0);
    rotateY(tailY);
    rotateZ(tailZ);
    tailsection1(tail2y, tail2z);
  popMatrix();
  pushMatrix();
    translate(12, 0, 0);
    rotateY(neckY);
    rotateZ(neckZ);
    necksection1(section2y, section2z, headX, headY, headZ, jaw, xeye, yeye, zeye);
  popMatrix();
  pushMatrix();
    translate(-5*cos(60), -5*cos(65), -5*cos(60));
    rotateZ(leg);
    frontRight();
  popMatrix();
  pushMatrix();
    translate(-5*cos(60), -5*cos(65), 5*cos(60));
    if (run) {
      rotateZ(leg);
    } else {
      rotateZ(-leg);
    }
    frontLeft();
  popMatrix();
  pushMatrix();
    translate(5*cos(60), -5*cos(65), 5*cos(60));
    if (run) {
      rotateZ(-leg);
    } else {
      rotateZ(leg);
    }
    backLeft();
  popMatrix();
  pushMatrix();
    translate(5*cos(60), -5*cos(65), -5*cos(60));
    rotateZ(-leg);
    backRight();
  popMatrix();
}

void torso() {
  pushMatrix();
  
  fill(220, 190, 220);
  shininess(10);
  
  scale(15);
  sphereDetail(15);
  sphere(1);
  
  popMatrix();
  
  pushMatrix();
  
  fill(220, 220, 180);
  shininess(10);
  
  translate(0, 0.5, 0);
  sphereDetail(15);
  sphere(15);
  
  popMatrix();
  
  pushMatrix();
  fill(220, 190, 220);
  shininess(10);
  
  translate(10, 0, 0);
  sphereDetail(15);
  sphere(8);
  
  popMatrix();
  
  pushMatrix();
  fill(220, 220, 180);
  shininess(10);
  
  translate(10, 0.5, 0);
  sphereDetail(15);
  sphere(8);
  
  popMatrix();
  
  pushMatrix();
  fill(220, 190, 220);
  shininess(10);
  
  translate(-10, 0, 0);
  sphereDetail(15);
  sphere(10);
  
  popMatrix();
  
  pushMatrix();
  fill(220, 220, 180);
  shininess(10);
  
  translate(-10, 0.5, 0);
  sphereDetail(15);
  sphere(10);
  
  popMatrix();
  
  pushMatrix();
  fill(150, 100, 150);
  shininess(10);
  
  translate(-10, -0.5, 0);
  rotateZ(PI/6);
  rotateX(PI/6);
  sphere(8);
  
  popMatrix();
  
  pushMatrix();
  
  fill(220, 220, 180);
  shininess(10);
  
  translate(-10, 0, 0);
  sphereDetail(15);
  sphere(8);
  
  popMatrix();
  
  pushMatrix();
  fill(220, 190, 220);
  shininess(10);
  
  translate(7, 0, 0);
  sphereDetail(15);
  sphere(10);
  
  popMatrix();
  
  pushMatrix();
  
  fill(220, 220, 180);
  shininess(10);
  
  translate(7, 0.5, 0);
  sphereDetail(15);
  sphere(10);
  
  popMatrix();
  
  
  pushMatrix();
  fill(220, 190, 220);
  shininess(10);
  
  translate(-5, 0, 0);
  rotate(PI/2);
  truncatedCone(14, 8.8, 9, 20);
  
  
  popMatrix();
  
  pushMatrix();
  fill(220, 220, 180);
  shininess(10);
  
  translate(-5, 0.5, 0);
  rotate(PI/2);
  truncatedCone(14, 8.8, 9, 20);
  
  
  popMatrix();
  
  pushMatrix();
  
  fill(150, 100, 150);
  shininess(10);
  
  scale(10);
  translate(0, -0.44, -0.44);
  sphereDetail(10);
  sphere(1);
  
  popMatrix();
  
  pushMatrix();
  
  fill(220, 220, 180);
  shininess(10);
  
  translate(0, 0.5, 0);
  sphereDetail(15);
  sphere(10);
  
  popMatrix();
  
  pushMatrix();
  
  fill(150, 100, 150);
  shininess(10);
  
  scale(10);
  translate(0, -0.44, 0.44);
  sphereDetail(10);
  sphere(1);
  
  popMatrix();
  
  pushMatrix();
  
  fill(150, 100, 150);
  shininess(10);
  
  scale(10);
  translate(0, -0.58, 0);
  sphereDetail(10);
  sphere(1);
  
  popMatrix();
  
  pushMatrix();
  
  fill(150, 100, 150);
  shininess(10);
  
  rotateZ(PI/6);
  scale(10);
  translate(0, -0.58, 0);
  sphereDetail(10);
  
  sphere(1);
  
  popMatrix();
  
  pushMatrix();
  
  fill(150, 100, 150);
  shininess(10);
  
  rotateZ(-PI/6);
  scale(10);
  translate(0, -0.58, 0);
  
  sphere(1);
  
  popMatrix();
  
  pushMatrix();
  
  fill(150, 100, 150);
  shininess(10);
  
  rotateZ(-PI/6);
  rotateX(PI/6);
  scale(10);
  translate(0, -0.58, 0);
  sphereDetail(10);
  sphere(1);
  
  popMatrix();
  
  pushMatrix();
  
  fill(150, 100, 150);
  shininess(10);
  
  rotateZ(-PI/6);
  rotateX(-PI/6);
  scale(10);
  translate(0, -0.58, 0);
  
  sphere(1);
  
  popMatrix();
  
  pushMatrix();
  
  fill(150, 100, 150);
  shininess(10);
  
  rotateZ(PI/6);
  rotateX(PI/6);
  scale(10);
  translate(0, -0.58, 0);
  
  sphere(1);
  
  popMatrix();
  
  pushMatrix();
  
  fill(150, 100, 150);
  shininess(10);
  
  rotateZ(PI/6);
  rotateX(-PI/6);
  scale(10);
  translate(0, -0.58, 0);
  
  sphere(1);
  
  popMatrix();
  
  pushMatrix();
  fill(150, 100, 150);
  shininess(10);
  
  translate(-5, -5, 0);
  rotate(PI/2.5);
  truncatedCone(9, 7, 9, 50);
  
  
  popMatrix();
}

void necksection1(float section2y, float section2z, float headX, float headY, float headZ, float jaw, float xeye, float yeye, float zeye) {
  pushMatrix();
  fill(220, 190, 220);
  shininess(10);
  
  rotateZ(-3*PI/4);
  truncatedCone(6.4, 4, 15, 50);
  popMatrix();
  
  pushMatrix();
  fill(220, 190, 220);
  shininess(10);
  
  translate(10, -10, 0);
  rotateZ(-3*PI/4);
  sphere(4);
  
  popMatrix();
  
  pushMatrix();
  fill(220, 220, 180);
  shininess(10);
  
  translate(0, 0.5, 0);
  rotateZ(-3*PI/4);
  truncatedCone(6.4, 4, 15, 50);
  popMatrix();
  
  pushMatrix();
    translate(10, -10, 0);
    rotateY(section2y);
    rotateZ(section2z);
    necksection2(headX, headY, headZ, jaw, xeye, yeye, zeye);
  popMatrix();
  
}

void necksection2(float headX, float headY, float headZ, float jaw, float xeye, float yeye, float zeye) {
  pushMatrix();
  fill(220, 190, 220);
  shininess(10);
  
  rotateZ(-3*PI/3.8);
  truncatedCone(4, 3, 10, 30);
  popMatrix();
  
  pushMatrix();
  fill(220, 220, 180);
  shininess(10);
  
  translate(0, 0.5, 0);
  rotateZ(-3*PI/3.8);
  truncatedCone(4, 3, 10, 30);
  popMatrix();
  
  pushMatrix();
    rotateX(headX);
    rotateY(headY);
    rotateZ(headZ);
    translate(8, -5, 0);
    head(jaw, xeye, yeye, zeye);
  popMatrix();
}

void tailsection1(float tail2y, float tail2z) {
  pushMatrix();
  fill(220, 190, 220);
  shininess(10);
  
  rotate(PI/2);
  truncatedCone(9, 5, 15, 30);
  popMatrix();
  
  pushMatrix();
  fill(220, 190, 220);
  shininess(10);
  
  translate(-15, 0, 0);
  sphere(5);
  
  popMatrix();
  
  pushMatrix();
  fill(150, 100, 150);
  shininess(10);
  
  translate(2, -5.5, 0);
  rotateZ(PI/2.3);
  truncatedCone(5, 3, 15, 30);
  popMatrix();
  
  pushMatrix();
  fill(220, 220, 180);
  shininess(10);
  
  translate(0, 0.5, 0);
  rotateZ(PI/2);
  truncatedCone(9.2, 5, 15.5, 30);
  popMatrix();
  
  pushMatrix();
    translate(-16, 0, 0);
    rotateY(tail2y);
    rotateZ(tail2z);
    tailsection2();
  popMatrix();
}

void tailsection2() {
  pushMatrix();
  fill(220, 190, 220);
  shininess(10);
  
  rotate(PI/2);
  truncatedCone(5, 0.5, 20, 30);
  popMatrix();
  
  pushMatrix();
  fill(220, 190, 220);
  shininess(10);
  
  translate(-20, 0, 0);
  sphere(0.5);
  
  popMatrix();
  
  pushMatrix();
  fill(150, 100, 150);
  shininess(10);
  
  translate(2, -4.65, 0);
  rotateZ(PI/2.3);
  truncatedCone(1, 0.5, 21, 30);
  popMatrix();
  
  pushMatrix();
  fill(220, 220, 180);
  shininess(10);
  
  translate(0, 0.5, 0);
  rotateZ(PI/2);
  truncatedCone(5, 0.5, 20, 30);
  popMatrix();
  
}

void head(float jaw, float xeye, float yeye, float zeye) {
  pushMatrix();
  
  fill(220, 190, 220);
  shininess(10);
  
  sphere(6);
  
  popMatrix();
  
  pushMatrix();
  
  fill(220, 220, 180);
  shininess(10);
  
  translate(0, 1.5, 0);
  sphere(5);
  
  popMatrix();
  
  pushMatrix();
  
  fill(150, 100, 150);
  shininess(10);
  
  translate(-1.5, -1.5, 0);
  sphere(5.5);
  
  popMatrix();
  
  pushMatrix();
  
  fill(220, 190, 220);
  shininess(10);
  
  translate(4, -0.5, 0);
  rotateZ(PI/5);
  box(6.5, 4, 8.5);
  
  popMatrix();
  
  pushMatrix();
  
  fill(220, 220, 180);
  shininess(10);
  
  translate(5, 2.2, 0);
  box(5, 4, 9);
  
  popMatrix();
  
  pushMatrix();
  
  fill(220, 220, 180);
  shininess(10);
  
  translate(7.1, 0.2, 3);
  cylinder(1.5, 4, 10);
  
  popMatrix();
  
  pushMatrix();
  
  fill(220, 220, 180);
  shininess(10);
  
  translate(7.1, 0.2, -3);
  cylinder(1.5, 4, 10);
  
  popMatrix();
  
  pushMatrix();
  
  fill(255, 255, 255);
  shininess(10);
  
  translate(7.1, 4.2, -3);
  box(1.5);
  
  popMatrix();
  
  pushMatrix();
  
  fill(255, 255, 255);
  shininess(10);
  
  translate(7.1, 4.2, 3);
  box(1.5);
  
  popMatrix();
  
  pushMatrix();
  
  fill(220, 220, 180);
  shininess(10);
  
  translate(4, 2.2, 0);
  box(8.8, 4, 5);
  
  popMatrix();
  
  pushMatrix();
    
    translate(1, -1.5, -3);
    rotateY(-PI/3.5);
    rotateX(-PI/10);
    rotateX(-xeye);
    rotateY(-yeye);
    rotateZ(-zeye);
    eye();
  popMatrix();
  
  pushMatrix();
    translate(1, -1.5, 3);
    rotateY(PI/3.5);
    rotateX(PI+PI/10);
    rotateX(xeye);
    rotateY(yeye);
    rotateZ(zeye);
    eye();
  popMatrix();
  
  pushMatrix();
    translate(1.5, 4.5, 0);
    rotateZ(jaw);
    bottomjaw();
  popMatrix();
  
  pushMatrix();
    fill(0, 0, 0);
    shininess(1);
    
    translate(6*cos(PI/4), -6*sin(PI/4), 1.5);
    rotateZ(PI/4);
    cylinder(0.5, 3, 30);
    
  popMatrix();
  
  pushMatrix();
    fill(0, 0, 0);
    shininess(1);
    
    translate(6*cos(PI/4), -6*sin(PI/4), -1.5);
    rotateZ(PI/4);
    cylinder(0.5, 3, 30);
    
  popMatrix();
  
}

void bottomjaw() {
  pushMatrix();
  
  fill(220, 220, 180);
  shininess(10);
  
  translate(5.6, 0, 3);
  cylinder(1.5, 1.5, 10);
  
  popMatrix();
  
  pushMatrix();
  
  fill(220, 220, 180);
  shininess(10);
  
  translate(5.6, 0, -3);
  cylinder(1.5, 1.5, 10);
  
  popMatrix();
  
  pushMatrix();
  
  fill(220, 220, 180);
  shininess(10);
  
  translate(2.5, 0.7, 0);
  box(5, 1.5, 9);
  
  popMatrix();
  
  pushMatrix();
  
  fill(220, 220, 180);
  shininess(10);
  
  translate(3.5, 0.7, 0);
  box(7, 1.5, 5);
  
  popMatrix();
  
  pushMatrix();
  
  fill(220, 220, 180);
  shininess(10);
  
  rotate(PI/9);
  box(5, 1.5, 9);
  
  popMatrix();
  
}

void eye() {
  pushMatrix();
  fill(255, 255, 255);
  shininess(30);
  
  sphere(3.3);
  popMatrix();
  
  pushMatrix();
  fill(100, 50, 50);
  shininess(30);
  
  translate(0, 0, -3.3);
  rotateX(PI/2);
  cylinder(1, 0.4, 30);
  popMatrix();
  
  pushMatrix();
  fill(0, 0, 0);
  shininess(30);
  
  translate(0, 0, -3.3);
  rotateX(PI/2);
  cylinder(0.5, 0.4, 30);
  popMatrix();
}

void frontRight() {
  pushMatrix();
    fill(220, 190, 220);
    shininess(10);
   
    sphere(10);
  popMatrix();
  
  pushMatrix();
    rotateZ(-PI/10);
    rotateX(PI/15);
    cylinder(5.5, 25, 30);
  popMatrix();
  
  pushMatrix();
    fill(220, 220, 180);
    translate(12, 22, -5*cos(80) + 1);
    sphereDetail(15);
    sphere(2);
  popMatrix();
  
  pushMatrix();
    fill(220, 220, 180);
    translate(11.5, 20.5, -5*cos(80) + 7);
    sphereDetail(15);
    sphere(2);
  popMatrix();
  
  pushMatrix();
    fill(220, 220, 180);
    translate(13, 21, -5*cos(80) + 4);
    sphereDetail(15);
    sphere(2);
  popMatrix();
  
  /*pushMatrix();
    translate(-8 + 15*cos(PI/8), 15*cos(PI/8), -2 - 15*cos(PI/8));
    sphere(6);
  popMatrix();
  
  pushMatrix();
    translate(-8 + 15*cos(PI/8), 15*cos(PI/8), -2 - 15*cos(PI/8));
    rotateZ(-PI/8);
    cylinder(5.5, 10, 30);
  popMatrix();*/
}

void frontLeft() {
  pushMatrix();
    fill(220, 190, 220);
    shininess(10);
   
    sphere(10);
  popMatrix();
  
  pushMatrix();
    rotateZ(-PI/10);
    rotateX(-PI/15);
    cylinder(5.5, 25, 30);
  popMatrix();
  
  pushMatrix();
    fill(220, 220, 180);
    translate(12, 22, 5*cos(80) - 1);
    sphereDetail(15);
    sphere(2);
  popMatrix();
  
  pushMatrix();
    fill(220, 220, 180);
    translate(11.5, 20.5, 5*cos(80) - 7);
    sphereDetail(15);
    sphere(2);
  popMatrix();
  
  pushMatrix();
    fill(220, 220, 180);
    translate(13, 21, 5*cos(80) - 4);
    sphereDetail(15);
    sphere(2);
  popMatrix();
  
  /*pushMatrix();
    translate(-8 + 15*cos(PI/8), 15*cos(PI/8), 2 + 15*cos(PI/8));
    sphere(6);
  popMatrix();
  
  pushMatrix();
    translate(-8 + 15*cos(PI/8), 15*cos(PI/8), 2 + 15*cos(PI/8));
    rotateZ(-PI/8);
    cylinder(5.5, 10, 30);
  popMatrix();*/
}

void backLeft() {
  
  //translate(-5*cos(60), +5*cos(65), -5*cos(60));
  
  pushMatrix();
    fill(220, 190, 220);
    shininess(10);
   
    translate(0, -3, -3);
    rotateY(PI/6);
    scale(1, 1.1, 0.7);
    sphere(10);
  popMatrix();
  
  /*pushMatrix();
    fill(220, 190, 220);
    shininess(10);
   
    sphere(10);
  popMatrix();*/
  
  pushMatrix();
    rotateZ(PI/10);
    rotateX(-PI/15);
    cylinder(5.5, 25, 30);
  popMatrix();
  
  pushMatrix();
    fill(220, 220, 180);
    translate(-3, 24, 5*cos(80) - 1);
    sphereDetail(15);
    sphere(2);
  popMatrix();
  
  pushMatrix();
    fill(220, 220, 180);
    translate(-3, 23, 5*cos(80) - 7);
    sphereDetail(15);
    sphere(2);
  popMatrix();
  
  pushMatrix();
    fill(220, 220, 180);
    translate(-1.5, 23.5, 5*cos(80) - 4);
    sphereDetail(15);
    sphere(2);
  popMatrix();
  
}

void backRight() {
  pushMatrix();
    fill(220, 190, 220);
    shininess(10);
    
    translate(0, -3, 3);
    rotateY(-PI/6);
    scale(1, 1.1, 0.7);
    
    sphere(10);
  popMatrix();
  
  /*pushMatrix();
    fill(220, 190, 220);
    shininess(10);
   
    sphere(10);
  popMatrix();*/
  
  pushMatrix();
    rotateZ(PI/10);
    rotateX(PI/15);
    cylinder(5.5, 25, 30);
  popMatrix();
  
  pushMatrix();
    fill(220, 220, 180);
    translate(-3, 24, -5*cos(80) + 1);
    sphereDetail(15);
    sphere(2);
  popMatrix();
  
  pushMatrix();
    fill(220, 220, 180);
    translate(-3, 23, -5*cos(80) + 7);
    sphereDetail(15);
    sphere(2);
  popMatrix();
  
  pushMatrix();
    fill(220, 220, 180);
    translate(-1.5, 23.5, -5*cos(80) + 4);
    sphere(2);
  popMatrix();
}

// Draw a cylinder of a given radius, height and number of sides.
// The base is on the y=0 plane, and it extends vertically in the y direction.
void cylinder (float radius, float height, int sides) {
  int i,ii;
  float []c = new float[sides];
  float []s = new float[sides];

  for (i = 0; i < sides; i++) {
    float theta = TWO_PI * i / (float) sides;
    c[i] = cos(theta);
    s[i] = sin(theta);
  }
  
  // bottom end cap
  
  normal (0.0, -1.0, 0.0);
  for (i = 0; i < sides; i++) {
    ii = (i+1) % sides;
    beginShape(TRIANGLES);
    vertex (c[ii] * radius, 0.0, s[ii] * radius);
    vertex (c[i] * radius, 0.0, s[i] * radius);
    vertex (0.0, 0.0, 0.0);
    endShape();
  }
  
  // top end cap

  normal (0.0, 1.0, 0.0);
  for (i = 0; i < sides; i++) {
    ii = (i+1) % sides;
    beginShape(TRIANGLES);
    vertex (c[ii] * radius, height, s[ii] * radius);
    vertex (c[i] * radius, height, s[i] * radius);
    vertex (0.0, height, 0.0);
    endShape();
  }
  
  // main body of cylinder
  for (i = 0; i < sides; i++) {
    ii = (i+1) % sides;
    beginShape();
    normal (c[i], 0.0, s[i]);
    vertex (c[i] * radius, 0.0, s[i] * radius);
    vertex (c[i] * radius, height, s[i] * radius);
    normal (c[ii], 0.0, s[ii]);
    vertex (c[ii] * radius, height, s[ii] * radius);
    vertex (c[ii] * radius, 0.0, s[ii] * radius);
    endShape(CLOSE);
  }
}
  
  void truncatedCone (float radius1, float radius2, float height, int sides) {
  int i,ii;
  float []c = new float[sides];
  float []s = new float[sides];

  for (i = 0; i < sides; i++) {
    float theta = TWO_PI * i / (float) sides;
    c[i] = cos(theta);
    s[i] = sin(theta);
  }
  
  // bottom end cap
  
  normal (0.0, -1.0, 0.0);
  for (i = 0; i < sides; i++) {
    ii = (i+1) % sides;
    beginShape(TRIANGLES);
    vertex (c[ii] * radius1, 0.0, s[ii] * radius1);
    vertex (c[i] * radius1, 0.0, s[i] * radius1);
    vertex (0.0, 0.0, 0.0);
    endShape();
  }
  
  // top end cap

  normal (0.0, 1.0, 0.0);
  for (i = 0; i < sides; i++) {
    ii = (i+1) % sides;
    beginShape(TRIANGLES);
    vertex (c[ii] * radius2, height, s[ii] * radius2);
    vertex (c[i] * radius2, height, s[i] * radius2);
    vertex (0.0, height, 0.0);
    endShape();
  }
  
  // main body of truncated cone
  for (i = 0; i < sides; i++) {
    ii = (i+1) % sides;
    beginShape();
    normal (c[i], 0.0, s[i]);
    vertex (c[i] * radius1, 0.0, s[i] * radius1);
    vertex (c[i] * radius2, height, s[i] * radius2);
    normal (c[ii], 0.0, s[ii]);
    vertex (c[ii] * radius2, height, s[ii] * radius2);
    vertex (c[ii] * radius1, 0.0, s[ii] * radius1);
    endShape(CLOSE);
  }
}
