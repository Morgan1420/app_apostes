import 'package:app_apostes_v0/GameMechanics/class_game.dart';
import 'package:flutter/material.dart';
import 'select_players_screen.dart';
import 'playGameScreen.dart';
import 'selectGameScreen.dart';
import '../GameMechanics/class_game.dart';

GameClass game = GameClass();
void main() {
  runApp(const MaterialApp(
    title: "Joc Apostes",
    home: MainApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Joc Apostes"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            // make empty space
            const Expanded(child: SizedBox()),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SelectGameScreen()),
                );
              },
              child: const Text('Select Saved Game'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PlayGameScreen()),
                );
              },
              child: const Text('Load Last Game'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateGameScreen()),
                );
              },
              child: const Text('Create Game'),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
