import 'dart:convert';

class LoginUserModel {
  final String email;
  final String password;
  LoginUserModel({
    required this.email,
    required this.password,
  });

  LoginUserModel copyWith({
    String? email,
    String? password,
  }) {
    return LoginUserModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory LoginUserModel.fromMap(Map<String, dynamic> map) {
    return LoginUserModel(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginUserModel.fromJson(String source) =>
      LoginUserModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginUserModel &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
