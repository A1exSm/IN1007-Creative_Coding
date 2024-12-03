void setup()
{
  size(640, 480, P3D);
}

void draw()
{
  background(0);
  stroke(255, 255, 0);
  fill(200, 200, 0);
  lights();
 
  translate(width/2 - 100, height/2 - 100, 0);
  rotateX(radians(45));
  rotateZ(radians(-mouseX));
  translate(-200, -200, 0);
 
  float d = 100;
 
  for (int x=0; x<400; x+=20) {
    for (int y=0; y<400; y+=20) {
      pushMatrix();
      translate((width/2)-x, (height/2)-y, 0);
      d = 1000*pow(noise(0.01*x, 0.01*y),5);
      box(15, 15, d);
      popMatrix();
    }
  }
}
// each box represents a year, the data represents a song
// d can be allocated to a variable which can be cycled / changed
