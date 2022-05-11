// ignore_for_file: file_names

class Lesson {
  final String name;
  final int done;

  Lesson({
    required this.name,
    required this.done,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'done': done,
    };
  }

  factory Lesson.fromMap(Map<String, dynamic> map) {
    return Lesson(
      name: map['name'] ?? '',
      done: map['done']?.toInt() ?? 0,
    );
  }

  @override
  String toString() {
    return 'Lesson(name: $name, done: $done)';
  }
}
