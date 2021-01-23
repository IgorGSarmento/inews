class News {
  int id;
  String title;
  String body;

  News(int id, String title, String body) {
    this.id = id;
    this.title = title;
    this.body = body;
  }

  News.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        body = json['body'];

  Map toJson() {
    return {'id': id, 'title': title, 'body': body};
  }
}
