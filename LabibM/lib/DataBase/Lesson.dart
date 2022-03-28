class Lesson {
  final int? id;
  final String name;
  final int done;

  Lesson({
    this.id,
    required this.name,
    required this.done,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'done': done,
    };
  }

  factory Lesson.fromMap(Map<String, dynamic> map) {
    return Lesson(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      done: map['done']?.toInt() ?? 0,
    );
  }

  @override
  String toString() {
    return 'Lesson(id: $id, name: $name, done: $done)';
  }
}
