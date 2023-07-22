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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateGameScreen()),
                );
                game.resetejarJoc();
                game.afegirJugador("Jugador 1");
              },
              child: Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text("Create New Game",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
