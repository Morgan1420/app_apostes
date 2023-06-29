class JugadorClass {
  // --------------------------------------------------- Funcions Iniciar Jugador
  JugadorClass(var id) {
    idJugador = id;
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

  int getIdJugador() {
    return idJugador;
  }

  // --------------------------------------------------- Seters

  void setDiners(int diners) {
    this.diners = diners;
  }

  void setNomJugador(String nomJugador) {
    this.nomJugador = nomJugador;
  }

  void setIdJugador(int idJugador) {
    this.idJugador = idJugador;
  }

  // --------------------------------------------------- Funcions Diner
  void afegirDiners(int dinersAfegir) {
    diners += dinersAfegir;
  }

  void eliminarDiners(int dinersEliminar) {
    diners -= dinersEliminar;
  }

  // --------------------------------------------------- Variables
  var idJugador = 0;
  var nomJugador = "";
  var diners = 0;
}
