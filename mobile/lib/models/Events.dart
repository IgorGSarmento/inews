class Events {
  int id;
  String title;
  String description;
  String date;
  String time;
  String address;

  Events(int id, String title, String description, String date, String time,
      String address) {
    this.id = id;
    this.title = title;
    this.description = description;
    this.date = date;
    this.time = time;
    this.address = address;
  }

  Events.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        date = json['date'],
        time = json['time'],
        address = json['address'];

  Map toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'time': time,
      'address': address
    };
  }
}
