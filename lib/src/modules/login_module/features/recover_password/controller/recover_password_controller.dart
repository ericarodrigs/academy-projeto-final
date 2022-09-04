import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rarovideowall/src/modules/login_module/features/recover_password/controller/recover_password_validator.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/shared/models/recover_password.dart';
import 'package:rarovideowall/src/shared/models/request_code_model.dart';
import 'package:rarovideowall/src/shared/repositories/recover_password_repository.dart';

part 'recover_password_controller.g.dart';

class RecoverPasswordController = _RecoverPasswordController with _$RecoverPasswordController;

abstract class _RecoverPasswordController with Store{
  final recoverPasswordRepository = Modular.get<RecoverPasswordRepository>();
  final recoverPasswordValidator = Modular.get<RecoverPasswordValidator>();
  final GlobalKey<FormState> formKeyEmail = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyCode = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyNewPassword = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController recuperationCodeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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

  bool get isTryRecoverWithEmail => formKeyEmail.currentState!.validate();
  bool get isTryRecoverWithCode => formKeyCode.currentState!.validate();
  bool get isTryRecoverNewPassword => formKeyNewPassword.currentState!.validate();

  RequestCodeModel getRegister(){
    return RequestCodeModel(email: emailController.text);
  }

  Future<void> verifyEmail() async {
    changeLoadState(LoadState.loading);
    changePageState(PageState.fine);
    errorText = null;

    (await recoverPasswordRepository.requestCode(getRegister())).fold(
      (fail) {
        errorText: fail.message;
        changePageState(PageState.error);
        changeLoadState(LoadState.done);
      },
      (sucess) {
        changeLoadState(LoadState.done);
        Modular.to.pushNamed('request_code');
      }
    );
  }

  Future<Either<Failure, Map>> getUsers() async {
    changeLoadState(LoadState.loading);
    changePageState(PageState.fine);
    errorText = null;

    (await recoverPasswordRepository.getUsers()).fold(
      (fail) {
        errorText: fail.message;
        changePageState(PageState.error);
        changeLoadState(LoadState.done);
      },
      (sucess) {
        changeLoadState(LoadState.done);
        return getUsers();
      }
      
    );
    return Left(Failure('mensagem de erro'));
  }


  RecoverPasswordModel getData(){
    return RecoverPasswordModel( code: recuperationCodeController.text, newPassword: passwordController.text,);
  }

  Future<void> updatePassword() async {
    changeLoadState(LoadState.loading);
    changePageState(PageState.fine);
    errorText = null;

    (await recoverPasswordRepository.updatePassword(getData())).fold(
      (fail){
        errorText: fail.message;
        changePageState(PageState.error);
        changeLoadState(LoadState.done);
      },
      (sucess){
        changeLoadState(LoadState.done);
        Modular.to.popAndPushNamed('/login_module/');
      }
    );
  }


  bool isFieldEnabled() {
    return loadState == LoadState.loading ? false : true;
  }

  void recoverInitState() {
    changePageState(PageState.fine);
    changeLoadState(LoadState.done);
  }

}

enum LoadState { loading, done} 

enum PageState { error, fine}