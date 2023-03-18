// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayerButton extends StatelessWidget {
  const PlayerButton({super.key, required this.player});
  final AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
        stream: player.playerStateStream,
        builder: (context, snapshot) {
          final PlayerState? playerState = snapshot.data;
          final processingState = playerState!.processingState;
            if (processingState == ProcessingState.loading ||
                processingState == ProcessingState.buffering) {
              return  Container(
                width: 64.0,
                height: 64.0,
                margin: const EdgeInsets.all(10.0),
                child: const CircularProgressIndicator(color: Colors.white),
              );
            } else if (player.playing != true) {
              return IconButton(
                iconSize: 75,
                icon: const Icon(Icons.play_circle),
                color: Colors.white,
                onPressed: () async =>
                    await player.play(),
              );
            } else if (processingState != ProcessingState.completed) {
              return IconButton(
                  iconSize: 75,
                  icon: const Icon(Icons.pause_circle),
                  color: Colors.white,
                  onPressed: () async {
                    await player.pause();
                  });
            } else {
              return IconButton(
                icon: const Icon(Icons.replay_circle_filled, color: Colors.white,),
                iconSize: 75,
                onPressed: () async => await player
                    .seek(Duration.zero, index: player.effectiveIndices!.first)
              );
            }
        });
  }
}