Table table;
void setup() {
  int idpos = 0;
  table = loadTable("data-final.csv", "header");
   Song[] songs = new Song[table.getRowCount()];
  for(TableRow row : table.rows()) {
    String language = row.getString("Language");
    String feeling = row.getString("Feeling");
    String name = row.getString("Song");
    String duration = row.getString("duration");
    
    float[] temp = new float[5];
    for (int i = 0; i < temp.length; i++) {
      temp[i] = float(duration.charAt(i));
    }
    float durationSeconds = ((temp[0]*10 + temp[1])*60)+((temp[3]*10)+temp[4]);
    songs[idpos] = new Song(language, feeling, name, durationSeconds);
    idpos++;
  }
  
  for (Song song : songs) {
    song.printInfo();
  }
}
void draw() {
}

class Song {
  public String language;
  public String feeling;
  public String name;
  public float duration;
  
  Song(String lang, String feel, String name, float duration) {
    this.language = lang;
    this.feeling = feel;
    this.name = name;
    this.duration = duration;
  }
  
  public void printInfo() {
    print(this.name);
    print(this.language);
    print(this.feeling);
    print(this.duration);
    println();
  }
  
}
