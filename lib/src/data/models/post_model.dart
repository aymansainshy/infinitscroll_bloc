class Post {
  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
    this.isFavorite = false,
  });

  int userId;
  int id;
  String title;
  String body;
  bool isFavorite;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };

  void toggleFavorite() {
    // var oldStatus = isFavorite;
    // try {
    isFavorite = !isFavorite;
    // await Future.delayed(Duration(milliseconds: 500), () {
    //   print("Favorite Done ..");
    //   throw Exception();
    // });
    // } catch (e) {
    //   isFavorite = oldStatus;
    //   throw Exception();
    // }
  }
}
