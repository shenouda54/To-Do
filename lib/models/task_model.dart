class TaskModel {
  String title;
  String description;
  String id;
  int date;
  bool isDone;
  String userId;

  TaskModel({
    required this.title,
    required this.description,
    this.id = '',
    required this.date,
    required this.userId,
    this.isDone = false,
  });

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          title: json['title'],
          description: json['description'],
          date: json['date'],
          isDone: json['isDone'],
          userId: json['userID'],
          id: json['id'],
        );

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "date": date,
      "isDone": isDone,
      "userID": userId,
      "id": id,
    };
  }
}
