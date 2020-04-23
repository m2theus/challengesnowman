// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_spot_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewSpotController on _NewSpotBase, Store {
  Computed<bool> _$isImageSelectedComputed;

  @override
  bool get isImageSelected => (_$isImageSelectedComputed ??=
          Computed<bool>(() => super.isImageSelected))
      .value;
  Computed<File> _$imageComputed;

  @override
  File get image =>
      (_$imageComputed ??= Computed<File>(() => super.image)).value;
  Computed<ImageSource> _$imageSourceComputed;

  @override
  ImageSource get imageSource =>
      (_$imageSourceComputed ??= Computed<ImageSource>(() => super.imageSource))
          .value;
  Computed<String> _$imageUrlComputed;

  @override
  String get imageUrl =>
      (_$imageUrlComputed ??= Computed<String>(() => super.imageUrl)).value;

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

  final _$categoriesAtom = Atom(name: '_NewSpotBase.categories');

  @override
  dynamic get categories {
    _$categoriesAtom.context.enforceReadPolicy(_$categoriesAtom);
    _$categoriesAtom.reportObserved();
    return super.categories;
  }

  @override
  set categories(dynamic value) {
    _$categoriesAtom.context.conditionallyRunInAction(() {
      super.categories = value;
      _$categoriesAtom.reportChanged();
    }, _$categoriesAtom, name: '${_$categoriesAtom.name}_set');
  }

  final _$_imageAtom = Atom(name: '_NewSpotBase._image');

  @override
  File get _image {
    _$_imageAtom.context.enforceReadPolicy(_$_imageAtom);
    _$_imageAtom.reportObserved();
    return super._image;
  }

  @override
  set _image(File value) {
    _$_imageAtom.context.conditionallyRunInAction(() {
      super._image = value;
      _$_imageAtom.reportChanged();
    }, _$_imageAtom, name: '${_$_imageAtom.name}_set');
  }

  final _$_imageSourceAtom = Atom(name: '_NewSpotBase._imageSource');

  @override
  ImageSource get _imageSource {
    _$_imageSourceAtom.context.enforceReadPolicy(_$_imageSourceAtom);
    _$_imageSourceAtom.reportObserved();
    return super._imageSource;
  }

  @override
  set _imageSource(ImageSource value) {
    _$_imageSourceAtom.context.conditionallyRunInAction(() {
      super._imageSource = value;
      _$_imageSourceAtom.reportChanged();
    }, _$_imageSourceAtom, name: '${_$_imageSourceAtom.name}_set');
  }

  final _$_imageUrlAtom = Atom(name: '_NewSpotBase._imageUrl');

  @override
  String get _imageUrl {
    _$_imageUrlAtom.context.enforceReadPolicy(_$_imageUrlAtom);
    _$_imageUrlAtom.reportObserved();
    return super._imageUrl;
  }

  @override
  set _imageUrl(String value) {
    _$_imageUrlAtom.context.conditionallyRunInAction(() {
      super._imageUrl = value;
      _$_imageUrlAtom.reportChanged();
    }, _$_imageUrlAtom, name: '${_$_imageUrlAtom.name}_set');
  }

  final _$_imageCounterAtom = Atom(name: '_NewSpotBase._imageCounter');

  @override
  int get _imageCounter {
    _$_imageCounterAtom.context.enforceReadPolicy(_$_imageCounterAtom);
    _$_imageCounterAtom.reportObserved();
    return super._imageCounter;
  }

  @override
  set _imageCounter(int value) {
    _$_imageCounterAtom.context.conditionallyRunInAction(() {
      super._imageCounter = value;
      _$_imageCounterAtom.reportChanged();
    }, _$_imageCounterAtom, name: '${_$_imageCounterAtom.name}_set');
  }

  final _$_isImageSelectedAtom = Atom(name: '_NewSpotBase._isImageSelected');

  @override
  bool get _isImageSelected {
    _$_isImageSelectedAtom.context.enforceReadPolicy(_$_isImageSelectedAtom);
    _$_isImageSelectedAtom.reportObserved();
    return super._isImageSelected;
  }

  @override
  set _isImageSelected(bool value) {
    _$_isImageSelectedAtom.context.conditionallyRunInAction(() {
      super._isImageSelected = value;
      _$_isImageSelectedAtom.reportChanged();
    }, _$_isImageSelectedAtom, name: '${_$_isImageSelectedAtom.name}_set');
  }

  final _$isLoadingAtom = Atom(name: '_NewSpotBase.isLoading');

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

  final _$addSpotAsyncAction = AsyncAction('addSpot');

  @override
  Future addSpot(PlaceSpot placeSpot, SpotModel spotModel) {
    return _$addSpotAsyncAction.run(() => super.addSpot(placeSpot, spotModel));
  }

  final _$_NewSpotBaseActionController = ActionController(name: '_NewSpotBase');

  @override
  dynamic setIsImageSelected(bool value) {
    final _$actionInfo = _$_NewSpotBaseActionController.startAction();
    try {
      return super.setIsImageSelected(value);
    } finally {
      _$_NewSpotBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setImageSource(ImageSource source) {
    final _$actionInfo = _$_NewSpotBaseActionController.startAction();
    try {
      return super.setImageSource(source);
    } finally {
      _$_NewSpotBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setImage(File image) {
    final _$actionInfo = _$_NewSpotBaseActionController.startAction();
    try {
      return super.setImage(image);
    } finally {
      _$_NewSpotBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setImageUrl(String imageUrl) {
    final _$actionInfo = _$_NewSpotBaseActionController.startAction();
    try {
      return super.setImageUrl(imageUrl);
    } finally {
      _$_NewSpotBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'predictionsAutoComplete: ${predictionsAutoComplete.toString()},categories: ${categories.toString()},isLoading: ${isLoading.toString()},isImageSelected: ${isImageSelected.toString()},image: ${image.toString()},imageSource: ${imageSource.toString()},imageUrl: ${imageUrl.toString()}';
    return '{$string}';
  }
}
