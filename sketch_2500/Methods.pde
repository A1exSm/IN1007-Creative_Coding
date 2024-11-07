// global variables
boolean close = false;
int position;
int cols, rows;
int[][] screen;
// methods
// creates screen
void initScreen() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      screen[i][j] = 100;
    }
  }
}
// draws screen
void drawScreen() {
  loadPixels();
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int index = i + j * cols;
      pixels[index] = color(screen[i][j]);
    }
  }
  updatePixels();
}
// Method to draw a notice message to the screen.
void notice(String text) {
  textSize(20);
  textAlign(CENTER);
  fill(250);
  rect((width/2)-200, (height/2)-100, 400, 200);
  fill(50);
  text(text, width/2, height/2);
  noFill();
}
// method to check for key shortcuts being pressed
void keyPressed() {
  if (keyCode == java.awt.event.KeyEvent.VK_F1) { // if F1 key is pressed
    if (!close) {
      close = true;
      notice("If you wan't to exit the programme:\nPress F1 again");
    } else {
      exit();
    }
  } else {
    close = false;
  }
}
// this function ensures what is drawn on the screen stays when it needs to
void refresh() {
  if (close) { // if close is true, then we are currently asking whether the programming should be exited.
    println("Refresh skipped");
  } else {
    background(150);
    drawScreen();
  }
}
// Method that properly closes the programme by closing the scanner.
// edit: scanner was removed, kept like this incase new things are implemented.
void exit() {
  super.exit();
}
// drawing stuff
void initDrawing(int pos) {}
