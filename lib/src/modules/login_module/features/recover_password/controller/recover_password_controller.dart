// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rarovideowall/src/modules/login_module/login_route_names.dart';
import 'package:rarovideowall/src/modules_route_names.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/shared/constants/custom_snack_bar.dart';
import 'package:rarovideowall/src/shared/interfaces/login_repository_interface.dart';
import 'package:rarovideowall/src/modules/login_module/features/recover_password/model/recover_password_model.dart';
import 'package:rarovideowall/src/modules/login_module/features/recover_password/model/request_code_model.dart';

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
  final TextEditingController passwordConfirmationController =
      TextEditingController();

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

  RequestCodeModel _getRegister() => RequestCodeModel(email: emailController.text);

  Future<void> verifyEmail() async {
    changeLoadState(LoadState.loading);
    changePageState(PageState.fine);
    errorText = null;

    (await loginRepository.requestCode(_getRegister())).fold((fail) {
      errorText = fail.message;
      changePageState(PageState.error);
      changeLoadState(LoadState.done);
    }, (success) {
      changeLoadState(LoadState.done);
      Modular.to.pushNamed(LoginRouteNames.requestCodeRoute);
    });
  }

  void goToChangePasswordPage() {
    Modular.to
        .pushNamed(LoginRouteNames.changePasswordRoute)
        .then((value) => recoverInitState());
  }

  RecoverPasswordModel _getData() {
    return RecoverPasswordModel(
      code: recuperationCodeController.text,
      newPassword: passwordController.text,
    );
  }

  Future<void> updatePassword(BuildContext context) async {
    changeLoadState(LoadState.loading);
    changePageState(PageState.fine);
    errorText = null;

    (await loginRepository.updatePassword(_getData())).fold((fail) {
      errorText = fail.message;
      changePageState(PageState.error);
      changeLoadState(LoadState.done);
    }, (success) {
      changeLoadState(LoadState.done);
      _clearTextFields();
      Modular.to.popUntil(ModalRoute.withName(ModulesRouteNames.loginModule));
      CustomSnackBar.showSnackBar(
          context, 'Senha alterada com sucesso!', AppColors.purple);
    });
  }

  bool isFieldEnabled() => loadState == LoadState.loading ? false : true;

  void recoverInitState() {
    changePageState(PageState.fine);
    changeLoadState(LoadState.done);
  }

  void _clearTextFields() {
    emailController.text = '';
    recuperationCodeController.text = '';
    passwordController.text = '';
    passwordConfirmationController.text = '';
  }
}

enum LoadState { loading, done }

enum PageState { error, fine }
