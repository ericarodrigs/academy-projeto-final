// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rarovideowall/src/modules/login_module/features/register/model/register_user_model.dart';
import 'package:rarovideowall/src/modules_route_names.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/shared/constants/load_states.dart';
import 'package:rarovideowall/src/shared/constants/show_popups.dart';
import 'package:rarovideowall/src/shared/interfaces/login_repository_interface.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterController with _$RegisterController;

abstract class _RegisterController with Store {
  final ILoginRepository loginRepository;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController accessCodeController = TextEditingController();

  String? errorText;

  _RegisterController({required this.loginRepository});

  @observable
  LoadState loadState = LoadState.success;

  @observable
  PageState pageState = PageState.fine;

  @observable
  bool isHiddenPassword = true;

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

  Future<void> register(BuildContext context) async {
    changeLoadState(LoadState.loading);
    changePageState(PageState.fine);
    errorText = null;

    (await loginRepository.register(_getRegister())).fold(
      (fail) {
        errorText = fail.message;
        changePageState(PageState.error);
        changeLoadState(LoadState.success);
      },
      (success) {
        changeLoadState(LoadState.success);
        _clearTextFields();
        Modular.to.pushReplacementNamed(ModulesRouteNames.loginModule);
        ShowPopups.showSnackBar(
            context, 'Usuário cadastrado com sucesso!', AppColors.purple);
      },
    );
  }

  RegisterUserModel _getRegister() {
    return RegisterUserModel(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      accessCode: accessCodeController.text,
    );
  }

  bool get isTryRegister => formKey.currentState!.validate();

  bool isFieldEnabled() => loadState == LoadState.loading ? false : true;

  void registerInitState() {
    changePageState(PageState.fine);
    changeLoadState(LoadState.success);
    errorText = null;
  }

  void _clearTextFields() {
    nameController.text = "";
    emailController.text = "";
    passwordController.text = "";
    accessCodeController.text = "";
  }
}

enum PageState { error, fine }
