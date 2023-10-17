String getErrorMessage(String codeError) {
  String errorMessage = '';
  switch(codeError){
    case 'user-not-found':
      errorMessage = 'Usuario no encontrado, revise sus credenciales de acceso.';
      break;
    case 'invalid-email':
      errorMessage = 'Formato de email inválido, revise sus credenciales de acceso.';
      break;
    case 'email-already-in-use':
      errorMessage = 'Ya existe alguien con esta dirección de correo electrónico.';
      break;
    case 'user-disabled':
      errorMessage = 'Este usuario a sido deshabilitado, contacte con el encargado del programa de asesorías pares.';
      break;
    case 'wrong-password':
      errorMessage = 'Usuario o contraseña incorrectos.';
      break;
    case 'channel-error':
      errorMessage = 'Ingrese algún valor en todos los campos correspondientes.';
      break;
    case 'weak-password':
      errorMessage = 'Contraseña débil, considere usar al menos 6 caracteres.';
      break;
    case 'network-request-failed':
      errorMessage = 'Tiempo de espera excedido, revisa tu conexión a internet.';
      break;
  }
  return errorMessage;
}