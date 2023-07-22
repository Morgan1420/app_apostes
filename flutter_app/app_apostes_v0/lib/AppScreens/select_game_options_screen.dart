import 'package:app_apostes_v0/AppScreens/playGameScreen.dart';
import 'package:flutter/material.dart';
import 'select_money_screen.dart';
import 'playGameScreen.dart';
import '../GameMechanics/class_game.dart';
import 'main.dart';

class SelectGameScreen extends StatefulWidget {
  const SelectGameScreen({Key? key}) : super(key: key);

  @override
  State<SelectGameScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Joc Apostes")),
      body: Center(
        child: Column(
          children: [
            const Expanded(child: SizedBox()),
            Row(
              children: [
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      game.rotatingDealer = !game.rotatingDealer;
                    });
                  },
                  child: game.rotatingDealer
                      ? const Icon(
                          Icons.check_box,
                          color: Colors.green,
                        )
                      : const Icon(
                          Icons.check_box_outline_blank,
                        ),
                ),
                const Text("Rotating Dealer"),
                Expanded(child: Container()),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PlayGameScreen()),
                );
              },
              child: Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text("Play Game",
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
