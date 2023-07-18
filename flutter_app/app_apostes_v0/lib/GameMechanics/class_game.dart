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
  void setDinersTotsJugadors(var diners) {
    for (var i = 0; i < jugadors.length; i++) {
      jugadors[i].setDiners(diners);
    }
  }

  void afegirDinersTotsJugadors(var diners) {
    for (var i = 0; i < jugadors.length; i++) {
      jugadors[i].afegirDiners(diners);
    }
  }
  // --------------------------------------------------- Funcions Crear Partida

  // --------------------------------------------------- Funcions Jugar Partida

  // Variables
  var nombreJugadors = 0;
  List<JugadorClass> jugadors = []; // array on es guarden els jugadors
}
