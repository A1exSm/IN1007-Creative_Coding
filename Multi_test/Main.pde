void setup() {
  size(1100, 1000);
}
void draw() {
  refresh();
  point(width/2, height/2);
  // draws circles
  for (int i = 0; i <= 16; i++) {
    ellipse(i*60, fibonacci(i), 5+i, 5+i);
  }
}
