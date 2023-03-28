class Song {
  final String title;
  final String discription;
  final String musicURL;
  final String coverURL;
  Song({
    required this.title,
    required this.discription,
    required this.musicURL,
    required this.coverURL
  });
  static List<Song> songs = [
    Song(title: 'The Greatest Deception', discription: "Deception", musicURL: 'assets/musics/TheGreatDeception.mp3', coverURL: 'assets/images/deception.jpg'),
    Song(title: 'QueenOfNight', discription: "QueenOfNight", musicURL: 'assets/musics/queenOfNight.mp3', coverURL: 'assets/images/boatFastInWater.jpg'),
    Song(title: 'RiseInVein', discription: "RiseInVein", musicURL: 'assets/musics/RiseInVein.mp3', coverURL: 'assets/images/breathWater.jpg'),
    Song(title: 'Fight till the end', discription: "Fight till the end", musicURL: 'assets/musics/i will fight till end.mp3', coverURL: 'assets/images/lightSpeedTraffic.jpg'),
  ];
}