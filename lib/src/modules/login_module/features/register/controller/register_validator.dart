import 'package:rarovideowall/src/shared/constants/regex_types.dart';

class RegisterValidator {
  String? validateName(String? valueName) {
    return valueName == null || valueName.isEmpty
        ? 'Por favor, informe o nome.'
        : null;
  }

  String? validateEmail(String? valueEmail) {
    if (valueEmail == null || valueEmail.isEmpty) {
      return 'Por favor, informe o email';
    }
    if (!RegexTypes.emailValidator.hasMatch(valueEmail) ||
        valueEmail.contains(' ')) {
      return 'Por favor, digite um email válido';
    }
    if (RegexTypes.upperCaseValidator.hasMatch(valueEmail)) {
      return 'O email deve conter apenas letras minúsculas.';
    }
    return null;
  }

  String? validatePassword(String? valuePassword) {
    if (valuePassword == null || valuePassword.isEmpty) {
      return 'Por favor, informe a senha.';
    }
    if (!RegexTypes.passwordValidator.hasMatch(valuePassword)) {
      return 'A senha deve conter:\n'
          '    * 8 caracteres\n'
          '    * letra maiúscula e minúscula\n'
          '    * número \n'
          '    * caractere especial.';
    }
    return null;
  }

  String? validateCodeClass(String? valueCodeClass) {
    if (valueCodeClass == null || valueCodeClass.isEmpty) {
      return 'Por favor, informe o código da sua turma.';
    }

    if (valueCodeClass != '55402f9b-ca01-4cb4-ae36-dc85d7e154b8') {
      return 'Código da turma inválido.';
    }
    return null;
  }
}