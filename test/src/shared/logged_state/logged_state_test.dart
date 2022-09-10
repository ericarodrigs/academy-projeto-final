import 'package:flutter_test/flutter_test.dart';
import 'package:rarovideowall/src/shared/global_states/logged_state/logged_state.dart';
import 'package:rarovideowall/src/shared/models/user_model.dart';

void main(){
  final state = LoggedState.instance;
  
  final UserModel userModel = UserModel(
    accessToken: '0011ff',
    name: 'Jose',
    admin: false,
    foto: 'url',
    id: '11111'
    );

  group('logged state test', (){

  test('logged test', (){
    state.setLogin(userModel);
    expect(state.isLogged == true, state.user != null);
  });

  test('logout test', (){
    state.setLogout();
    expect(state.isLogged == false, state.user == null);
  });
  
});
}