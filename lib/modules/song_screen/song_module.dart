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
    Song(title: 'JungleOfLove', discription: "jungleOfLove", musicURL: 'assets/musics/queenOfNight.mp3', coverURL: 'assets/images/lightSpeedTraffic.jpg'),
    Song(title: 'QueenOfNight', discription: "QueenOfNight", musicURL: 'assets/musics/i will fight till end.mp3', coverURL: 'assets/images/boatFastInWater.jpg'),
    Song(title: 'riseInVein', discription: "riseInVein", musicURL: 'assets/musics/RiseInVein.mp3', coverURL: 'assets/images/topHill.jpg'),
  ];
}