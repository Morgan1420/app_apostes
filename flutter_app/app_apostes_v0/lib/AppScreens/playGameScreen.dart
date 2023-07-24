import 'package:app_apostes_v0/AppScreens/main.dart';
import 'package:flutter/material.dart';
import 'select_money_screen.dart';
import 'nav_bar.dart';
import 'select_game_options_screen.dart';
import '../GameMechanics/class_game.dart';

class PlayGameScreen extends StatefulWidget {
  PlayGameScreen({Key? key}) : super(key: key);

  @override
  State<PlayGameScreen> createState() => _PlayGameScreenState();
}

class _PlayGameScreenState extends State<PlayGameScreen> {
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
      body: Column(
        children: [
          // ------------------------- Informació Partida -------------------------------
          Text("Diner a la taula: ${game.dinerTaula}"),
          // ------------------------- Informació Jugador -------------------------------
          const Text("Torn de: "),
          Row(
            children: [
              Text("${game.jugadors[game.jugadorActual].getNomJugador()} ("),
              Text(game.jugadors[game.jugadorActual].getDiners().toString()),
              const Text(")"),
            ],
          ),
          Text(
              "Diners apostats: ${game.jugadors[game.jugadorActual].getDinersApostats()}"),
          Text(
              "Diners a pujar: ${game.dinersAApostarCadaJugador - game.jugadors[game.jugadorActual].getDinersApostats()}"),
          // ------------------------- Opcions jugador -------------------------------
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text("FOLD",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text("See it",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text("Raise",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text("All in",
                        style: TextStyle(color: Colors.black87)),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
