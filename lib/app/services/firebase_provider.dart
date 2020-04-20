import 'package:challengesnowman/app/modules/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseProvider {
  Firestore _database = Firestore.instance;

  Firestore get database => _database;

  void addUser(UserModel user) async {
    await _database.collection('users').document(user.email).setData(user.toJson());
  }

  void updateUser({UserModel user, var uid}) async {
    _database.document('users/$uid').updateData(user.toJson());
  }

  void removeSpot(String path) async {
    await _database.collection('spots').document(path).delete();
  }
}
