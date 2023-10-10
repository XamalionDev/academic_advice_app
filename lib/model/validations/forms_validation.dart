import 'package:flutter/material.dart';

InputBorder setBorder() {
  return OutlineInputBorder(borderRadius: BorderRadius.circular(10));
}

String? validateInput(String? input) {
  return (input == null || input.isEmpty) ? 'Ingrese  algún valor' : null;
}

void letEmpty(String? input){
  return (input == null || input.isEmpty) ? null : null;
}

String? validatePassword(String? password) {
  if (password == null || password.isEmpty) {
    return 'Ingresa algún valor';
  } else if (password.length < 6){
    return 'Mínimo 6 caracteres';
  } else {
    return null;
  }
}

String? validateDropdown(String? item) {
  return (item == '--Seleccionar--') ? 'Selecciona un valor' : null;
}