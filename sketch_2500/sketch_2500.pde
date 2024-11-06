void setup() {
  cols = width;
  rows = height;
  screen = new int[cols][rows];
  size(1000,1000);
  initScreen();
  initTrain();
}
void draw() {
  screen[50][50] = 200;
  refresh();
}
