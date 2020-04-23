import 'dart:io';

import 'package:challengesnowman/app/modules/login/components/toast.dart';
import 'package:challengesnowman/app/modules/models/categories_model.dart';
import 'package:challengesnowman/app/modules/models/spot_model.dart';
import 'package:challengesnowman/app/modules/models/user_model.dart';
import 'package:challengesnowman/app/modules/tabs/map/components/spot/models/model_spot_place.dart';
import 'package:challengesnowman/app/services/firebase_provider.dart';
import 'package:challengesnowman/app/services/shared_preferences_service.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'new_spot_controller.g.dart';

class NewSpotController = _NewSpotBase with _$NewSpotController;

abstract class _NewSpotBase with Store {
  var kGoogleApiKey = "AIzaSyBphpLKL7zrQ9L6qSnjZ1LPph7GHA5Vn2o";
  final fireStoreProvider = FirebaseProvider();

  @observable
  List<PlaceSpot> predictionsAutoComplete = [];

  @observable
  var categories;

  @observable
  File _image;

  @observable
  ImageSource _imageSource;

  @observable
  String _imageUrl;

  @observable
  int _imageCounter = 0;

  @observable
  bool _isImageSelected = false;

  @observable
  bool isLoading = false;

  @computed
  bool get isImageSelected => _isImageSelected;

  @computed
  File get image => _image;

  @computed
  ImageSource get imageSource => _imageSource;

  @computed
  String get imageUrl => _imageUrl;

  @action
  setIsImageSelected(bool value) {
    _isImageSelected = value;
  }

  @action
  setImageSource(ImageSource source) {
    _imageSource = source;
  }

  @action
  setImage(File image) {
    _image = image;
    setIsImageSelected(true);
  }

  @action
  setImageUrl(String imageUrl) {
    _imageUrl = imageUrl;
  }

  uploadImage({File image}) async {
    StorageReference reference = FirebaseStorage.instance
        .ref()
        .child('spotPictures/${image.path + DateTime.now().toIso8601String()}');
    StorageUploadTask uploadTask = reference.putFile(image);
    await uploadTask.onComplete;
    await reference.getDownloadURL().then((value) => setImageUrl(value));
  }

  @action
  getCategories() async {
    try {
      await fireStoreProvider.getCategories().then((values) {
        if (values == null || values.length == 0) {
          fireStoreProvider.addCategories(CategoriesModel(name: "Park"));
          fireStoreProvider.addCategories(CategoriesModel(name: "Museum"));
          fireStoreProvider.addCategories(CategoriesModel(name: "Theater"));
          fireStoreProvider.addCategories(CategoriesModel(name: "Monument"));
          getCategories();
        } else {
          categories = values;
        }
      });
    } catch (e) {
      Toast("Erro ao buscar categorias", e, "falha").getSnack();
    }
  }

  @action
  getLocationResults(String input) async {
    predictionsAutoComplete = [];
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String type = '(cities)';

    String request = '$baseURL?input=$input&key=$kGoogleApiKey';
    Response response = await Dio().get(request);
    final predictions = response.data['predictions'];
    for (var i = 0; i < predictions.length; i++) {
      predictionsAutoComplete.add(PlaceSpot.fromJson(predictions[i]));
    }
    return predictionsAutoComplete;
  }

  getDetailsPlace(placeId) async {
    try {
      String baseURL =
          'https://maps.googleapis.com/maps/api/place/details/json';
      String request = '$baseURL?key=$kGoogleApiKey&place_id=$placeId';
      Response response = await Dio().get(request);
      return response;
    } catch (e) {
      Toast("Erro ao buscar place", e, "falha").getSnack();
    }
  }

  @action
  addSpot(PlaceSpot placeSpot, SpotModel spotModel) async {
    try {
      isLoading = true;
      getDetailsPlace(placeSpot.placeId).then((value) async {
        var lat = value.data["result"]["geometry"]["location"]["lat"];
        var long = value.data["result"]["geometry"]["location"]["lng"];
        UserModel userModel = sharedPreferences.getUser();

        if (_image != null) {
          await uploadImage(image: _image);
        }

        SpotModel model = new SpotModel(
            lat: lat,
            long: long,
            description: placeSpot.description,
            category: spotModel.category,
            pinColor: spotModel.pinColor,
            title: spotModel.title,
            photo: _imageUrl,
            user: userModel);
        fireStoreProvider.addSpot(model);

        _isImageSelected = false;
        _imageUrl = null;
        isLoading = false;
        Get.offNamed('/home/map');
      });
    } catch (e) {
      isLoading = false;
      Toast("Erro ao adicionar spot", e, "falha").getSnack();
    }
  }
}
