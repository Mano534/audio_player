// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:audio_player/modules/playlist_screen/playlist_module.dart';
import 'package:flutter/material.dart';
import '../../app_theme/theme.dart';
import '../../widgets/widget.dart';
import '../song_screen/song_module.dart';

class HomeScreen extends StatelessWidget {
  final String title;
  final List<Song> songs = Song.songs;
  final List<PlayList> playlists = PlayList.playlists;
    HomeScreen({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    _buildAppBar() {
      return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.grid_view_rounded),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.jpg'),
            ),
          )
        ],
      );
    }

    _buildBottomNavigation() {
      return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppTheme.primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline), label: 'Favourite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.play_circle_outline), label: 'Play'),
            BottomNavigationBarItem(
                icon: Icon(Icons.people_outline), label: 'Profile'),
          ]);
    }

    _buildDiscoverMusic() {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
          Text(
            'welcome',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 5,),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 20,),
          TextFormField(
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              isDense: true,
              hintText: 'Search',
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppTheme.formColor),
              prefixIcon:const Icon(Icons.search),
              prefixIconColor: AppTheme.formColor,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none)
            ),
          )
        ]),
      );
    }

    _buildTrendingMusic(){
      return Padding(
                padding: const EdgeInsets.only(left: 20.0,top: 20.0,bottom: 20.0),
                child: Column(
                  children:  [
                     const Padding(
                      padding:   EdgeInsets.only(right:20.0),
                      child:   SetHeader(title:'Trending Now'),
                    ),
                    const SizedBox(height: 20.0,),
                    SizedBox(height: MediaQuery.of(context).size.height*0.30,child: 
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: songs.length,
                        itemBuilder: (context,index){
                          return SongCard(song : songs[index]);
                        })
                    ,)
                  ],
                ),
              );
              
            
    }
    
    _buildPlaylistSection(){
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SetHeader(title: 'Playlist'),
            const SizedBox(height: 20,),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: playlists.length,
              itemBuilder: ((context, index){
                return PlayListCard(playlist: playlists[index]);
            }))
          ],
        )
      );
    }
    
    return Container(
        decoration: BoxDecoration(gradient: AppTheme.appColor),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: _buildAppBar(),
          bottomNavigationBar: _buildBottomNavigation(),
          body: SingleChildScrollView(
            child: Column(
              children: [
              _buildDiscoverMusic(),
              _buildTrendingMusic(),
              _buildPlaylistSection()
              ]),
          ),
        ));
  }
}
