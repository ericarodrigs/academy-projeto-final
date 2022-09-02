class RegisterValidator {
  String? validateName(String? valueName) {
    return valueName == null || valueName.isEmpty
        ? 'Por favor, informe o nome.'
        : null;
  }

  String? validateEmail(String? valueEmail) {
    return valueEmail == null || valueEmail.isEmpty
        ? 'Por favor, informe o email.'
        : null;
  }

  String? validatePassword(String? valuePassword) {
    return valuePassword == null || valuePassword.isEmpty
        ? 'Por favor, informe a senha.'
        : null;
  }

  String? validateCodeClass(String? valueCodeClass) {
    return valueCodeClass == null || valueCodeClass.isEmpty
        ? 'Por favor, informe o código da sua turma.'
        : null;
  }
}
