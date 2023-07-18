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
            // ..................... Constructor de Jugadors .............................
            ListView.builder(
                shrinkWrap: true,
                itemCount: listController.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15, left: 30),
                    // ------------------------- Llista on es troben els elements de cada Jugador-------------------------------
                    child: Row(children: [
                      Expanded(
                        child: Text(
                          game.jugadors[index].getNomJugador(),
                          style:
                              TextStyle(color: game.jugadors[index].getColor()),
                        ),
                      ),
                      // ..................... Inserir el nom.............................
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                                child: TextFormField(
                              onChanged: (value) {
                                game.jugadors[index]
                                    .setDiners(int.parse(value));
                              },
                              decoration: InputDecoration(
                                hintText:
                                    game.jugadors[index].getDiners().toString(),
                              ),
                            )),
                            const SizedBox(
                              height: 15,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      game.jugadors[index].afegirDiners(1);
                                    },
                                    child: const Icon(Icons.add),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      game.jugadors[index].eliminarDiners(1);
                                    },
                                    child: const Icon(Icons.remove),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
                  );
                }),
          ],
        ))));
  }
}
