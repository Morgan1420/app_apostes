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

  void afegirDinersJugador(var idJugador) {}

  void eliminarDinersJugador(var idJugador) {}

  // --------------------------------------------------- Funcions Crear Partida

  // --------------------------------------------------- Funcions Jugar Partida

  // Variables
  var nombreJugadors = 0;
  List<JugadorClass> jugadors = []; // array on es guarden els jugadors
}
