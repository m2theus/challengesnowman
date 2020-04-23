// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_spot_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewSpotController on _NewSpotBase, Store {
  final _$predictionsAutoCompleteAtom =
      Atom(name: '_NewSpotBase.predictionsAutoComplete');

  @override
  List<PlaceSpot> get predictionsAutoComplete {
    _$predictionsAutoCompleteAtom.context
        .enforceReadPolicy(_$predictionsAutoCompleteAtom);
    _$predictionsAutoCompleteAtom.reportObserved();
    return super.predictionsAutoComplete;
  }

  @override
  set predictionsAutoComplete(List<PlaceSpot> value) {
    _$predictionsAutoCompleteAtom.context.conditionallyRunInAction(() {
      super.predictionsAutoComplete = value;
      _$predictionsAutoCompleteAtom.reportChanged();
    }, _$predictionsAutoCompleteAtom,
        name: '${_$predictionsAutoCompleteAtom.name}_set');
  }

  final _$getCategoriesAsyncAction = AsyncAction('getCategories');

  @override
  Future getCategories() {
    return _$getCategoriesAsyncAction.run(() => super.getCategories());
  }

  final _$getLocationResultsAsyncAction = AsyncAction('getLocationResults');

  @override
  Future getLocationResults(String input) {
    return _$getLocationResultsAsyncAction
        .run(() => super.getLocationResults(input));
  }

  @override
  String toString() {
    final string =
        'predictionsAutoComplete: ${predictionsAutoComplete.toString()}';
    return '{$string}';
  }
}
