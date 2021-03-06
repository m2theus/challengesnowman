// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginBase, Store {
  final _$isLoadingAtom = Atom(name: '_LoginBase.isLoading');

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

  final _$loginAsyncAction = AsyncAction('login');

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$loginAninimousAsyncAction = AsyncAction('loginAninimous');

  @override
  Future<void> loginAninimous() {
    return _$loginAninimousAsyncAction.run(() => super.loginAninimous());
  }

  final _$signUpAsyncAction = AsyncAction('signUp');

  @override
  Future<void> signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

  final _$_LoginBaseActionController = ActionController(name: '_LoginBase');

  @override
  dynamic showLoading(bool value) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.showLoading(value);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'isLoading: ${isLoading.toString()}';
    return '{$string}';
  }
}
