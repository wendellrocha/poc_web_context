// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

class UserModel {
  final String id;
  final String name;
  final String email;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  @override
  String toString() => 'UserModel(id: $id, name: $name,'
      ' email: $email)';

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as String,
        name: json['name'] as String,
        email: json['email'] as String,
      );

  factory UserModel.blank() => const UserModel(id: '', name: '', email: '');

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
      };

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! UserModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ email.hashCode;
}
