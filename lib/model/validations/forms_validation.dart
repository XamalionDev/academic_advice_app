String? validateInput(String? input) {
  return (input == null || input.isEmpty) ? 'Ingrese  algún valor' : null;
}

String? validateDropdown(String? item) {
  return (item == '--Seleccionar--') ? 'Selecciona un valor' : null;
}

String? validatePassword(String? password) {
  RegExp regex = RegExp(r'^(?=.*?[A-ZÑ])(?=.*?[a-zñ])(?=.*?[0-9])(?=.*?[!@#%&/*~\-_.]).{6,}$');
  if (password == null || password.isEmpty) {
    return 'Ingrese algún valor';
  } else {
    if (!regex.hasMatch(password)) {
      return 'Ingrese al menos 6 caracteres entre\nmayúsculas, minúsculas, números y alguno\nde los siguientes caracteres especiales:\n!, @, #, %, &, /, *, ~, -, _, .';
    } else {
      return null;
    }
  }
}

String? validatePhoneNumber(String? phoneNumber) {
  RegExp regex = RegExp(r'^(?=.*?[0-9]).{10}$');
  if (phoneNumber == null || phoneNumber.isEmpty){
    return 'Ingrese algún valor';
  } else {
    if (!regex.hasMatch(phoneNumber)) {
      return 'Ingrese un número de celular de 10 dígitos.';
    } else {
      return null;
    }
  }
}