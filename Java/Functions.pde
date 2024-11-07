// global variables
boolean close = false;
boolean wFive = false;
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

void displayWeeks(String week) {
  if (week.equals("five")) {
    drawRect(10, 10, 100, 100, 200);
    displayText("Week Five", 60, 60, 255, 20);
  }
}

void displayExercises(String week) {
  if (week.equals("five")) {
    drawRect(10, 110, 100, 100, 200);
    displayText("Exercise One", 60, 160, 255, 15);
    drawRect(10, 210, 100, 100, 200);
    displayText("Exercise Two", 60, 260, 255, 15);
    drawRect(10, 310, 100, 100, 200);
    displayText("Exercise Three", 60, 360, 255, 15);
    drawRect(10, 410, 100, 100, 200);
    displayText("Exercise Four", 60, 460, 255, 15);
    drawRect(10, 510, 100, 100, 200);
    displayText("Exercise Five", 60, 560, 255, 15);
    drawRect(10, 610, 100, 100, 200);
    displayText("Exercise Six", 60, 660, 255, 15);
    drawRect(10, 710, 100, 100, 200);
    displayText("Exercise Seven", 60, 760, 255, 15);
    drawRect(10, 810, 100, 100, 200);
    displayText("Exercise Eight", 60, 860, 255, 15);
  }
}

void drawRect(int x, int y, int w, int h, color c) {
  fill(c);
  rect(x, y, w, h);
  noFill();
}

void displayText(String text, int x, int y, color c, int size) {
  fill(c);
  textSize(size);
  textAlign(CENTER);
  text(text, x, y);
  noFill();
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

void mousePressed() {
  if (mouseX > 10 && mouseX < 111 && mouseY > 10 && mouseY < 111) {
    if (!wFive){
      wFive = true;
    } else {
      wFive = false;
    }
  }
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
    displayWeeks("five");
    if (wFive) {
      displayExercises("five");
    }
  }
}
// Method that properly closes the programme by closing the scanner.
// edit: scanner was removed, kept like this incase new things are implemented.
void exit() {
  sc.close();
  super.exit();
}
