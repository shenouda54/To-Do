class TaskModel {
  String title;
  String description;
  String id;
  int date;
  bool isDone;

  TaskModel({
    required this.title,
    required this.description,
    this.id = '',
    required this.date,
    this.isDone = false,
  });

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          title: json['title'],
          description: json['description'],
          date: json['date'],
          isDone: json['isDone'],
          id: json['id'],
        );

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "date": date,
      "isDone": isDone,
      "id": id,
    };
  }
}
