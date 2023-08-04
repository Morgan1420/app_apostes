import 'package:app_apostes_v0/GameMechanics/class_game.dart';
import 'package:flutter/material.dart';

Text textProva(String text) {
  return Text(text);
}

Row seleccionarNumero(
    TextEditingController controlador, GameClass game, int jugadorActual) {
  return Row(
    children: [
      TextFormField(
        controller: controlador,
        onTapOutside: (event) {
          if (controlador.text != "" && int.parse(controlador.text) > 0) {
            game.jugadors[jugadorActual]
                .apostarDiners(int.parse(controlador.text));
          } else {
            controlador.text = "0";
          }
        },
        decoration: InputDecoration(hintText: controlador.text),
      ),
      const SizedBox(
        width: 15,
      ),
      Column(
        children: [
          GestureDetector(
            onTap: () {
              int novaAposta = int.parse(controlador.text) + 1;
              controlador.text = novaAposta.toString();
            },
            child: const Icon(Icons.add, size: 15),
          ),
          GestureDetector(
            onTap: () {
              if (game.jugadors[jugadorActual].getDiners() -
                      int.parse(controlador.text) >
                  0) {
                int novaAposta = int.parse(controlador.text) - 1;
                controlador.text = novaAposta.toString();
              } else {
                controlador.text = "0";
              }
            },
            child: const Icon(Icons.remove, size: 15),
          )
        ],
      ),
    ],
  );
}

/**/ 