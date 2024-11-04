void setup() {
  size(500,400);
}
void draw() {
  background(128);
  //(r,g,b)
  fill(255,0,0);
  //(x,y,w,h)
  ellipse(250, 200, 300, 300);
  fill(0,255,0);
  ellipse(250, 200, 75.5, 75.5);
  rect(245, 40, 10, 240);
  
  if (mousePressed) {
    stroke(255,0,0);
    ellipse(mouseX, mouseY,70,70);
    rect(mouseX-25,mouseY-25,50,50);
    stroke(0,0,0);
  } else {
    ellipse(mouseX, mouseY,70,70);
    rect(mouseX-25,mouseY-25,50,50);
  }
}
