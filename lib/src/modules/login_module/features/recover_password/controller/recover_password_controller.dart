// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rarovideowall/src/shared/interfaces/login_repository_interface.dart';
import 'package:rarovideowall/src/shared/models/recover_password.dart';
import 'package:rarovideowall/src/shared/models/request_code_model.dart';

part 'recover_password_controller.g.dart';

class RecoverPasswordController = _RecoverPasswordController
    with _$RecoverPasswordController;

abstract class _RecoverPasswordController with Store {
  final ILoginRepository loginRepository;
  final GlobalKey<FormState> formKeyEmail = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyCode = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyNewPassword = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController recuperationCodeController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? errorText;

  _RecoverPasswordController({required this.loginRepository});

  @observable
  LoadState loadState = LoadState.done;

  @observable
  PageState pageState = PageState.fine;

  @observable
  bool isHiddenPassword = true;

  @observable
  bool isHiddenConfirmPassword = true;

  @action
  Future<void> changeLoadState(LoadState state) async {
    loadState = state;
  }

  @action
  Future<void> changePageState(PageState state) async {
    pageState = state;
  }

  @action
  Future<void> changePasswordVisibility() async {
    isHiddenPassword = !isHiddenPassword;
  }

  @action
  Future<void> changeConfirmPasswordVisibility() async {
    isHiddenConfirmPassword = !isHiddenConfirmPassword;
  }

  bool get isTryRecoverWithEmail => formKeyEmail.currentState!.validate();

  bool get isTryRecoverWithCode => formKeyCode.currentState!.validate();

  bool get isTryRecoverNewPassword =>
      formKeyNewPassword.currentState!.validate();

  RequestCodeModel getRegister() {
    return RequestCodeModel(email: emailController.text);
  }

  Future<void> verifyEmail() async {
    changeLoadState(LoadState.loading);
    changePageState(PageState.fine);
    errorText = null;

    (await loginRepository.requestCode(getRegister())).fold((fail) {
      errorText = fail.message;
      changePageState(PageState.error);
      changeLoadState(LoadState.done);
    }, (success) {
      changeLoadState(LoadState.done);
      Modular.to.pushNamed('request_code');
    });
  }

  RecoverPasswordModel getData() {
    return RecoverPasswordModel(
      code: recuperationCodeController.text,
      newPassword: passwordController.text,
    );
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Senha alterada com sucesso!'),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.green,
      ),
    );
  }

  Future<void> updatePassword(BuildContext context) async {
    changeLoadState(LoadState.loading);
    changePageState(PageState.fine);
    errorText = null;

    (await loginRepository.updatePassword(getData())).fold((fail) {
      errorText = fail.message;
      changePageState(PageState.error);
      changeLoadState(LoadState.done);
    }, (success) {
      changeLoadState(LoadState.done);
      Modular.to.popUntil((p0) => false);
      _showSnackBar(context);
    });
  }

  bool isFieldEnabled() {
    return loadState == LoadState.loading ? false : true;
  }

  void recoverInitState() {
    changePageState(PageState.fine);
    changeLoadState(LoadState.done);
  }
}

enum LoadState { loading, done }

enum PageState { error, fine }
