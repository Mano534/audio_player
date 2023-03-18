import 'package:audio_player/app_theme/theme.dart';
import 'package:audio_player/modules/playlist_screen/playlist_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class PlayListCard extends StatelessWidget {
  final PlayList playlist;
   const PlayListCard({super.key,required this.playlist});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed('/playlist',arguments: playlist);
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 75,
        margin: const EdgeInsets.symmetric(vertical: 7.0),
        decoration: BoxDecoration(
          color: AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(15.0)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child:Image.asset(playlist.imageUrl,width: 50,height: 50,fit: BoxFit.cover,) 
            ),
            Expanded(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                        Text(playlist.title, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),),
                        Text('${playlist.songs.length} songs', style: Theme.of(context).textTheme.bodySmall,maxLines: 2,),
              ],),
            )),
            const Icon(Icons.play_circle,color: Colors.white,)
          ],
        ),
      ),
    );
  }
}