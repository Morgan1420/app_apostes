import 'package:flutter/material.dart';
import 'createGameScreen.dart';
import 'playGameScreen.dart';
import 'selectGameScreen.dart';

void main() {
  runApp(MaterialApp(title: "aaaa", home: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // make empty space
            const Expanded(child: SizedBox()), // 10% of total height of screen
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SelectGameScreen()),
                );
              },
              child: const Text('Select Game'),
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
