class PostModel {
  String? title;
  String? body;
  String? id;
  String? userId;

  PostModel({this.title, this.body, this.id, this.userId});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel()
      ..title = json['title'] as String?
      ..body = json['body'] as String?
      ..id = json['id'].toString()
      ..userId = json['userId'].toString();
  }
  Map<String, dynamic> toJson() => {'id': id, 'title': title, 'body': body};
}
