import 'package:audio_player/app_theme/theme.dart';
import 'package:flutter/material.dart';

class PlayAndShuffleSwitch extends StatefulWidget {
  const PlayAndShuffleSwitch({super.key});

  @override
  State<PlayAndShuffleSwitch> createState() => _PlayAndShuffleSwitchState();
}

class _PlayAndShuffleSwitchState extends State<PlayAndShuffleSwitch> {
  bool isPlay = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPlay = !isPlay;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              left: isPlay ? 0 : MediaQuery.of(context).size.width * 0.45,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    borderRadius: BorderRadius.circular(15.0)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text('Play',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      color: isPlay
                                          ? Colors.white
                                          : AppTheme.primaryColor)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.play_circle,
                          color: isPlay ? Colors.white : AppTheme.primaryColor,
                          size: 23,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text('Shuffle',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      color: isPlay
                                          ? AppTheme.primaryColor
                                          : Colors.white)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.shuffle,
                            color:
                                isPlay ? AppTheme.primaryColor : Colors.white,
                            size: 23)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
