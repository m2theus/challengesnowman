// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tab_map_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TabMapController on _TabMapBase, Store {
  final _$isLoadingAtom = Atom(name: '_TabMapBase.isLoading');

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

  final _$_TabMapBaseActionController = ActionController(name: '_TabMapBase');

  @override
  dynamic showLoading(bool value) {
    final _$actionInfo = _$_TabMapBaseActionController.startAction();
    try {
      return super.showLoading(value);
    } finally {
      _$_TabMapBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'isLoading: ${isLoading.toString()}';
    return '{$string}';
  }
}
