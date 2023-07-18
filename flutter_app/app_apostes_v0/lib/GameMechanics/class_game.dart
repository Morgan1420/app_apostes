import 'package:flutter/material.dart';

import 'clase_jugador.dart';

const MAX_JUGADORS = 10;

class GameClass {
  // --------------------------------------------------- Funcions Joc
  void crearJoc() {}

  void iniciarJoc() {}

  void finalitzarJoc() {}

  // --------------------------------------------------- Funcions Jugador
  void afegirJugador(var nomJugador) {
    if (nombreJugadors < MAX_JUGADORS) {
      jugadors.add(JugadorClass(nomJugador));
      nombreJugadors++;
    }
  }

  void eliminarJugador(var nomJugador) {
    if (nombreJugadors > 0) {
      jugadors.removeWhere((element) => element.nomJugador == nomJugador);
      nombreJugadors--;
    }
  }

  int posJugador(String jugador) {
    for (var i = 0; i < jugadors.length; i++) {
      if (jugadors[i].getNomJugador() == jugador) {
        return i;
      }
    }
    return -1;
  }

  // --------------------------------------------------- Funcions Diners

  // --------------------------------------------------- Funcions Crear Partida

  // --------------------------------------------------- Funcions Jugar Partida

  // Variables
  var nombreJugadors = 0;
  List<JugadorClass> jugadors = []; // array on es guarden els jugadors
  List<Color> abailableColors = [
    Colors.greenAccent,
    Colors.redAccent,
    Colors.blueAccent,
    Colors.yellowAccent,
    Colors.purpleAccent,
    Colors.orangeAccent,
    Colors.pinkAccent,
    Colors.tealAccent,
    Colors.cyanAccent,
    Colors.limeAccent
  ];
}
