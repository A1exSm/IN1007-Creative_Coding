// global variables
boolean close = false;
boolean wFive = false;
String[] wFiveE = {
  String.valueOf(weekFive.exerciseOne(5)),
  String.valueOf(weekFive.exerciseTwo(10, 5)),
  String.valueOf(weekFive.exerciseThree())
};
boolean[] five = new boolean[wFiveE.length];
// methods
//public int fibonacci(int f) {
//  // initliasing first 3 fibonacci numbers
//  int n = 0; // f0
//  int n1 = 1; // f1
//  int n2 = 1; // f2
//  // checking first n, n1 and n2
//  if (f == 0) {
//    return n;
//  } else if (f == 1) {
//    return n1;
//  } else if (f == 2) {
//    return n2;
//  }
//  for (int i = 0; i < f-2; i++) { // calculating finbancci numbers
//    n = n1 + n2;
//    n2 = n1;
//    n1 = n;
//  }
//  return n;
//}

void displayWeeks(String week) {
  if (week.equals("five")) {
    drawRect(10, 10, 100, 100, 200);
    displayText("Week Five", 60, 60, 255, 20);
  }
}

void displayExercises(String week) {
  if (week.equals("five")) {
    for (int i  = 1; i < five.length+1; i++) {
      drawRect(10, (i*100)+10, 100, 100, 200);
      displayText(("Exercise " + i), 60, (i*100)+60, 255, 15);
    }
  }
}

void weeksClickHandler() {
  // handles week five being clicked
  if (mouseX > 10 && mouseX < 111 && mouseY > 10 && mouseY < 111) {
    if (!wFive) {
      wFive = true;
    } else {
      wFive = false;
    }
  }
  // handles exercises of weekFive being clicked... wFive first so expression checked before all others
  if (wFive && mouseX > 10 && mouseX < 111 && mouseY > 110 && mouseY < 911) {
    int lowerB;
    int higherB;
    for (int i = 1; i < five.length+1; i++) {
      lowerB = (i*100) + 10;
      higherB = (i*100) + 111;
      if (mouseY > lowerB && mouseY < higherB) {
        if (five[i-1]) {
          five[i-1] = false;
        } else {
          five[i-1] = true;
        }
      }
    }
  }
}

void clickExercise(int num) {
  drawRect(10, (num*100)+10, 100, 100, 200);
  displayText(("Output: " + wFiveE[num-1]), 60, (num*100)+60, 255, 15);
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
  weeksClickHandler();
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
      for (int i = 0; i < five.length; i++) {
        if (five[i]) {
          clickExercise(i+1);
        }
      }
    }
  }
}
// Method that properly closes the programme by closing the scanner.
// edit: scanner was removed, kept like this incase new things are implemented.
void exit() {
  super.exit();
}
