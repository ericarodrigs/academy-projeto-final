import 'dart:convert';

class RecoverPasswordModel {
  final String code;
  final String newPassword;

  RecoverPasswordModel({
    required this.code,
    required this.newPassword,
  });

  RecoverPasswordModel copyWith({
    String? code,
    String? newPassword,
  }) {
    return RecoverPasswordModel(
      code: code ?? this.code,
      newPassword: newPassword ?? this.newPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'newPassword': newPassword,
    };
  }

  factory RecoverPasswordModel.fromMap(Map<String, dynamic> map) {
    return RecoverPasswordModel(
      code: map['code'] ?? '',
      newPassword: map['newPassword'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RecoverPasswordModel.fromJson(String source) =>
      RecoverPasswordModel.fromMap(json.decode(source));

  @override
  bool operator == (Object other) {
    if (identical(this, other)) return true;

    return other is RecoverPasswordModel &&
        other.code == code &&
        other.newPassword == newPassword;
  }

  @override
  int get hashCode =>  code.hashCode ^ newPassword.hashCode;
}
