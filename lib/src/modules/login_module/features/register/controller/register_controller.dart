// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rarovideowall/src/shared/models/register_user_model.dart';
import 'package:rarovideowall/src/shared/repositories/register_repository.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterController with _$RegisterController;

abstract class _RegisterController with Store {
  final registerRepository = Modular.get<RegisterRepository>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController accessCodeController = TextEditingController();

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

  Future<void> register() async {
    changeLoadState(LoadState.loading);
    changePageState(PageState.fine);
    errorText = null;

    (await registerRepository.register(getRegister())).fold(
      (fail) {
        errorText = fail.message;
        changePageState(PageState.error);
        changeLoadState(LoadState.done);
      },
      (success) {
        changeLoadState(LoadState.done);
        clearTextFields();
        Modular.to.pop();
        // Modular.to.pushNamed('/confirmRegister/');
      },
    );
  }

  RegisterUserModel getRegister() {
    return RegisterUserModel(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      accessCode: accessCodeController.text,
    );
  }

  bool get isTryRegister => formKey.currentState!.validate();

  bool isFieldEnabled() {
    return loadState == LoadState.loading ? false : true;
  }

  void registerInitState() {
    changePageState(PageState.fine);
    changeLoadState(LoadState.done);
    errorText = null;
  }

  void clearTextFields() {
    nameController.text = "";
    emailController.text = "";
    passwordController.text = "";
    accessCodeController.text = "";
  }
}

enum LoadState { loading, done }

enum PageState { error, fine }
