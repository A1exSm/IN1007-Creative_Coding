class SongData {
  String date;
  int rank;
  String song;
  String artist;
  int lastWeek;
  int peakRank;
  int weeksOnBoard;
  int year;
  
  SongData(String date, int rank, String song, String artist, 
           int lastWeek, int peakRank, int weeksOnBoard) {
    this.date = date;
    this.rank = rank;
    this.song = song;
    this.artist = artist;
    this.lastWeek = lastWeek;
    this.peakRank = peakRank;
    this.weeksOnBoard = weeksOnBoard;
    this.year = Integer.parseInt(date.substring(0, 4));
  }
}

class Wave {
  float amp;
  float wlength;
  float cycles;
  float phase = 0;
  float speed;
  color colour;
  SongData songData;
  
  Wave(SongData data) {
    updateWaveProperties(data);
  }
  
  void updateWaveProperties(SongData data) {
    this.songData = data;
    this.amp = map(data.peakRank, 100, 1, 20, height/3);
    this.cycles = map(data.weeksOnBoard, 1, 52, 1, 10);
    this.wlength = width / (this.cycles * 2);
    float rankChange = data.lastWeek != 0 ? data.lastWeek - data.rank : 0;
    this.speed = map(abs(rankChange), 0, 10, 0.01, 0.1);
    float hue = map(data.weeksOnBoard, 1, 52, 0, 255);
    this.colour = color(hue, 200, 200, 100);
  }
  
  void draw() {
    beginShape();
    stroke(this.colour);
    for (float x = 0; x < width; x++) {
      float y = height/2 + this.amp * sin((x / this.wlength) * 2 * PI * cycles + phase);
      vertex(x, y);
    }
    endShape();
    this.phase += this.speed;
    
    // Display song information
    fill(255);
    textAlign(LEFT);
    textSize(16);
    text(songData.song + " - " + songData.artist, 10, height - 40);
    textSize(12);
    text("Year: " + songData.year + " | Rank: " + songData.rank + 
         " | Peak: " + songData.peakRank + " | Weeks: " + songData.weeksOnBoard, 
         10, height - 20);
    
    // Display navigation instructions
    textAlign(RIGHT);
    text("SPACE: Next song | ←→: Change year", width - 10, height - 20);
  }
}

ArrayList<SongData> songDataList;
Wave wave;
int currentYear;
int currentSongIndex;
IntDict songsByYear;  // Using IntDict to store year references
int[] years;  // Array to store sorted years

void setup() {
  size(800, 400);
  frameRate(60);
  colorMode(HSB, 255);
  
  // Load and parse CSV data
  loadData();
  
  // Initialize with first available year and song
  currentYear = years[0];
  currentSongIndex = 0;
  
  // Create initial wave
  updateWaveWithCurrentSong();
}

void loadData() {
  Table chartData = loadTable("charts.csv", "header");
  songDataList = new ArrayList<SongData>();
  songsByYear = new IntDict();
  
  // First pass: Create all SongData objects and identify years
  for (TableRow row : chartData.rows()) {
    SongData data = new SongData(
      row.getString("date"),
      row.getInt("rank"),
      row.getString("song"),
      row.getString("artist"),
      row.getInt("last-week"),
      row.getInt("peak-rank"),
      row.getInt("weeks-on-board")
    );
    songDataList.add(data);
    
    // Keep track of years
    if (!songsByYear.hasKey(str(data.year))) {
      songsByYear.add(str(data.year), 1);
    }
  }
  
  // Get sorted years array
  years = int(songsByYear.keyArray());
  years = sort(years);
}

// Get songs for a specific year
ArrayList<SongData> getSongsForYear(int year) {
  ArrayList<SongData> yearSongs = new ArrayList<SongData>();
  for (SongData song : songDataList) {
    if (song.year == year) {
      yearSongs.add(song);
    }
  }
  
  // Sort songs by rank
  yearSongs.sort((a, b) -> a.rank - b.rank);
  return yearSongs;
}

void updateWaveWithCurrentSong() {
  ArrayList<SongData> currentYearSongs = getSongsForYear(currentYear);
  if (currentYearSongs.size() > 0) {
    if (wave == null) {
      wave = new Wave(currentYearSongs.get(currentSongIndex));
    } else {
      wave.updateWaveProperties(currentYearSongs.get(currentSongIndex));
    }
  }
}

void keyPressed() {
  ArrayList<SongData> currentYearSongs = getSongsForYear(currentYear);
  
  if (key == ' ') {
    // Next song in current year
    currentSongIndex = (currentSongIndex + 1) % currentYearSongs.size();
    updateWaveWithCurrentSong();
  }
  else if (keyCode == RIGHT) {
    // Next year
    int currentYearIndex = -1;
    for (int i = 0; i < years.length; i++) {
      if (years[i] == currentYear) {
        currentYearIndex = i;
        break;
      }
    }
    
    if (currentYearIndex < years.length - 1) {
      currentYear = years[currentYearIndex + 1];
      currentSongIndex = 0;
      updateWaveWithCurrentSong();
    }
  }
  else if (keyCode == LEFT) {
    // Previous year
    int currentYearIndex = -1;
    for (int i = 0; i < years.length; i++) {
      if (years[i] == currentYear) {
        currentYearIndex = i;
        break;
      }
    }
    
    if (currentYearIndex > 0) {
      currentYear = years[currentYearIndex - 1];
      currentSongIndex = 0;
      updateWaveWithCurrentSong();
    }
  }
}

void draw() {
  background(20);
  stroke(255, 50);
  line(0, height/2, width, height/2);
  noFill();
  
  wave.draw();
}
