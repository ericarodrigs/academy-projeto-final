// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:rarovideowall/src/modules/login_module/features/login/model/login_user_model.dart';
import 'package:rarovideowall/src/modules/login_module/login_route_names.dart';
import 'package:rarovideowall/src/shared/constants/load_states.dart';
import 'package:rarovideowall/src/shared/interfaces/local_storage_service.dart';
import 'package:rarovideowall/src/shared/interfaces/local_storage_user_repository_interface.dart';
import 'package:rarovideowall/src/shared/interfaces/login_repository_interface.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  final ILoginRepository loginRepository;
  final ILocalStorageUserRepository localStorageUserRepository;
  final LocalStorageService localStorageService;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  _LoginController({
    required this.loginRepository,
    required this.localStorageUserRepository,
    required this.localStorageService,
  });

  String? errorText;

  @observable
  LoadState loadState = LoadState.success;

  @observable
  PageState pageState = PageState.fine;

  @observable
  bool isHiddenPassword = true;

  @observable
  bool isChecked = false;

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
  void toggleChecked() {
    isChecked = !isChecked;
  }

  Future<void> logIn() async {
    changeLoadState(LoadState.loading);
    changePageState(PageState.fine);
    errorText = null;

    (await loginRepository.login(_getLogin())).fold(
      (fail) {
        errorText = fail.message;
        changePageState(PageState.error);
        changeLoadState(LoadState.success);
      },
      (success) {
        ///To clear all saved videos on history.
        localStorageService.deleteAll();
        _rememberMe();
        changeLoadState(LoadState.success);
        Modular.to.pop();
      },
    );
  }

  void _rememberMe() async {
    if (isChecked == true) {
      await localStorageUserRepository.save(_getLogin());
    }
  }

  LoginUserModel _getLogin() {
    return LoginUserModel(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  bool get isTryLogin => formKey.currentState!.validate();

  bool isFieldEnabled() => loadState == LoadState.loading ? false : true;

  void loginInitState() {
    changePageState(PageState.fine);
    changeLoadState(LoadState.success);
    errorText = null;
  }

  void goToRegisterPage() {
    Modular.to
        .pushNamed(LoginRouteNames.register)
        .then((value) => loginInitState());
  }

  void goToRequestEmailPage() {
    Modular.to
        .pushNamed(LoginRouteNames.requestEmailRoute)
        .then((value) => loginInitState());
  }
}

enum PageState { error, fine }
