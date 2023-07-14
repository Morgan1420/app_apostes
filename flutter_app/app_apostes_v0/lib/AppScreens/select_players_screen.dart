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
    return Scaffold(
        appBar: AppBar(title: const Text("Joc Apostes")),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              const Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                child: Text("Dynamic Text Field"),
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: listController.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 60,
                              alignment: Alignment.center,
                              child: TextFormField(
                                controller: listController[index],
                                autofocus: false,
                                decoration: const InputDecoration(
                                  hintText: "Insert Player Name",
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
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
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    game.afegirJugador(listController.last.text);
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
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
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
