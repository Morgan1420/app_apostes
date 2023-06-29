import 'package:app_apostes_v0/AppScreens/select_game_options_screen.dart';
import 'package:flutter/material.dart';
import 'select_players_screen.dart';

class SelectMoneyScreen extends StatelessWidget {
  const SelectMoneyScreen({Key? key}) : super(key: key);

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
                        builder: (context) => const SelectGameOptionsScreen()),
                  );
                },
                child: const Text("Select Game Options")),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
