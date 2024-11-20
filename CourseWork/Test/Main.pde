String[] monthArray = {
  "January", "February", "March", "April", "May", "June",
  "July", "August", "September", "October", "November", "December"
};
int[] position = {1, 0, 0}; // {year, month, rank}
Wave currentWave;
ArrayList<SongData> songs;
ArrayList<ArrayList<ArrayList<SongData>>> sortedSongs; // year, month, rank

void setup() {
  size(800, 400);
  loadData();
  sortData();
}

void draw() {
  currentWave = new Wave(sortedSongs.get(position[0]).get(position[1]).get(position[2]));
  background(20);
  stroke(255, 50);
  line(0, height/2, width, height/2);
  noFill();
  currentWave.draw();
}

void keyPressed() {
  if (position[0] == 63 || position[1] == 10 || position[2] == 14) {
    if (keyCode == RIGHT) {
      if (position[0] == 0) {
        position[1] = 7;
      }
      position[1] = 0;
    } else if (keyCode == UP) {
      position[0] = 0;
    } else if (key == ' ') {
      position[2] = 0;
    }
  } else if (position[0] == 1 || position[1] == 1) {
    if (keyCode == LEFT || keyCode == DOWN) {
    } else {
      if (keyCode == RIGHT) {
        position[1]++;
      } else if (keyCode == LEFT) {
        position[1]--;
      } else if (keyCode == UP) {
        position[0]++;
      } else if (keyCode == DOWN) {
        position[0]--;
      } else if (key == ' ') {
        position[2]++;
      }
    }
  }
}
