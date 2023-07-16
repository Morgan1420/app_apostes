import 'package:app_apostes_v0/AppScreens/select_game_options_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_apostes_v0/AppScreens/main.dart';
import 'select_players_screen.dart';
import '../GameMechanics/class_game.dart';

class SelectMoneyScreen extends StatefulWidget {
  const SelectMoneyScreen({Key? key}) : super(key: key);

  @override
  State<SelectMoneyScreen> createState() => _SelectMoneyScreenState();
}

class _SelectMoneyScreenState extends State<SelectMoneyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Joc Apostes")),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          // -------------------------Columna principal-------------------------------
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ..................... Text de la pantalla .............................
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 20),
              child: Text("Selecciona el capital inicial:"),
            ),
            // ..................... Separació .............................
            const SizedBox(
              height: 15,
            ),
            // ..................... Constructor de Jugadors .............................
            ListView.builder(
                shrinkWrap: true,
                itemCount: game.nombreJugadors,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15),
                    // ------------------------- Llista on es troben els elements de cada Jugador-------------------------------
                    child: Row(
                      children: [Text(game.jugadors[index].nomJugador)],
                    ),
                  );
                }),
          ],
        ))));
  }
}
