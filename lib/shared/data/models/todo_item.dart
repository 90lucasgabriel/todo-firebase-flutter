import 'dart:convert';

class ToDoItem {
  ToDoItem({
    required this.id,
    required this.title,
    this.state = false,
  });

  final String id;
  final String title;
  final bool state;

  ToDoItem copyWith({
    String? id,
    String? title,
    bool? state,
  }) {
    return ToDoItem(
      id: id ?? this.id,
      title: title ?? this.title,
      state: state ?? this.state,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isDone': state,
    };
  }

  factory ToDoItem.fromMap(Map<String, dynamic> map) {
    return ToDoItem(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      state: map['state'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ToDoItem.fromJson(String source) =>
      ToDoItem.fromMap(json.decode(source));

  @override
  String toString() => 'ToDoItem(id: $id, title: $title, state: $state)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ToDoItem &&
        other.id == id &&
        other.title == title &&
        other.state == state;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ state.hashCode;
}
