float sphere = 10;
float angle = 0;
boolean direction = true;
void setup() {
  size(640, 480, P3D);
  frameRate(50);
}


void draw() {
  directionalLight(255,100,20,height/2,width/2,0);
  specular(0,100,100);
  //shininess(150);
  //lights();
  checkPos(-300, 300, sphere);
  checkPos(-360, 360, angle);
  background(0);
  pushMatrix();
  fill(255,0,0);
  translate(width/2, height/2, sphere);
  rotateY(angle+20);
  sphere(300);
  noFill();
  popMatrix();
  pushMatrix();
  fill(0,255,0);
  translate(width/2, height/2, 0);
  rotateY(radians(angle));
  rotateX(radians(angle));
  box(200);
  noFill();
  popMatrix();
  //noLoop();  // As sketch doesn't change, no need to repeat drawing loop.
}

void checkPos(float min, float max, float variable) {
  if (variable < min) {
    direction = true;
  } else if (variable > max) {
    direction = false;
  }
  if (variable == sphere) {
    if (direction) {
      sphere++;
    } else {
      sphere--;
    }
  } else {
    if (direction) {
      angle++;
    } else {
      angle--;
    }
  }
}
