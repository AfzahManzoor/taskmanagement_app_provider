class Task {
  String title;
  String description;

  Task({required this.title, required this.description});

  Map<String, dynamic> toJson() {
    return {'title': title, 'description': description};
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(title: json['title'], description: json['description']);
  }
}
