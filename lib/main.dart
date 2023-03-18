import 'package:audio_player/app_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'modules/home_screen/home_screen_page.dart';
import 'modules/playlist_screen/playlist_screen.dart';
import 'modules/song_screen/song_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      title: 'Audio player',
      theme: AppTheme.createTheme(context),
      initialRoute: '/song',
      getPages: [
        GetPage(name: '/', page: () =>  HomeScreen(title :'Enjoy your favourite music')),
        GetPage(name: '/playlist', page: () => const PlaylistScreen()),
        GetPage(name: '/song', page: () => const SongScreen()),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
