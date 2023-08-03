import 'package:flutter/material.dart';

import 'clase_jugador.dart';

const MAX_JUGADORS = 10;

class GameClass {
  // --------------------------------------------------- Funcions Joc
  void crearJoc() {}

  // ----------------------------------- Iniciadors
  void iniciarJoc() {
    if (!jocIniciat) {
      jocIniciat = true;

      for (int j = 0; j < jugadors.length; j++) {
        jugadors[j].setDiners(jugadors[j].getDinersInicials());
      }

      iniciarRonda();
    }
  }

  void iniciarRonda() {
    for (var i = 0; i < jugadors.length; i++) {
      jugadors[i].setDinersApotats(apostaMinima);
      jugadors[i].setFold(false);
    }
  }

  void iniciarTongada() {}

  // ----------------------------------- Torn jugador
  void foldJugador() {
    jugadors[jugadorActual].setFold(true);
  }

  void igualarAposta() {
    dinerTaula += (dinersAApostarCadaJugador -
        jugadors[jugadorActual].getDinersApostats());
    jugadors[jugadorActual].setDinersApotats(dinersAApostarCadaJugador);
  }

  void pujarAposta(int diners) {
    jugadors[jugadorActual].setRisen(true);
    if (jugadors[jugadorActual].getDiners() - diners < 0) {
      allIn();
    } else {
      dinerTaula += diners;
      dinersAApostarCadaJugador += diners;

      jugadors[jugadorActual].setDinersApotats(dinersAApostarCadaJugador);
    }
  }

  void allIn() {
    jugadors[jugadorActual].setRisen(true);
    dinerTaula += (jugadors[jugadorActual].getDiners() -
        jugadors[jugadorActual].getDinersApostats());
    dinersAApostarCadaJugador += (jugadors[jugadorActual].getDiners() -
        jugadors[jugadorActual].getDinersApostats());

    jugadors[jugadorActual]
        .setDinersApotats(jugadors[jugadorActual].getDiners());
  }

  void passarTorn() {
    int ji = jugadorActual;

    if (ultimJugadorFold()) {
      finalitzarRonda();
    }

    do {
      if (jugadorActual < nombreJugadors - 1) {
        jugadorActual++;
      } else {
        jugadorActual = 0;
      }
    } while (jugadors[jugadorActual].getFold() && ji != jugadorActual);

    if (tornsSensePujar == nombreJugadors - 1) {
      finalitzarTongada();
      textAlerta = "Tongada finalitzada, Aixecar cartes";
    } else {
      tornsSensePujar++;
      textAlerta = "";
    }
  }

  // ----------------------------------- Finalitzadors
  void finalitzarTongada() {
    for (var i = 0; i < jugadors.length; i++) {
      jugadors[i].setRisen(false);
    }
    switch (cartesRevelades) {
      case 0:
        cartesRevelades = 3;
        break;
      case 3:
        cartesRevelades = 4;
        break;
      case 4:
        cartesRevelades = 5;
        break;
      default:
        textAlerta = "Ronda finalitzada, Seleccionar guanyador";
        finalitzarRonda();
        break;
    }
  }

  void finalitzarRonda() {
    for (var i = 0; i < jugadors.length; i++) {
      if (jugadors[i].getNomJugador() == guanyadorRonda) {
        jugadors[i].afegirDiners(dinerTaula - jugadors[i].getDinersApostats());
      } else {
        jugadors[i].eliminarDiners(jugadors[i].getDinersApostats());
      }

      jugadors[i].resetejarDinersApostats();
    }
    dinersAApostarCadaJugador = apostaMinima;
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

  int getJugadorActual() {
    return jugadorActual;
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

  // --------------------------------------------------- Funcions Extra
  Color getColorButton(Color col) {
    if (jugadors[jugadorActual].getFold()) {
      return Colors.grey;
    }
    return col;
  }

  Color getColorButtonRisen(Color col) {
    if (jugadors[jugadorActual].getRisen()) {
      return Colors.grey;
    }
    return col;
  }

  bool ultimJugadorFold() {
    int j = 0;
    for (var i = 0; i < jugadors.length; i++) {
      if (jugadors[i].getFold()) {
        j++;
      }
    }
    if (j == jugadors.length - 1) {
      return true;
    }
    return false;
  }

  // Variables
  var nombreJugadors = 0;
  List<JugadorClass> jugadors = []; // array on es guarden els jugadors
  bool rotatingDealer = false, jocIniciat = false;
  int dealer = 0, jugadorActual = 0, tornsSensePujar = 0;
  int dinerTaula = 0, dinersAApostarCadaJugador = 0, apostaMinima = 0;
  int cartesRevelades = 0;
  String guanyadorRonda = "", textAlerta = "";
}
