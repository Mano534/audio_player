import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.deepOrange.shade800,
          Colors.deepOrange.shade200
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
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
          ),
          body: Container(),
          bottomNavigationBar:
              BottomNavigationBar(
                backgroundColor: Colors.deepOrange.shade800,
                unselectedItemColor: Colors.white,
                selectedItemColor: Colors.white,
                showUnselectedLabels: false,
                showSelectedLabels: false
                ,items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline), label: 'Favourite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.play_circle_outline), label: 'Play'),
            BottomNavigationBarItem(
                icon: Icon(Icons.people_outline), label: 'Profile'),
          ]),
        ));
  }
}
