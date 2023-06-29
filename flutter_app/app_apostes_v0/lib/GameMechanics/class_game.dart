import 'clase_jugador.dart';

const MAX_JUGADORS = 10;

class GameClass {
  // --------------------------------------------------- Funcions Joc
  void crearJoc() {}

  void iniciarJoc() {}

  void finalitzarJoc() {}

  // --------------------------------------------------- Funcions Jugador
  void afegirJugador(var idJugador) {
    if (nombreJugadors < MAX_JUGADORS) {
      jugadors.add(JugadorClass(idJugador));
      nombreJugadors++;
    }
  }

  void eliminarJugador(var idJugador) {
    if (nombreJugadors > 0) {
      jugadors.removeWhere((element) => element.idJugador == idJugador);
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
