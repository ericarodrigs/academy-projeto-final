import 'dart:convert';

import 'package:flutter/foundation.dart';

class VideoModel {
  final String id;
  final String nome;
  final String url;
  final String thumbUrl;
  final String descricao;
  final String createdAt;
  final String duracao;
  final String dataPublicacao;
  final String topico;
  final List<String> tags;

  VideoModel({
    required this.id,
    required this.nome,
    required this.url,
    required this.thumbUrl,
    required this.descricao,
    required this.createdAt,
    required this.duracao,
    required this.dataPublicacao,
    required this.topico,
    required this.tags,
  });

  VideoModel copyWith({
    String? id,
    String? nome,
    String? url,
    String? thumbUrl,
    String? descricao,
    String? createdAt,
    String? duracao,
    String? dataPublicacao,
    String? topico,
    List<String>? tags,
  }) {
    return VideoModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      url: url ?? this.url,
      thumbUrl: thumbUrl ?? this.thumbUrl,
      descricao: descricao ?? this.descricao,
      createdAt: createdAt ?? this.createdAt,
      duracao: duracao ?? this.duracao,
      dataPublicacao: dataPublicacao ?? this.dataPublicacao,
      topico: topico ?? this.topico,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'url': url,
      'thumbUrl': thumbUrl,
      'descricao': descricao,
      'createdAt': createdAt,
      'duracao': duracao,
      'dataPublicacao': dataPublicacao,
      'topico': topico,
      'tags': tags,
    };
  }

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      id: map['id'] ?? '',
      nome: map['nome'] ?? '',
      url: map['url'] ?? '',
      thumbUrl: map['thumbUrl'] ?? '',
      descricao: map['descricao'] ?? '',
      createdAt: map['createdAt'] ?? '',
      duracao: map['duracao'] ?? '',
      dataPublicacao: map['dataPublicacao'] ?? '',
      topico: map['topico'] ?? '',
      tags: List<String>.from(map['tags']),
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoModel.fromJson(String source) =>
      VideoModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VideoModel &&
        other.id == id &&
        other.nome == nome &&
        other.url == url &&
        other.thumbUrl == thumbUrl &&
        other.descricao == descricao &&
        other.createdAt == createdAt &&
        other.duracao == duracao &&
        other.dataPublicacao == dataPublicacao &&
        other.topico == topico &&
        listEquals(other.tags, tags);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nome.hashCode ^
        url.hashCode ^
        thumbUrl.hashCode ^
        descricao.hashCode ^
        createdAt.hashCode ^
        duracao.hashCode ^
        dataPublicacao.hashCode ^
        topico.hashCode ^
        tags.hashCode;
  }
}
