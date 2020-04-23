import 'package:challengesnowman/app/modules/models/categories_model.dart';
import 'package:challengesnowman/app/modules/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseProvider {
  Firestore _database = Firestore.instance;

  Firestore get database => _database;

  void addUser(UserModel user) async {
    await _database
        .collection('users')
        .document(user.email)
        .setData(user.toJson());
  }

  void updateUser({UserModel user, var uid}) async {
    _database.document('users/$uid').updateData(user.toJson());
  }

  Future<List<CategoriesModel>> getCategories() async {
    List<CategoriesModel> listCategorias = new List();
    await _database.collection('categories').getDocuments().then((values) {
      List<DocumentSnapshot> list = values.documents;

      for (int i = 0; i < list.length; i++) {
        listCategorias.add(CategoriesModel.fromJson(list[i].data));
      }
    });
    return listCategorias;
  }
}
