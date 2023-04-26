import 'package:collection/collection.dart';

class TodoModel {
  final bool? completed;
  final int? id;
  final String? todo;
  final int? userId;

  const TodoModel({this.completed, this.id, this.todo, this.userId});

  @override
  String toString() {
    return 'TodoModel(completed: $completed, id: $id, todo: $todo, userId: $userId)';
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        completed: json['completed'] as bool?,
        id: json['id'] as int?,
        todo: json['todo'] as String?,
        userId: json['userId'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'completed': completed,
        'id': id,
        'todo': todo,
        'userId': userId,
      };

  TodoModel copyWith({
    bool? completed,
    int? id,
    String? todo,
    int? userId,
  }) {
    return TodoModel(
      completed: completed ?? this.completed,
      id: id ?? this.id,
      todo: todo ?? this.todo,
      userId: userId ?? this.userId,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! TodoModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      completed.hashCode ^ id.hashCode ^ todo.hashCode ^ userId.hashCode;
}
