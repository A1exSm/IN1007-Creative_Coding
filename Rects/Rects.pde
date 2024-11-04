//import processing.javafx.*; if running on windows
float x_pos, y_pos;
boolean pressed;
void setup() {
  size(550, 550);
  //size(550, 550, FX2D) if using windows
  windowResizable(true); // Allows window to be resized
}
void draw() {
  background(240);
  draw_rect();
  resize_window();
}

void draw_rect() {
  boolean max_rects = false; // variable controls whether rects are outside of the windows view
  for (int row=0; row<100; row++) {
    if (max_rects == true) break;
    for (int i=0; i<100; i++) {
      int x = int(random(5, 20)+i*82);
      int y =int(random(5, 20)+row*82);
      //int y = 50+row*100;
      if (x > width) break; // checks whether the column is outside of the window view
      else if (y > height) { // checks whether the row is outside of the window view
        max_rects = true;
        break;
      }
      fill_function(i, row, x, y);
      rect(x, y, 80, 80);
    }
  }
}

void fill_function(int i, int row, int x, int y) {
  if (mouseX > x && mouseX < x+80 && mouseY > y && mouseY < y+80) fill (255, 128, 32);
  else if (i%2 == row%2)fill(0);
  else fill(255);
}

void mousePressed() {
  x_pos = mouseX; //stores position of mouse when pressed
  y_pos = mouseY;
}

void resize_window() {
  if (mousePressed) {
    float new_x = width;
    float new_y = height;
    if (mouseX > x_pos) new_x+= (mouseX-x_pos); // increase means to the right
    else if (mouseX < x_pos) new_x-= (x_pos-mouseX); // decrease means to the left
    if (mouseY > y_pos) new_y+= (mouseY-y_pos); // increase means down
    else if (mouseY < y_pos) new_y-= (y_pos-mouseY); // decrease means up
    windowResize(int(new_x), int(new_y));
    x_pos = mouseX; // saves mouse position again so we can continuosly resize the window
    y_pos = mouseY;
  }
}
