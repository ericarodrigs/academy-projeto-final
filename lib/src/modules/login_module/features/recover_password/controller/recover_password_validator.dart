class RecoverPasswordValidator {
  String? validateCode(String? valueCode) {
    if(valueCode == null || valueCode.isEmpty){
      return 'Por favor, informe o codigo correto.';
    }
      return null;
  }

  String? validateEmail(String? valueEmail) {
    if(valueEmail == null || valueEmail.isEmpty){
      return 'Por favor, digite um email válido.';
    }
    return null;
  }

  String? validateNewPassword(String? valueNewPassword) {
    if(valueNewPassword == null || valueNewPassword.isEmpty){
      return 'Por favor, informe sua nova senha.';
    }
    return null;
  }

}
