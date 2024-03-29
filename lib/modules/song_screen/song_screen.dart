// ignore_for_file: no_leading_underscores_for_local_identifiers, library_prefixes

import 'package:audio_player/modules/song_screen/song_module.dart';
import 'package:audio_player/widgets/seek_next.dart';
import 'package:audio_player/widgets/seek_previous.dart';
import 'package:audio_player/widgets/widget.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart' as Rx;
class SongScreen extends StatefulWidget {
  const SongScreen({super.key});
  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  late final AudioPlayer player;
  late final ConcatenatingAudioSource _playlist;
  Stream<DurationState> get _durationState =>  
  Rx.CombineLatestStream.combine3<Duration,Duration,Duration?, DurationState>(
    player.positionStream,
    player.bufferedPositionStream,
    player.durationStream,
    (position,bufferedPosition,duration)=> DurationState(position: position, buffered: bufferedPosition, duration: duration?? Duration.zero)
  );

  
  Song song = Get.arguments;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    _playlist = ConcatenatingAudioSource(
      useLazyPreparation: true,
      children: [
        AudioSource.uri(Uri.parse('asset:///${song.musicURL}')),
      ],
    );
    player.setAudioSource(_playlist,
        initialIndex: 0, initialPosition: Duration.zero);
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _buildBackgroundImage() {
      return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(song.coverURL), fit: BoxFit.cover)));
    }

    _buildBackgroundShader() {
      return const ShaderBackground();
    }

    _buildHeaderSong() {
      return Text(
        song.title,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      );
    }

    _buildDescriptionSong() {
      return Text(
        song.discription,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      );
    }

    _buildSetUp() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSong(),
            const SizedBox(
              height: 10,
            ),
            _buildDescriptionSong(),
            const SizedBox(
              height: 5,
            ),
            StreamBuilder<DurationState>(
              stream: _durationState,
              builder: (context, snapshot) {
                final durationState = snapshot.data;
                final progress = durationState?.position ?? Duration.zero;
                final buffered = durationState?.buffered ?? Duration.zero;
                final total = durationState?.duration ?? Duration.zero;
                return ProgressBar(
                  progress: progress,
                  buffered: buffered,
                  total: total,
                  onSeek: (duration) {
                    player.seek(duration);
                  },
                    timeLabelLocation: TimeLabelLocation.sides,
                );
              },
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SeekPrevious(player: player),
                PlayerButton(player: player),
                SeekNext(player: player),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          fit: StackFit.expand,
          children: [
            _buildBackgroundImage(),
            _buildBackgroundShader(),
            _buildSetUp(),
          ],
        ));
  }
}
