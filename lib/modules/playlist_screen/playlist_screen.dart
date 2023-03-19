// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:audio_player/modules/playlist_screen/playlist_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_theme/theme.dart';
import '../../widgets/play_and_shuffle_switch.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final PlayList playlist = Get.arguments;
    _buildAppBar() {
      return AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
              Get.back();
            },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 30,
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Play List',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold)),
        actions: const [  Icon(
              Icons.more_vert_rounded,
              size: 30,
            ),
            
          
        ],
      );
    }

    _buildPlaylistHeading() {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  playlist.imageUrl,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                playlist.title,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(fontWeight: FontWeight.bold, fontSize: 27),
              )
            ],
          ),
        ),
      );
    }

    _buildPlayListColumn() {
      return ListView.builder(
        itemCount: playlist.songs.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final counter = index + 1;
          return ListTile(
            leading: Text('$counter',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            title: Text(playlist.title,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            subtitle: Text('${playlist.title} - 3:25',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            trailing: const Icon(
              Icons.more_vert,
              color: Colors.white,
              size: 23,
            ),
          );
        },
      );
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
          gradient: AppTheme.appColor,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: _buildAppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                _buildPlaylistHeading(),
                const PlayAndShuffleSwitch(),
                const SizedBox(
                  height: 10,
                ),
                _buildPlayListColumn()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
