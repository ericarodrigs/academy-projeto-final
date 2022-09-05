import 'dart:convert';

class RegisterUserModel {
  final String name;
  final String email;
  final String password;
  final String accessCode;

  RegisterUserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.accessCode,
  });

  RegisterUserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? accessCode,
  }) {
    return RegisterUserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      accessCode: accessCode ?? this.accessCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': name,
      'email': email,
      'senha': password,
      'codigoAcesso': accessCode,
    };
  }

  factory RegisterUserModel.fromMap(Map<String, dynamic> map) {
    return RegisterUserModel(
      name: map['nome'] ?? '',
      email: map['email'] ?? '',
      password: map['senha'] ?? '',
      accessCode: map['codigoAcesso'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterUserModel.fromJson(String source) =>
      RegisterUserModel.fromMap(json.decode(source));

  @override
  bool operator == (Object other) {
    if (identical(this, other)) return true;

    return other is RegisterUserModel &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.accessCode == accessCode;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ password.hashCode ^ accessCode.hashCode;
}
