import 'package:challengesnowman/app/modules/login/components/toast.dart';
import 'package:challengesnowman/app/modules/tabs/map/components/spot/models/model_spot_place.dart';
import 'package:challengesnowman/app/services/firebase_provider.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

part 'new_spot_controller.g.dart';

class NewSpotController = _NewSpotBase with _$NewSpotController;

abstract class _NewSpotBase with Store {
  var kGoogleApiKey = "AIzaSyBphpLKL7zrQ9L6qSnjZ1LPph7GHA5Vn2o";
  final fireStoreProvider = FirebaseProvider();

  @observable
  List<PlaceSpot> predictionsAutoComplete = [];
  var categories;

  @action
  getCategories() async {
    try {
      await fireStoreProvider.getCategories().then((values) {
        categories = values;
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
    String type = '(regions)';

    String request = '$baseURL?input=$input&key=$kGoogleApiKey&type=$type';
    Response response = await Dio().get(request);
    final predictions = response.data['predictions'];
    for (var i = 0; i < predictions.length; i++) {
      predictionsAutoComplete.add(PlaceSpot.fromJson(predictions[i]));
    }
    return predictionsAutoComplete;
  }

  getDetailsPlace(placeId) async {
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/details/json';

    String request = '$baseURL?key=$kGoogleApiKey&place_id=$placeId';
    Response response = await Dio().get(request);
    final predictions = response.data['predictions'];

    for (var i = 0; i < predictions.length; i++) {
      String name = predictions[i]['description'];
    }
  }
}
