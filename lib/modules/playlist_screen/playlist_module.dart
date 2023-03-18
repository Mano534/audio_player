import '../song_screen/song_module.dart';

class PlayList {
  String title;
  String imageUrl;
  List<Song> songs;
  PlayList({required this.title, required this.imageUrl, required this.songs});
  static List<PlayList> playlists = [
    PlayList(title: 'Hip Hop R&B mix', imageUrl: 'assets/images/heartPage.jpg', songs: Song.songs),
    PlayList(title: 'Rock & Roll', imageUrl: 'assets/images/carMiddleRoad.jpg', songs: Song.songs),
    PlayList(title: 'Techno', imageUrl: 'assets/images/boatFastInWater.jpg', songs: Song.songs)

  ];
}
