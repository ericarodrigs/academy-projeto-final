import 'package:flutter_test/flutter_test.dart';
import 'package:rarovideowall/src/shared/constants/validator.dart';

void main() {
  group('Validator testes', () {
    test(
        'Should return the result of the validation name when the field is empty',
            () {
          var result = Validator.validateName('');
          expect(result, 'Por favor, informe o nome');
        });

    test(
        'Should return the result of the validation name when the field is null',
            () {
          var result = Validator.validateName(null);
          expect(result, 'Por favor, informe o nome');
        });

    test(
        'Should return the result of the validation email when the field is empty',
            () {
          var result = Validator.validateEmail('');
          expect(result, 'Por favor, informe o email');
        });

    test(
        'Should return the result of the validation email when the field is null',
            () {
          var result = Validator.validateEmail(null);
          expect(result, 'Por favor, informe o email');
        });

    test(
        'Should return the result of the validation email when the field is filled with an invalid information',
            () {
          var result = Validator.validateEmail('aaaa');
          expect(result, 'Por favor, digite um email válido');
        });

    test(
        'Should return the result of the validation email when the field is filled with an valid information',
            () {
          var result = Validator.validateEmail('123asd.com');
          expect(result, 'Por favor, digite um email válido');
        });

    test(
        'Should return the result of the validation email when the field is filled with an valid information',
            () {
          var result = Validator.validateEmail('123@asd');
          expect(result, 'Por favor, digite um email válido');
        });

    test(
        'Should return the result of the validation email when the field is filled with an upper case character',
            () {
          var result = Validator.validateEmail('Erica@eriCa.com');
          expect(result, 'O email deve conter apenas letras minúsculas');
        });

    test(
        'Should return the result of the validation email when the field is filled with an valid information',
            () {
          var result = Validator.validateEmail('erica@erica.com');
          expect(result, null);
        });

    test(
        'Should return the result of the validation password when the field is empty',
            () {
          var result = Validator.validatePassword('');
          expect(result, 'Por favor, informe a senha');
        });

    test(
        'Should return the result of the validation password when the field is null',
            () {
          var result = Validator.validatePassword(null);
          expect(result, 'Por favor, informe a senha');
        });

    test(
        'Should return the result of the validation password when the field is shorter than 8 characters, does not have a number and does not have a special character',
            () {
          var result = Validator.validatePassword('Senha');
          expect(
              result,
              'A senha deve conter:\n'
                  '    * 8 caracteres\n'
                  '    * letra maiúscula e minúscula\n'
                  '    * número \n'
                  '    * caractere especial');
        });

    test(
        'Should return the result of the validation password when the field is is shorter than 8 characters',
            () {
          var result = Validator.validatePassword('Senha@1');
          expect(
              result,
              'A senha deve conter:\n'
                  '    * 8 caracteres\n'
                  '    * letra maiúscula e minúscula\n'
                  '    * número \n'
                  '    * caractere especial');
        });

    test(
        'Should return the result of the validation password when the field is null',
            () {
          var result = Validator.validatePassword('Senha@12');
          expect(result, null);
        });

    test(
        'Should return the result of the validation codeClass when the field is empty',
            () {
          var result = Validator.validateCodeClass('');
          expect(result, 'Por favor, informe o código da sua turma');
        });

    test(
        'Should return the result of the validation codeClass when the field is null',
            () {
          var result = Validator.validateCodeClass(null);
          expect(result, 'Por favor, informe o código da sua turma');
        });
  });
}
