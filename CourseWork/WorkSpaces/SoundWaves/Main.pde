Wave[] waves;

void setup() {
  size (800, 400);
  frameRate(100);
  createWaves(2);
}

void draw() {
  background(20);
  stroke(255, 50);
  line(0, height/2, width, height/2);
  noFill();
  for (int i = 0; i < waves.length; i++) {
    waves[i].draw();
  }
}

void createWaves(int numberOfWaves) {
  waves = new Wave[numberOfWaves];
  for (int i = 0; i < numberOfWaves; i++) {
    float amplitude = random(0,height/2); // origin is height/2 so origin + height/2 = height
    float waveCycles = random(0, 20);
    float waveLength = random(0, width/waveCycles); // maxWaveLength on screen = screen width / waveCycles
    float phaseSpeed = random(0.001, 0.15); // 0.1+ is very fast, 0.05 is normal
    color colour = color(random(0,256),random(0,256),random(0,256), 100);
    waves[i] = new Wave(amplitude, waveLength, waveCycles, phaseSpeed, colour);
  }
}
