// global variables
boolean close = false;
// methods
int fibonacci(int f) {
  // initliasing first 3 fibonacci numbers
  int n = 0; // f0
  int n1 = 1; // f1
  int n2 = 1; // f2
  // checking first n, n1 and n2
  if (f == 0) {
    return n;
  } else if (f == 1) {
    return n1;
  } else if (f == 2) {
    return n2;
  }
  for (int i = 0; i < f-2; i++) { // calculating finbancci numbers
    n = n1 + n2;
    n2 = n1;
    n1 = n;
  }
  return n;
}

void notice(String text) {
  textSize(20);
  textAlign(CENTER);
  fill(250);
  rect((width/2)-200, (height/2)-100, 400, 200);
  fill(50);
  text(text, width/2, height/2);
  noFill();
}

void keyPressed() {
  if (keyCode == java.awt.event.KeyEvent.VK_TAB) {
    if (!close) {
      close = true;
      notice("If you wan't to exit the programme:\nPress TAB again");
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
    //println("Refresh skipped");
  } else {
    background(150);
  }
}
// Method that properly closes the programme by closing the scanner.
// edit: scanner was removed, kept like this incase new things are implemented.
void exit() {
  sc.close();
  super.exit();
}
