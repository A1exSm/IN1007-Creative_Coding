class SongData {
  String date;
  String song;
  String artist;
  int year;
  int day;
  int rank;
  int month;
  SongData(String date, String song, String artist, int rank) {
    this.date = date;
    this.song = song;
    this.artist = artist;
    this.rank = rank;
    this.year = Integer.parseInt(date.substring(6, 10)); // dd-mm-yyyy
    this.month = Integer.parseInt(date.substring(3, 5));
    this.day = Integer.parseInt(date.substring(0, 2));
    //println(this.month + ", " + this.day + ", " + year + ", " + date);
  }
  SongData() {
    this.date=null;
  }
}

void loadData() {
  Table data = loadTable("charts.csv", "header"); // saving table data to data
  songs = new ArrayList<SongData>(); // creating an array list of type SongData to store songs
  for (TableRow row : data.rows()) {
    //println(row.getString("date"));
    SongData song = new SongData( // creating a new itteration of SongData
      row.getString("dates"),
      row.getString("song"),
      row.getString("artist"),
      row.getInt("rank")
      );
    songs.add(song);
  }
}

// Array { Years { Months { Week { Ranks } } } }
void setArrayLists() {
  // intialising ArrayLists
  sortedSongs = new ArrayList<>();

  for (int numYears = 0; numYears < 64; numYears++) {
    ArrayList<ArrayList<SongData>> yearList = new ArrayList<>();

    for (int numMonths = 0; numMonths < 12; numMonths++) {
      ArrayList<SongData> monthList = new ArrayList<>();

      for (int numRanks = 0; numRanks < 15; numRanks++) {
        SongData emptySong = new SongData();
        monthList.add(emptySong);// added empty song object to month list
      }

      yearList.add(monthList);
    }

    sortedSongs.add(yearList);
  }
}

void sortData() {
  setArrayLists();
  boolean firstValue = true;
  for (SongData song : songs) {
    if (firstValue) {
      sortedSongs.get((-1958+song.year)).get(song.month-1).add(song.rank-1, song);
      firstValue = false;
    } else {
      sortedSongs.get((-1958+song.year)).get(song.month-1).add(song.rank-1, song);
    }
  }
}
