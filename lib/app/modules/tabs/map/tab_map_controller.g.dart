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

  final _$markerIdSelectedAtom = Atom(name: '_TabMapBase.markerIdSelected');

  @override
  String get markerIdSelected {
    _$markerIdSelectedAtom.context.enforceReadPolicy(_$markerIdSelectedAtom);
    _$markerIdSelectedAtom.reportObserved();
    return super.markerIdSelected;
  }

  @override
  set markerIdSelected(String value) {
    _$markerIdSelectedAtom.context.conditionallyRunInAction(() {
      super.markerIdSelected = value;
      _$markerIdSelectedAtom.reportChanged();
    }, _$markerIdSelectedAtom, name: '${_$markerIdSelectedAtom.name}_set');
  }

  final _$listMarkersAtom = Atom(name: '_TabMapBase.listMarkers');

  @override
  Set<Marker> get listMarkers {
    _$listMarkersAtom.context.enforceReadPolicy(_$listMarkersAtom);
    _$listMarkersAtom.reportObserved();
    return super.listMarkers;
  }

  @override
  set listMarkers(Set<Marker> value) {
    _$listMarkersAtom.context.conditionallyRunInAction(() {
      super.listMarkers = value;
      _$listMarkersAtom.reportChanged();
    }, _$listMarkersAtom, name: '${_$listMarkersAtom.name}_set');
  }

  final _$listSpotsAtom = Atom(name: '_TabMapBase.listSpots');

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

  final _$_mapControllerAtom = Atom(name: '_TabMapBase._mapController');

  @override
  GoogleMapController get _mapController {
    _$_mapControllerAtom.context.enforceReadPolicy(_$_mapControllerAtom);
    _$_mapControllerAtom.reportObserved();
    return super._mapController;
  }

  @override
  set _mapController(GoogleMapController value) {
    _$_mapControllerAtom.context.conditionallyRunInAction(() {
      super._mapController = value;
      _$_mapControllerAtom.reportChanged();
    }, _$_mapControllerAtom, name: '${_$_mapControllerAtom.name}_set');
  }

  final _$showScrollableBottomAtom =
      Atom(name: '_TabMapBase.showScrollableBottom');

  @override
  bool get showScrollableBottom {
    _$showScrollableBottomAtom.context
        .enforceReadPolicy(_$showScrollableBottomAtom);
    _$showScrollableBottomAtom.reportObserved();
    return super.showScrollableBottom;
  }

  @override
  set showScrollableBottom(bool value) {
    _$showScrollableBottomAtom.context.conditionallyRunInAction(() {
      super.showScrollableBottom = value;
      _$showScrollableBottomAtom.reportChanged();
    }, _$showScrollableBottomAtom,
        name: '${_$showScrollableBottomAtom.name}_set');
  }

  final _$positionAtualAtom = Atom(name: '_TabMapBase.positionAtual');

  @override
  LatLng get positionAtual {
    _$positionAtualAtom.context.enforceReadPolicy(_$positionAtualAtom);
    _$positionAtualAtom.reportObserved();
    return super.positionAtual;
  }

  @override
  set positionAtual(LatLng value) {
    _$positionAtualAtom.context.conditionallyRunInAction(() {
      super.positionAtual = value;
      _$positionAtualAtom.reportChanged();
    }, _$positionAtualAtom, name: '${_$positionAtualAtom.name}_set');
  }

  final _$getSpotsByDescAsyncAction = AsyncAction('getSpotsByDesc');

  @override
  Future getSpotsByDesc(String desc) {
    return _$getSpotsByDescAsyncAction.run(() => super.getSpotsByDesc(desc));
  }

  final _$populateSpotsAsyncAction = AsyncAction('populateSpots');

  @override
  Future populateSpots() {
    return _$populateSpotsAsyncAction.run(() => super.populateSpots());
  }

  final _$_TabMapBaseActionController = ActionController(name: '_TabMapBase');

  @override
  dynamic setMapController(GoogleMapController controller) {
    final _$actionInfo = _$_TabMapBaseActionController.startAction();
    try {
      return super.setMapController(controller);
    } finally {
      _$_TabMapBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setShowScrollableButton(dynamic value) {
    final _$actionInfo = _$_TabMapBaseActionController.startAction();
    try {
      return super.setShowScrollableButton(value);
    } finally {
      _$_TabMapBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic movePosition(dynamic lat, dynamic long) {
    final _$actionInfo = _$_TabMapBaseActionController.startAction();
    try {
      return super.movePosition(lat, long);
    } finally {
      _$_TabMapBaseActionController.endAction(_$actionInfo);
    }
  }

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
  dynamic setMarkers(dynamic markers) {
    final _$actionInfo = _$_TabMapBaseActionController.startAction();
    try {
      return super.setMarkers(markers);
    } finally {
      _$_TabMapBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'isLoading: ${isLoading.toString()},markerIdSelected: ${markerIdSelected.toString()},listMarkers: ${listMarkers.toString()},listSpots: ${listSpots.toString()},showScrollableBottom: ${showScrollableBottom.toString()},positionAtual: ${positionAtual.toString()}';
    return '{$string}';
  }
}
