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
  List<TextEditingController> listController = [TextEditingController()];
  bool moneyToAll = false;
  @override
  Widget build(BuildContext context) {
    listController.clear();
    for (var i = 0; i < game.nombreJugadors; i++) {
      listController.add(TextEditingController());
    }

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

            Row(
              children: [
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      moneyToAll = !moneyToAll;
                    });
                  },
                  child: moneyToAll
                      ? const Icon(
                          Icons.check_box,
                          color: Colors.green,
                        )
                      : const Icon(
                          Icons.check_box_outline_blank,
                        ),
                ),
                const Text("Same Money For All"),
                Expanded(child: Container()),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            // ..................... Constructor de insertor de diner dels Jugadors .............................
            ListView.builder(
                shrinkWrap: true,
                itemCount: listController.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15, left: 30),
                    // ------------------------- Llista on es troben els elements de cada Jugador-------------------------------
                    // ..................... nom del Jugador.............................
                    child: Row(children: [
                      Expanded(child: Container()),
                      Expanded(
                        child: Text(
                          game.jugadors[index].getNomJugador(),
                          style:
                              TextStyle(color: game.jugadors[index].getColor()),
                        ),
                      ),
                      // ..................... Inserir diner text form.............................
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                                child: TextFormField(
                              controller: listController[index],
                              onChanged: (value) {
                                if (listController[index].text == "") {
                                  listController[index].text = "0";
                                }

                                game.jugadors[index].setDiners(
                                    int.parse(listController[index].text));
                              },
                              onTapOutside: (event) {
                                if (listController[index].text != "") {
                                  if (moneyToAll) {
                                    game.setDinersInicialsTotsJugadors(
                                        int.parse(listController[index].text));
                                    for (var i = 0;
                                        i < listController.length;
                                        i++) {
                                      listController[i].text = game.jugadors[i]
                                          .getDinersInicials()
                                          .toString();
                                    }
                                  } else {
                                    game.jugadors[index].setDinersInicials(
                                        int.parse(listController[index].text));
                                  }
                                }
                              },
                              decoration: InputDecoration(
                                hintText: game.jugadors[index]
                                    .getDinersInicials()
                                    .toString(),
                              ),
                            )),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (moneyToAll) {
                                        game.afegirDinersInicialsTotsJugadors(
                                            1);

                                        for (var i = 0;
                                            i < listController.length;
                                            i++) {
                                          listController[i].text = game
                                              .jugadors[i]
                                              .getDinersInicials()
                                              .toString();
                                        }
                                      } else {
                                        game.jugadors[index]
                                            .afegirDinersInicials(1);
                                        listController[index].text = game
                                            .jugadors[index]
                                            .getDinersInicials()
                                            .toString();
                                      }
                                    });
                                  },
                                  child: const Icon(Icons.add, size: 15),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (moneyToAll) {
                                        game.afegirDinersInicialsTotsJugadors(
                                            -1);

                                        for (var i = 0;
                                            i < listController.length;
                                            i++) {
                                          listController[i].text = game
                                              .jugadors[i]
                                              .getDinersInicials()
                                              .toString();
                                        }
                                      } else {
                                        game.jugadors[index]
                                            .eliminarDinersInicials(1);
                                        listController[index].text = game
                                            .jugadors[index]
                                            .getDinersInicials()
                                            .toString();
                                      }
                                    });
                                  },
                                  child: const Icon(Icons.remove, size: 15),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                    ]),
                  );
                }),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SelectGameScreen()),
                );
              },
              child: Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text("Settings screen",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            )
          ],
        ))));
  }
}
