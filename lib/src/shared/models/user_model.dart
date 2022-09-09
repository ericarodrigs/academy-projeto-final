import 'dart:convert';

class UserModel {
  final String accessToken;
  final String name;
  final bool admin;
  final String photo;
  final String id;

  UserModel({
    required this.accessToken,
    required this.name,
    required this.admin,
    required this.photo,
    required this.id,
  });

  UserModel copyWith({
    String? accessToken,
    String? name,
    bool? admin,
    String? photo,
    String? id,
  }) {
    return UserModel(
      accessToken: accessToken ?? this.accessToken,
      name: name ?? this.name,
      admin: admin ?? this.admin,
      photo: photo ?? this.photo,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'access_token': accessToken,
      'nome': name,
      'admin': admin,
      'foto': photo,
      'id': id,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      accessToken: map['access_token'] ?? '',
      name: map['nome'] ?? '',
      admin: map['admin'] ?? false,
      photo: map['foto'] ?? '',
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(accessToken: $accessToken, name: $name, admin: $admin, foto: $photo, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.accessToken == accessToken &&
        other.name == name &&
        other.admin == admin &&
        other.photo == photo &&
        other.id == id;
  }

  @override
  int get hashCode {
    return accessToken.hashCode ^
        name.hashCode ^
        admin.hashCode ^
        photo.hashCode ^
        id.hashCode;
  }
}
