import 'package:app_apostes_v0/AppScreens/main.dart';
import 'package:flutter/material.dart';
import 'select_money_screen.dart';
import 'nav_bar.dart';

class PlayGameScreen extends StatelessWidget {
  const PlayGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text("Joc Apostes"),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MainApp()));
              })
        ],
      ),
      body: Row(),
    );
  }
}
