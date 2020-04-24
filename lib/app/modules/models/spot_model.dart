import 'package:challengesnowman/app/modules/models/user_model.dart';

import 'categories_model.dart';
import 'comment.dart';

class SpotModel {
  final String title;
  final double lat;
  final double long;
  final UserModel user;
  final String photo;
  final CategoriesModel category;
  final String description;
  List<CommentModel> comments;
  String id;
  final String pinColor;
  final double rating;
  final bool isFavorite;

  SpotModel(
      {this.title,
      this.lat,
      this.long,
      this.user,
      this.photo,
      this.category,
      this.description,
      this.comments,
      this.id,
      this.pinColor,
      this.rating,
      this.isFavorite});

  SpotModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        lat = json['lat'],
        long = json['long'],
        user =
            json['user'] != null ? new UserModel.fromJson(json['user']) : null,
        photo = json['photo'],
        category = json['category'] != null
            ? new CategoriesModel.fromJson(json['category'])
            : null,
        description = json['description'],
        comments = getComments(json['comments']),
        id = json['documentID'],
        pinColor = json['pinColor'],
        rating = json['rating'],
        isFavorite = json['isFavorite'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['title'] = this.title;
    data['lat'] = this.lat;
    data['long'] = this.long;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['photo'] = this.photo;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    data['comments'] = this.comments;
    data['id'] = this.id;
    data['rating'] = this.rating;
    data['pinColor'] = this.pinColor;
    data['isFavorite'] = this.isFavorite;
    return data;
  }
}

getComments(comments) {
  List<CommentModel> coments = new List<CommentModel>();
  if (comments != null) {
    comments.forEach((item) {
      CommentModel commentModel = CommentModel.fromJson(item);
      coments.add(commentModel);
    });
    return coments;
  } else {
    return null;
  }
}
