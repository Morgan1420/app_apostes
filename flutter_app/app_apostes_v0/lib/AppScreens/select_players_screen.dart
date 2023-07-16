import 'package:app_apostes_v0/AppScreens/main.dart';
import 'package:app_apostes_v0/AppScreens/select_money_screen.dart';
import 'package:flutter/material.dart';
import 'select_money_screen.dart';
import 'select_game_options_screen.dart';
import '../GameMechanics/class_game.dart';

class CreateGameScreen extends StatefulWidget {
  const CreateGameScreen({Key? key}) : super(key: key);

  @override
  State<CreateGameScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateGameScreen> {
  List<TextEditingController> listController = [TextEditingController()];

  @override
  Widget build(BuildContext context) {
    // must reset game
    //game.afegirJugador("Jugador 1");

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
                child: Text("Selecciona els jugadors:"),
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
                      padding: const EdgeInsets.only(top: 15),
                      // ------------------------- Llista on es troben els elements de cada Jugador-------------------------------
                      child: Row(
                        children: [
                          // ..................... Inserir el nom.............................
                          Expanded(
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 60,
                              alignment: Alignment.center,
                              child: TextFormField(
                                controller: listController[index],
                                autofocus: false,
                                style: TextStyle(
                                    color: game.jugadors[index].getColor()),
                                decoration: InputDecoration(
                                  iconColor: game.jugadors[index].getColor(),
                                  hintText:
                                      game.jugadors[index].getNomJugador(),
                                  labelStyle: TextStyle(
                                      color: game.jugadors[index].getColor()),
                                ),
                              ),
                            ),
                          ),
                          // ...................... espai entre el nom i el boto de seleccionar color .....................
                          const SizedBox(
                            height: 15,
                          ),
                          // ..................... Botó Seleccionar Color .............................

                          DropdownButton(
                              value: game.jugadors[index].getColor(),
                              icon: Icon(
                                Icons.menu,
                                color: game.jugadors[index].getColor(),
                              ),
                              style: TextStyle(
                                  color: game.jugadors[index].getColor()),
                              items: const [
                                DropdownMenuItem(
                                  value: Colors.blueAccent,
                                  child: Text("Blue"),
                                ),
                                DropdownMenuItem(
                                  value: Colors.redAccent,
                                  child: Text("Red"),
                                ),
                                DropdownMenuItem(
                                  value: Colors.green,
                                  child: Text("Green"),
                                ),
                                DropdownMenuItem(
                                  value: Colors.yellowAccent,
                                  child: Text("Yellow"),
                                ),
                              ],
                              onChanged: (Color? newvalue) {
                                setState(() {
                                  game.jugadors[index].setColor(newvalue!);
                                });
                              }),
                          // ...................... espai entre el nom i el boto d'eliminar .....................
                          const SizedBox(
                            height: 15,
                          ),
                          // ..................... Botó Eliminar Jugador .............................
                          index != 0
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      game.eliminarJugador(
                                          listController[index].text);
                                      listController[index].clear();
                                      listController[index].dispose();
                                      listController.removeAt(index);
                                    });
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.blue,
                                    size: 35,
                                  ),
                                )
                              : const SizedBox()
                        ],
                      ),
                    );
                  }),
              // ..................... Separació .............................
              const SizedBox(
                height: 50,
              ),
              // ..................... Botó Afegir Jugador .............................
              GestureDetector(
                onTap: () {
                  setState(() {
                    game.jugadors.last.setNomJugador(listController.last.text);
                    game.afegirJugador("Jugador ${game.nombreJugadors + 1}");
                    listController.add(TextEditingController());
                  });
                },
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text("Add Player",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              // ..................... Separació .............................
              const SizedBox(
                height: 20,
              ),
              // ..................... Botó Següent Pantalla .............................
              GestureDetector(
                onTap: () {
                  setState(() {
                    game.jugadors.last.setNomJugador(listController.last.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SelectMoneyScreen()),
                    );
                  });
                },
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text("Change screen",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ]))));
  }
}
