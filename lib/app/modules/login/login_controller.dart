import 'package:challengesnowman/app/modules/models/user_model.dart';
import 'package:challengesnowman/app/services/authorization.dart';
import 'package:challengesnowman/app/services/shared_preferences_service.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginBase with _$LoginController;

abstract class _LoginBase with Store {
  @observable
  int value = 0;
  final _auth = Auth();

  @action
  Future<void> login() async {
    UserModel user = await _auth.signInFacebook();
    await sharedPreferences.openSession(user);
    Get.toNamed('/home');
  }
}
