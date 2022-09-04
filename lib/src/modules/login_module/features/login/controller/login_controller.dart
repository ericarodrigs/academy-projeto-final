// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rarovideowall/src/shared/models/login_user_model.dart';
import 'package:rarovideowall/src/shared/repositories/login_repository.dart';
import 'package:rarovideowall/src/shared/validator/validator.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  final loginRepository = Modular.get<LoginRepository>();
  final validator = Modular.get<Validator>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

  String? errorText;

  @observable
  LoadState loadState = LoadState.done;

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

  Future<void> logIn() async {
    changeLoadState(LoadState.loading);
    changePageState(PageState.fine);
    errorText = null;

    (await loginRepository.login(getLogin())).fold(
      (fail) {
        errorText = fail.message;
        changePageState(PageState.error);
        changeLoadState(LoadState.done);
      },
      (success) {
        changeLoadState(LoadState.done);
        Modular.to.pop();
      },
    );
  }

  LoginUserModel getLogin() {
    return LoginUserModel(
      email: emailController.text,
      senha: pwController.text,
    );
  }

  bool get isTryLogin => formKey.currentState!.validate();

  bool isFieldEnabled() {
    return loadState == LoadState.loading ? false : true;
  }

  void loginInitState() {
    changePageState(PageState.fine);
    changeLoadState(LoadState.done);
    errorText = null;
  }
}

enum LoadState { loading, done }

enum PageState { error, fine }
