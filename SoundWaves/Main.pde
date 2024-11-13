float[] amplitude = {100, 50, 20};
float[] wavelength = {200, 100, 40};
float[] phase = {0,0,0};
color[] waveColour = {color(255, 0, 0, 100), color(0, 255, 0, 100), color(0, 0, 255, 100)};
float[] phaseSpeed = {0.01, 0.05, 0.1};
boolean[] small = {true, true, false,};
boolean[] large = {false, false, true};

void setup() {
  size (800, 400);
}

void draw() {
  background(20);
  stroke(255, 50);
  line(0, height/2, width, height/2);
  noFill();
  for (int i = 0; i < 3; i++) {
    beginShape();
    stroke(waveColour[i]);
    for (float x = 0; x < width; x++) {
      float y = height/2 + amplitude[i] * sin(x / wavelength[i] + phase[i]);
      vertex(x, y);
    }
    endShape();
    phase[i] += phaseSpeed[i];
    //checkBool(i);
    //incrementAmp(i);
    noFill();
  }
}
