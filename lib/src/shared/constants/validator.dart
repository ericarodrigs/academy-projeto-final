import 'package:rarovideowall/src/shared/constants/regex_types.dart';

class Validator {
  static String? validateName(String? valueName) {
    return valueName == null || valueName.isEmpty
        ? 'Por favor, informe o nome'
        : null;
  }

  static String? validateEmail(String? valueEmail) {
    if (valueEmail == null || valueEmail.isEmpty) {
      return 'Por favor, informe o email';
    }
    if (!RegexTypes.emailValidator.hasMatch(valueEmail) ||
        valueEmail.contains(' ')) {
      return 'Por favor, digite um email válido';
    }
    if (RegexTypes.upperCaseValidator.hasMatch(valueEmail)) {
      return 'O email deve conter apenas letras minúsculas';
    }
    return null;
  }

  static String? validatePassword(String? valuePassword) {
    if (valuePassword == null || valuePassword.isEmpty) {
      return 'Por favor, informe a senha';
    }
    if (!RegexTypes.passwordValidator.hasMatch(valuePassword)) {
      return 'A senha deve conter:\n'
          '    * 8 caracteres\n'
          '    * letra maiúscula e minúscula\n'
          '    * número \n'
          '    * caractere especial';
    }
    return null;
  }

  static String? validatePasswordConfirmation(
      String? valuePasswordConfirmation, String? valuePassword) {
    if (valuePasswordConfirmation == null ||
        valuePasswordConfirmation.isEmpty) {
      return 'Por favor, informe a senha';
    }
    if (valuePasswordConfirmation != valuePassword) {
      return 'As senhas não coincidem';
    }
    return null;
  }

  static String? validateCodeClass(String? valueCodeClass) {
    return valueCodeClass == null || valueCodeClass.isEmpty
        ? 'Por favor, informe o código da sua turma'
        : null;
  }

  static String? validateCodeVerification(String? valueCodeVerification) {
    if (valueCodeVerification == null || valueCodeVerification.isEmpty) {
      return 'Por favor, informe o código de verificação.';
    }
    return null;
  }

  static String? validateComment(String? message) {
    if (message == null || message.isEmpty) {
      return 'A mensagem não pode ser vazia.';
    }
    return null;
  }
}
