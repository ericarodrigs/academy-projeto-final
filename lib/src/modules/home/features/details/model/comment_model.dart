import 'dart:convert';

import 'package:rarovideowall/src/shared/models/user_model.dart';

class CommentModel {
  final String id;
  final String text;
  final bool edited;
  final String createdAt;
  final UserModel student;
  int upVotes;
  int downVotes;

  CommentModel({
    required this.id,
    required this.text,
    required this.edited,
    required this.createdAt,
    required this.student,
    required this.upVotes,
    required this.downVotes,
  });

  CommentModel copyWith({
    String? id,
    String? text,
    bool? edited,
    String? createdAt,
    UserModel? student,
    int? upVotes,
    int? downVotes,
  }) {
    return CommentModel(
      id: id ?? this.id,
      text: text ?? this.text,
      edited: edited ?? this.edited,
      createdAt: createdAt ?? this.createdAt,
      student: student ?? this.student,
      upVotes: upVotes ?? this.upVotes,
      downVotes: downVotes ?? this.downVotes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'texto': text,
      'editado': edited,
      'createdAt': createdAt,
      'aluno': student.toMap(),
      'upVotes': upVotes,
      'downVotes': downVotes,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      id: map['id'] ?? '',
      text: map['texto'] ?? '',
      edited: map['editado'] ?? false,
      createdAt: map['createdAt'] ?? '',
      student: UserModel.fromMap(map['aluno'] ?? {}),
      upVotes: map['upVotes']?.toInt() ?? 0,
      downVotes: map['downVotes']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) =>
      CommentModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CommentModel(id: $id, texto: $text, editado: $edited, createdAt: $createdAt, aluno: $student, upVotes: $upVotes, downVotes: $downVotes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CommentModel &&
        other.id == id &&
        other.text == text &&
        other.edited == edited &&
        other.createdAt == createdAt &&
        other.student == student &&
        other.upVotes == upVotes &&
        other.downVotes == downVotes;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        text.hashCode ^
        edited.hashCode ^
        createdAt.hashCode ^
        student.hashCode ^
        upVotes.hashCode ^
        downVotes.hashCode;
  }
}
