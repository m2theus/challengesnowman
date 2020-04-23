import 'package:challengesnowman/app/modules/login/components/toast.dart';
import 'package:challengesnowman/app/modules/models/user_model.dart';
import 'package:challengesnowman/app/services/authorization.dart';
import 'package:challengesnowman/app/services/shared_preferences_service.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginBase with _$LoginController;

abstract class _LoginBase with Store {
  @observable
  bool isLoading = false;
  int value = 0;
  final _auth = Auth();

  @action
  showLoading(bool value) {
    isLoading = value;
  }

  @action
  Future<void> login() async {
    try {
      showLoading(true);
      UserModel user = await _auth.signInFacebook();
      await sharedPreferences.openSession(user);
      showLoading(false);
      Get.toNamed('/home');
    } catch (e) {
      showLoading(false);
      Toast("Login", e, "falha").getSnack();
    }
  }

  @action
  Future<void> signUp() async {
    try {
      showLoading(true);
      UserModel user = await _auth.signUpFacebook();
      await sharedPreferences.openSession(user).then((data) {
        showLoading(false);
        Get.toNamed('/home');
      });
    } catch (e) {
      showLoading(false);
      Toast("Login", e, "falha").getSnack();
    }
  }
}
