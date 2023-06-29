import 'package:app_apostes_v0/AppScreens/playGameScreen.dart';
import 'package:flutter/material.dart';
import 'select_money_screen.dart';
import 'playGameScreen.dart';

class SelectGameOptionsScreen extends StatelessWidget {
  const SelectGameOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Joc Apostes")),
      body: Center(
        child: Column(
          children: [
            const Expanded(child: SizedBox()),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PlayGameScreen()),
                  );
                },
                child: const Text("Play Game")),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
