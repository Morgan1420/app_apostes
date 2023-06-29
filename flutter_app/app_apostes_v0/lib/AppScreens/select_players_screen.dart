import 'package:app_apostes_v0/AppScreens/main.dart';
import 'package:app_apostes_v0/AppScreens/select_money_screen.dart';
import 'package:flutter/material.dart';
import 'select_money_screen.dart';
import 'select_game_options_screen.dart';

class CreateGameScreen extends StatelessWidget {
  const CreateGameScreen({Key? key}) : super(key: key);

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
                        builder: (context) => const SelectMoneyScreen()),
                  );
                },
                child: const Text("Select Money")),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
