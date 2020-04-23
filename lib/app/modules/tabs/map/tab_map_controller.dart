import 'package:challengesnowman/app/services/authorization.dart';
import 'package:mobx/mobx.dart';

part 'tab_map_controller.g.dart';

class TabMapController = _TabMapBase with _$TabMapController;

abstract class _TabMapBase with Store {
  @observable
  bool isLoading = false;
  int value = 0;
  final _auth = Auth();

  @action
  showLoading(bool value) {
    isLoading = value;
  }
}
