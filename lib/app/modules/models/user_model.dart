class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String photoUrl;
  final String uid;

  UserModel({this.id, this.fullName, this.email, this.photoUrl, this.uid});

  UserModel.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        email = data['email'],
        photoUrl = data['photoUrl'],
        uid = data['uid'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'photoUrl': photoUrl,
      'uid': uid,
    };
  }
}
