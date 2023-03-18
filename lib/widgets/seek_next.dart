import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SeekNext extends StatelessWidget {
final AudioPlayer player;
  const SeekNext({super.key, required this.player});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SequenceState?>(stream: player.sequenceStateStream,builder: (context, snapshot) {
      return IconButton(onPressed: () {
         player.hasNext? player.seekToNext() : null;
      }, icon: const Icon(Icons.skip_next_sharp, color: Colors.white,),iconSize:45 ,);
    },);
  }
}