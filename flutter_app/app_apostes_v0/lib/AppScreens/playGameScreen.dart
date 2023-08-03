import 'package:app_apostes_v0/AppScreens/main.dart';
import 'package:flutter/material.dart';
import 'select_money_screen.dart';
import 'nav_bar.dart';
import 'select_game_options_screen.dart';
import '../GameMechanics/class_game.dart';

class PlayGameScreen extends StatefulWidget {
  const PlayGameScreen({Key? key}) : super(key: key);

  @override
  State<PlayGameScreen> createState() => _PlayGameScreenState();
}

class _PlayGameScreenState extends State<PlayGameScreen> {
  List<TextEditingController> listController = [TextEditingController()];

  @override
  Widget build(BuildContext context) {
    if (listController.length != game.nombreJugadors) {
      listController.clear();
      for (var i = 0; i < game.nombreJugadors; i++) {
        listController.add(TextEditingController());
      }
    }

    int jugadorActual = game.getJugadorActual();
    listController[jugadorActual].text = "0";
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
              Text("${game.jugadors[jugadorActual].getNomJugador()} ("),
              Text(game.jugadors[jugadorActual].getDiners().toString()),
              const Text(")"),
            ],
          ),
          Text(
              "Diners apostats: ${game.jugadors[jugadorActual].getDinersApostats()}"),
          Text("Diners a apostar: ${game.dinersAApostarCadaJugador}"),
          // ------------------------- Opcions jugador -------------------------------
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    game.foldJugador();
                    game.passarTorn();
                  });
                },
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: game.getColorButton(Colors.red),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text("Retirar-se",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    game.igualarAposta();
                    game.passarTorn();
                  });
                },
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: game.getColorButton(Colors.lightGreen),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text("Igualar",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      controller: listController[jugadorActual],
                      onTapOutside: (event) {
                        if (listController[jugadorActual].text != "" &&
                            int.parse(listController[jugadorActual].text) > 0) {
                          game.jugadors[jugadorActual].apostarDiners(
                              int.parse(listController[jugadorActual].text));
                        } else {
                          listController[jugadorActual].text = "0";
                        }
                      },
                      decoration: InputDecoration(
                          hintText: listController[jugadorActual].text),
                    )),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            int novaAposta =
                                int.parse(listController[jugadorActual].text) +
                                    1;
                            listController[jugadorActual].text =
                                novaAposta.toString();
                          },
                          child: const Icon(Icons.add, size: 15),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (game.jugadors[jugadorActual].getDiners() -
                                    int.parse(
                                        listController[jugadorActual].text) >
                                0) {
                              int novaAposta = int.parse(
                                      listController[jugadorActual].text) -
                                  1;
                              listController[jugadorActual].text =
                                  novaAposta.toString();
                            } else {
                              listController[jugadorActual].text = "0";
                            }
                          },
                          child: const Icon(Icons.remove, size: 15),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (game.jugadors[jugadorActual].getRisen() == false) {
                      game.pujarAposta(listController[jugadorActual].text == ""
                          ? 0
                          : int.parse(listController[jugadorActual].text));
                      game.passarTorn();
                      game.jugadors[jugadorActual].setRisen(true);
                    }
                  });
                },
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: game.getColorButton(Colors.green),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text("Raise",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    game.allIn();
                    game.passarTorn();
                  });
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
