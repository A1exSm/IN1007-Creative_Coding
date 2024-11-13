Ball[] balls;
Ball specialBall;
color infectedColour;

void setup() {
  size(400, 300);
  infectedColour = color(40, 200, 200);
  balls = new Ball[40];
  // initialsing balls in range of balls.length
  for (int i=0; i<balls.length; i++) {
    balls[i] = new Ball();
    for (int j = 0; j < i; j++) { // for each new ball
      balls[j].position.x++; // increase xpos
      balls[j].radius ++; // increase radius
    }
  }
  specialBall = new Ball();
  specialBall.radius = 30;
  specialBall.colour = infectedColour;
  specialBall.position = new PVector(random(0, width-1), random(0, height-1));
  specialBall.velocity = new PVector(random(-3, 3), random(-3, 3));
}

void draw() {
  background(254, 244, 232);
  for (Ball ball : balls) {
    ball.draw();
    ball.move();
    if (dist(specialBall.position.x, specialBall.position.y,
      ball.position.x, ball.position.y) < specialBall.radius+ball.radius) {
      ball.colour = infectedColour;
    }
  }
  specialBall.draw();
  specialBall.move();
}

void mouseClicked() {
  specialBall.position = new PVector(mouseX, mouseY);
}
