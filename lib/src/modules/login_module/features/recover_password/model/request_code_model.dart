import 'dart:convert';

class RequestCodeModel{
  final String email;

  RequestCodeModel({
    required this.email,
  });

  requestCodeModelcopyWith({
    String? email,
  }) {
    return RequestCodeModel(
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
    };
  }

  factory RequestCodeModel.fromMap(Map<String, dynamic> map) {
    return RequestCodeModel(
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestCodeModel.fromJson(String source) =>
      RequestCodeModel.fromMap(json.decode(source));

  @override
  bool operator == (Object other) {
    if (identical(this, other)) return true;

    return other is RequestCodeModel&&
        other.email == email;

  }

  @override
  int get hashCode =>  email.hashCode;
}
