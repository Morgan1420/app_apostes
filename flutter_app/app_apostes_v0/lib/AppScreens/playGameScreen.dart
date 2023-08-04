import 'package:app_apostes_v0/AppScreens/blueprints.dart';
import 'package:app_apostes_v0/AppScreens/main.dart';
import 'package:flutter/material.dart';
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
  int jugadorActual = 0;

  @override
  Widget build(BuildContext context) {
    if (listController.length != game.nombreJugadors) {
      listController.clear();
      for (var i = 0; i < game.nombreJugadors; i++) {
        listController.add(TextEditingController());
      }
    }

    jugadorActual = game.getJugadorActual();
    listController[jugadorActual].text = "0";

    if (game.fiRonda) {
      return interficieTriaGuanyador();
    } else if (game.fiTongada) {
      return interficieInformativa();
    } else {
      return interficieApostes();
    }
  }

  Scaffold interficieApostes() {
    // en aquesta interficie actuaran els jugadors de manera activa realitzant les diferents apostes
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
          Row(
            children: [
              Expanded(child: Container()),
              const Text("Torn de: "),
              Text("${game.jugadors[jugadorActual].getNomJugador()} ("),
              Text(game.jugadors[jugadorActual].getDiners().toString()),
              const Text(")"),
              Expanded(child: Container()),
            ],
          ),
          Text(
              "Diners apostats: ${game.jugadors[jugadorActual].getDinersApostats()}"),
          Text("Diners a apostar: ${game.dinersAApostarCadaJugador}"),
          Text("${game.cartesRevelades} de 5 cartes revelades"),
          // ------------------------- Opcions jugador -------------------------------
          Row(
            children: [
              Expanded(child: Container()),
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
                        horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                        color: game.getColorButton(Colors.red),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Text("Retirar-se",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  if (game.jugadors[jugadorActual].getRisen() == false &&
                      (game.dinersAApostarCadaJugador +
                              int.parse(listController[jugadorActual].text)) <=
                          game.jugadors[jugadorActual].getDiners()) {
                    setState(() {
                      game.allIn();
                      game.passarTorn();
                    });
                  }
                },
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                        color: game.getColorButtonRisen(Colors.yellow),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Text("All in",
                        style: TextStyle(color: Colors.black87)),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
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
                        horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                        color: game.getColorButton(Colors.lightGreen),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Text("Igualar",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
          Row(
            children: [
              Expanded(child: Container()),
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
                      width: 5,
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
                            if (int.parse(listController[jugadorActual].text) >
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
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  if (game.jugadors[jugadorActual].getRisen() == false &&
                      (game.dinersAApostarCadaJugador +
                              int.parse(listController[jugadorActual].text)) <=
                          game.jugadors[jugadorActual].getDiners()) {
                    setState(() {
                      game.pujarAposta(listController[jugadorActual].text == ""
                          ? 0
                          : int.parse(listController[jugadorActual].text));
                      game.passarTorn();
                    });
                  }
                },
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: game.getColorButtonRisen(Colors.green),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text("Raise",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
          Text(game.textAlerta),
        ],
      ),
    );
    ;
  }

  Scaffold interficieInformativa() {
    // en aquesta interficie es mostrara la informacio de la partida de l'estil: mostrar carta, guanyador: --- continuar?, ...
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
        body: Column(children: [
          Text(game.textAlerta),
          GestureDetector(
            onTap: () {
              setState(() {
                game.iniciarTongada();
              });
            },
            child: Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("Continuar",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ]));
  }

  Scaffold interficieTriaGuanyador() {
    // en aquesta interficie es seleccionarà el jugador guanyador de la ronda (quí es quedarà tot el diner de la taula)
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
        body: Column(children: [
          Text(game.textAlerta),
          GestureDetector(
            onTap: () {
              setState(() {
                game.iniciarRonda();
              });
            },
            child: Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("Continuar",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ]));
  }
}
