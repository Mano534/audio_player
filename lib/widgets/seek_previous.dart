import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SeekPrevious extends StatelessWidget {
final AudioPlayer player;
  const SeekPrevious({super.key, required this.player});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SequenceState?>(stream: player.sequenceStateStream,builder: (context, snapshot) {
      return IconButton(onPressed: () {
         player.hasPrevious? player.seekToPrevious() : null;
      }, icon: const Icon(Icons.skip_previous_sharp, color: Colors.white,),iconSize:45 ,);
    },);
  }
}