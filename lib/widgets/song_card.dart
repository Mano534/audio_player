import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_theme/theme.dart';
import '../modules/song_screen/song_module.dart';

class SongCard extends StatelessWidget {
  final Song song;
  const SongCard({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/song',arguments: song);
      },
      child: Container(
        padding: const EdgeInsets.only(right: 10.0),
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                    image: AssetImage(song.coverURL), fit: BoxFit.cover)),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.37,
            height: 50,
            margin: const EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white.withOpacity(0.8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      song.title,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppTheme.primaryColor, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      song.discription,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppTheme.secondaryColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                 Icon(Icons.play_circle_fill, color: AppTheme.primaryColor)
              ],
            ),
          )
        ]),
      ),
    );
  }
}
