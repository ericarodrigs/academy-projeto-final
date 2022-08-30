class LoginValidator {
  String? validateEmail(String? valueName) {
    if (valueName == null || valueName.isEmpty) {
      return 'Por favor, informe o campo.';
    }

    // bool isEmailValid =
    // RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(valueName);
    // if (!isEmailValid) {
    //   return 'Por favor, informe um e-mail válido.';
    // }
    return null;
  }

  String? validatePW(String? valueName) {
    if (valueName == null || valueName.isEmpty) {
      return 'Por favor, informe o campo.';
    }
    return null;
  }
}
