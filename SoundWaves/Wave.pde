class Wave {
  float amp; // Amplitude of wave
  float wlength; // waveLength
  // phase is the position the wave is at
  float phase = 0;
  // to move this wave position (phase) += speed, and it moves the wave at the increment of speed
  float speed;
  color colour;
  
  Wave(float amplitude, float waveLength, float speed, color colour) {
    this.amp = amplitude;
    this.wlength = waveLength;
    this.speed = speed;
    this.colour = colour;
  }
}
