class CommentModel {
  final String comment;
  final String user;
  final String rating;

  CommentModel({
    this.comment,
    this.user,
    this.rating,
  });

  CommentModel.fromJson(Map<String, dynamic> data)
      : comment = data['comment'],
        user = data['user'],
        rating = data['rating'];

  Map<String, dynamic> toJson() {
    return {
      'comment': comment,
      'user': user,
      'rating': rating,
    };
  }
}
