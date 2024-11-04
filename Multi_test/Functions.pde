boolean close = false;

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
  if (keyCode == java.awt.event.KeyEvent.VK_F1) {
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
    //println("Refresh skipped");
  } else {
    background(150);
  }
}

// Method that properly closes the programme by closing the scanner.
// edit: scanner was removed, kept like this incase new things are implemented.
void exit() {
  super.exit();
}
