// global variables
boolean close = false;
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
    drawTrain();
  }
}
// Method that properly closes the programme by closing the scanner.
// edit: scanner was removed, kept like this incase new things are implemented.
void exit() {
  super.exit();
}

// GPT Train
// Function to initialize the train with a 3D appearance and chains within the 2D array
void initTrain() {
  int trainStartX = 300; // Starting X for train drawing
  int trainStartY = 450; // Starting Y for train drawing

  // Draw engine body with shading
  for (int x = trainStartX; x < trainStartX + 100; x++) {
    for (int y = trainStartY; y < trainStartY + 50; y++) {
      if (x < trainStartX + 20) {
        screen[x][y] = color(80, 80, 180); // Darker shading on left side
      } else if (x > trainStartX + 80) {
        screen[x][y] = color(120, 120, 220); // Lighter shading on right side
      } else {
        screen[x][y] = color(100, 100, 200); // Middle color
      }
    }
  }

  // Draw top highlight on the engine
  for (int x = trainStartX + 10; x < trainStartX + 90; x++) {
    for (int y = trainStartY - 5; y < trainStartY; y++) {
      screen[x][y] = color(180, 180, 255); // Light highlight on top
    }
  }

  // Draw engine cab with a perspective effect
  for (int x = trainStartX + 25; x < trainStartX + 75; x++) {
    for (int y = trainStartY - 40 + (x - trainStartX - 25) / 2; y < trainStartY; y++) {
      screen[x][y] = color(60, 60, 140); // Cab with angled shading for 3D look
    }
  }

  // Draw wheels with shadow under the engine
  for (int x = trainStartX + 10; x < trainStartX + 30; x++) {
    for (int y = trainStartY + 50; y < trainStartY + 70; y++) {
      screen[x][y] = color(30); // Left wheel shadow
    }
  }
  for (int x = trainStartX + 70; x < trainStartX + 90; x++) {
    for (int y = trainStartY + 50; y < trainStartY + 70; y++) {
      screen[x][y] = color(30); // Right wheel shadow
    }
  }

  // Draw train cars with a 3D effect and shading
  int carStartX = trainStartX + 120;
  for (int car = 0; car < 3; car++) {
    for (int x = carStartX; x < carStartX + 80; x++) {
      for (int y = trainStartY; y < trainStartY + 50; y++) {
        if (x < carStartX + 20) {
          screen[x][y] = color(130, 70, 70); // Darker shading on left side
        } else if (x > carStartX + 60) {
          screen[x][y] = color(170, 90, 90); // Lighter shading on right side
        } else {
          screen[x][y] = color(150, 80, 80); // Middle color
        }
      }
    }

    // Draw wheels for each car with shadow
    for (int x = carStartX + 10; x < carStartX + 30; x++) {
      for (int y = trainStartY + 50; y < trainStartY + 70; y++) {
        screen[x][y] = color(30); // Left wheel shadow
      }
    }
    for (int x = carStartX + 50; x < carStartX + 70; x++) {
      for (int y = trainStartY + 50; y < trainStartY + 70; y++) {
        screen[x][y] = color(30); // Right wheel shadow
      }
    }

    // Draw chains between cars
    int chainY = trainStartY + 25; // Center of train height for chains
    for (int chainX = carStartX - 20; chainX < carStartX; chainX += 10) {
      for (int i = -2; i <= 2; i++) {
        screen[chainX][chainY + i] = color(50, 50, 50); // Chain link color
      }
    }

    carStartX += 100; // Move to the next car position
  }
}

// Function to render the train based on screen array values
void drawTrain() {
  loadPixels(); // Access pixel array for direct drawing
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int loc = x + y * width;
      pixels[loc] = screen[x][y];
    }
  }
  updatePixels(); // Update display with new pixel values
}
