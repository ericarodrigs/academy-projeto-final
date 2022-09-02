import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rarovideowall/src/modules/login_module/features/register/controller/register_validator.dart';

class RegisterController with Store {
  final registerValidator = Modular.get<RegisterValidator>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController codeClassController = TextEditingController();

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

  bool get isTryRegister => formKey.currentState!.validate();

  bool isFieldEnabled() {
    return loadState == LoadState.loading ? false : true;
  }

  void registerInitState() {
    changePageState(PageState.fine);
    changeLoadState(LoadState.done);
    errorText = null;
  }
}

enum LoadState { loading, done }

enum PageState { error, fine }
