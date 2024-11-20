class Wave {
  float amplitude;
  float waveLength;
  float cycles = 2;
  float phase = 0;
  float phaseSpeed = 0.09;
  color colour;
  SongData song;

  Wave(SongData song) {
    updateWave(song);
  }

  void updateWave(SongData data) {
    this.song = data;
    this.amplitude = data.rank * 10;
    this.waveLength = width / (cycles * 2);
    this.colour = color(random(0, 256), random(0, 256), random(0, 256), 100);
  }

  void draw() {
    beginShape();
    stroke(this.colour);
    for (float x = 0; x < width; x++) {
      float y = height/2 + this.amplitude * sin((x / this.waveLength) * 2 * PI * 1 + phase);
      vertex(x, y);
    }
    endShape();
    this.phase+=this.phaseSpeed;

    fill(255);
    textAlign(LEFT);
    textSize(16);
    text(this.song.song + " - " + song.artist, 10, height - 40);
    textSize(12);
    text(
      "Year: " + song.year +
      " | Month: " + monthArray[position[1]] +
      " | Rank: " + song.rank, 10, height - 20
      );

    textAlign(RIGHT);
    text("SPACE: Change rank | ↑↓: Change year | ←→: Change m", width - 10, height - 20);
    noFill();
  }
}
