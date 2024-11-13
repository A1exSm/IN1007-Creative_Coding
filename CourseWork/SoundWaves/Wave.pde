class Wave {
  float amp; // Amplitude of wave
  float wlength; // waveLength
  float cycles; // number of wave thingys per itteration
  // phase is the position the wave is at
  float phase = 0;
  // to move this wave position (phase) += speed, and it moves the wave at the increment of speed
  float speed;
  color colour;
  // variables that will be removed when i am done playing around
  public boolean smallA = true;
  public boolean largeA = false;
  public boolean smallW = true;
  public boolean largeW = false;

  Wave(float amplitude, float waveLength, float waveCycles, float speed, color colour) {
    this.amp = amplitude;
    this.wlength = waveLength;
    this.cycles = waveCycles;
    this.speed = speed;
    this.colour = colour;
  }

  void draw() {
    beginShape();
    stroke(this.colour);
    for (float x = 0; x < width; x++) {
      float y = height/2 + this.amp * sin((x / this.wlength) * cycles + phase);
      vertex(x, y);
    }
    endShape();
    this.phase += this.speed;
    noFill();
  }

  // this method is to entertain me while I work on the data set :)
  void draw(int check) {
    this.draw();
    checkBool(this);
    incrementAmp(this);
  }
}
