import 'dart:convert';

import 'package:rarovideowall/src/shared/models/user_model.dart';

class CommentModel {
  final String id;
  final String texto;
  final bool editado;
  final String createdAt;
  final UserModel aluno;
  final int upVotes;
  final int downVotes;

  CommentModel({
    required this.id,
    required this.texto,
    required this.editado,
    required this.createdAt,
    required this.aluno,
    required this.upVotes,
    required this.downVotes,
  });

  CommentModel copyWith({
    String? id,
    String? texto,
    bool? editado,
    String? createdAt,
    UserModel? aluno,
    int? upVotes,
    int? downVotes,
  }) {
    return CommentModel(
      id: id ?? this.id,
      texto: texto ?? this.texto,
      editado: editado ?? this.editado,
      createdAt: createdAt ?? this.createdAt,
      aluno: aluno ?? this.aluno,
      upVotes: upVotes ?? this.upVotes,
      downVotes: downVotes ?? this.downVotes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'texto': texto,
      'editado': editado,
      'createdAt': createdAt,
      'aluno': aluno.toMap(),
      'upVotes': upVotes,
      'downVotes': downVotes,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      id: map['id'] ?? '',
      texto: map['texto'] ?? '',
      editado: map['editado'] ?? false,
      createdAt: map['createdAt'] ?? '',
      aluno: UserModel.fromMap(map['aluno']),
      upVotes: map['upVotes']?.toInt() ?? 0,
      downVotes: map['downVotes']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) =>
      CommentModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CommentModel(id: $id, texto: $texto, editado: $editado, createdAt: $createdAt, aluno: $aluno, upVotes: $upVotes, downVotes: $downVotes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CommentModel &&
        other.id == id &&
        other.texto == texto &&
        other.editado == editado &&
        other.createdAt == createdAt &&
        other.aluno == aluno &&
        other.upVotes == upVotes &&
        other.downVotes == downVotes;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        texto.hashCode ^
        editado.hashCode ^
        createdAt.hashCode ^
        aluno.hashCode ^
        upVotes.hashCode ^
        downVotes.hashCode;
  }
}
