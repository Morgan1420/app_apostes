class JugadorClass {
  // --------------------------------------------------- Funcions Iniciar Jugador
  JugadorClass(var nom) {
    nomJugador = nom;
  }

  // --------------------------------------------------- Geters
  JugadorClass getClaseJugador() {
    return this;
  }

  int getDiners() {
    return diners;
  }

  String getNomJugador() {
    return nomJugador;
  }

  // --------------------------------------------------- Seters

  void setDiners(int diners) {
    this.diners = diners;
  }

  void setNomJugador(String nomJugador) {
    this.nomJugador = nomJugador;
  }

  // --------------------------------------------------- Funcions Diner
  void afegirDiners(int dinersAfegir) {
    diners += dinersAfegir;
  }

  void eliminarDiners(int dinersEliminar) {
    diners -= dinersEliminar;
  }

  // --------------------------------------------------- Variables
  var nomJugador = "";
  var diners = 0;
}
