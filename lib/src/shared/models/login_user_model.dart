import 'dart:convert';

class LoginUserModel {
  final String email;
  final String senha;
  LoginUserModel({
    required this.email,
    required this.senha,
  });

  LoginUserModel copyWith({
    String? email,
    String? senha,
  }) {
    return LoginUserModel(
      email: email ?? this.email,
      senha: senha ?? this.senha,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'senha': senha,
    };
  }

  factory LoginUserModel.fromMap(Map<String, dynamic> map) {
    return LoginUserModel(
      email: map['email'] ?? '',
      senha: map['senha'] ?? '',
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
        other.senha == senha;
  }

  @override
  int get hashCode => email.hashCode ^ senha.hashCode;
}
