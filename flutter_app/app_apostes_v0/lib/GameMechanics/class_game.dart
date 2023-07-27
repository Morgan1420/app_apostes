import 'package:flutter/material.dart';

import 'clase_jugador.dart';

const MAX_JUGADORS = 10;

class GameClass {
  // --------------------------------------------------- Funcions Joc
  void crearJoc() {}

  void iniciarJoc() {
    for (var i = 0; i < jugadors.length; i++) {
      jugadors[i].apostarDienrs(apostaMinima);
      dinerTaula += jugadors[i].getDinersApostats();
      jugadors[i].setFold(false);
    }
  }

  void iniciarRonda() {}

  void pujarAposta(int diners) {
    dinerTaula += diners;
    jugadors[jugadorActual].apostarDienrs(diners);
  }

  void retirarJugador() {
    jugadors[jugadorActual].setFold(true);
  }

  void finalitzarJoc() {}

  void resetejarJoc() {
    jugadors.clear();
    nombreJugadors = 0;
    rotatingDealer = false;
    dealer = 0;
  }

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

  void setDinersInicialsTotsJugadors(var diners) {
    for (var i = 0; i < jugadors.length; i++) {
      jugadors[i].setDinersInicials(diners);
    }
  }

  void afegirDinersInicialsTotsJugadors(var diners) {
    for (var i = 0; i < jugadors.length; i++) {
      jugadors[i].afegirDinersInicials(diners);
    }
  }

  // --------------------------------------------------- Funcions Crear Partida

  // --------------------------------------------------- Funcions Jugar Partida

  // Variables
  var nombreJugadors = 0;
  List<JugadorClass> jugadors = []; // array on es guarden els jugadors
  bool rotatingDealer = false;
  int dealer = 0, jugadorActual = 0;
  int dinerTaula = 0, dinersAApostarCadaJugador = 0, apostaMinima = 0;
}
