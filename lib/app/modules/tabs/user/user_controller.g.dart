// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserController on _UserControllerBase, Store {
  final _$isLoadingAtom = Atom(name: '_UserControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$listSpotsAtom = Atom(name: '_UserControllerBase.listSpots');

  @override
  List<SpotModel> get listSpots {
    _$listSpotsAtom.context.enforceReadPolicy(_$listSpotsAtom);
    _$listSpotsAtom.reportObserved();
    return super.listSpots;
  }

  @override
  set listSpots(List<SpotModel> value) {
    _$listSpotsAtom.context.conditionallyRunInAction(() {
      super.listSpots = value;
      _$listSpotsAtom.reportChanged();
    }, _$listSpotsAtom, name: '${_$listSpotsAtom.name}_set');
  }

  final _$_UserControllerBaseActionController =
      ActionController(name: '_UserControllerBase');

  @override
  dynamic showLoading(bool value) {
    final _$actionInfo = _$_UserControllerBaseActionController.startAction();
    try {
      return super.showLoading(value);
    } finally {
      _$_UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'isLoading: ${isLoading.toString()},listSpots: ${listSpots.toString()}';
    return '{$string}';
  }
}
