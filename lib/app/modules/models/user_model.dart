class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String photoUrl;
  final String uid;
  final bool isAnonymous;

  UserModel(
      {this.id,
      this.fullName,
      this.email,
      this.photoUrl,
      this.uid,
      this.isAnonymous});

  UserModel.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        email = data['email'],
        photoUrl = data['photoUrl'],
        uid = data['uid'],
        isAnonymous = data['isAnonymous'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'photoUrl': photoUrl,
      'uid': uid,
      'isAnonymous': isAnonymous,
    };
  }
}
