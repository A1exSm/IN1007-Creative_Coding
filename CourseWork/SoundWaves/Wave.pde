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
      float y = height/2 + this.amp * sin((x / this.wlength) * 2 * PI * cycles + phase);
      vertex(x, y);
      /*
      explanation for sine wave equation:
      Standard y sine wave eq -> y = A*sin(2*pi*f*t + phase), A = amplitude, f = frequency, t = time
        firstly, since there is no concept of time t is static thus equal to x
        Why x? because x = the location along screen, position moves represents "time" in the programme
        f (frequency) = is the inverse of wave length apparently so 1/wavelength, x/wavelength in this case
        While writing this i realised my adapted eq was missing 2*pi, glad i spotted this
      My y sine eq -> y = h/2 + A * sin((x / WL) * 2 * PI * C * P),
        Where h = Height, A = amplitude, WL = wavelength, C = cycles, P = phase        
      */
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
