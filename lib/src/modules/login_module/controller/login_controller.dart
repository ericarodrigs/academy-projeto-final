// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/models/data_models/login_user_model.dart';
import '../../../shared/models/repositories/login_repository.dart';
import '../../../shared/validators/login_validator.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  final loginRepository = Modular.get<LoginRepository>();
  final loginValidator = Modular.get<LoginValidator>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

  String? errorText;

  @observable
  LoadState loadState = LoadState.done;

  @observable
  PageState pageState = PageState.fine;

  @action
  Future<void> changeLoadState(LoadState state) async {
    loadState = state;
  }

  @action
  Future<void> changePageState(PageState state) async {
    pageState = state;
  }

  Future<void> logIn() async {
    changeLoadState(LoadState.loading);
    changePageState(PageState.fine);
    errorText = null;
    await Future.delayed(const Duration(seconds: 2));
    try {
      await loginRepository.login(getLogin());
      changeLoadState(LoadState.done);
      // Modular.to.pushReplacementNamed('home');
    } catch (e) {
      errorText = e.toString();
      changePageState(PageState.error);
      changeLoadState(LoadState.done);
    }
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
