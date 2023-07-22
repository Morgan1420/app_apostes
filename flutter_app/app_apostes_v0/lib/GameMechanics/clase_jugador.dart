import 'package:flutter/material.dart';

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

  Color getColor() {
    return color;
  }
  // --------------------------------------------------- Seters

  void setNomJugador(String nomJugador) {
    this.nomJugador = nomJugador;
  }

  void setColor(Color color) {
    this.color = color;
  }

  // --------------------------------------------------- Funcions Diner
  void setDiners(int diners) {
    this.diners = diners;
  }

  void afegirDiners(int dinersAfegir) {
    diners += dinersAfegir;
  }

  void eliminarDiners(int dinersEliminar) {
    diners -= dinersEliminar;
  }

  // --------------------------------------------------- Funcions diners inicials
  void setDinersInicials(int diners) {
    dinersInicials = diners;
  }

  void afegirDinersInicials(int dinersAfegir) {
    dinersInicials += dinersAfegir;
  }

  void eliminarDinersInicials(int dinersEliminar) {
    dinersInicials -= dinersEliminar;
  }

  int getDinersInicials() {
    return dinersInicials;
  }

  // --------------------------------------------------- Variables
  String nomJugador = "";
  Color color = Colors.blueAccent;
  var diners = 0;
  var dinersInicials = 0;
}
