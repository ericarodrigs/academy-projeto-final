import 'dart:convert';

import 'package:flutter/foundation.dart';

class VideoModel {
  final String id;
  final String name;
  final String url;
  final String thumbUrl;
  final String description;
  final String createdAt;
  final String duration;
  final String publicationDate;
  final String topic;
  final List<String> tags;

  VideoModel({
    required this.id,
    required this.name,
    required this.url,
    required this.thumbUrl,
    required this.description,
    required this.createdAt,
    required this.duration,
    required this.publicationDate,
    required this.topic,
    required this.tags,
  });

  VideoModel copyWith({
    String? id,
    String? name,
    String? url,
    String? thumbUrl,
    String? description,
    String? createdAt,
    String? duration,
    String? publicationDate,
    String? topic,
    List<String>? tags,
  }) {
    return VideoModel(
      id: id ?? this.id,
      name: name ?? this.name,
      url: url ?? this.url,
      thumbUrl: thumbUrl ?? this.thumbUrl,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      duration: duration ?? this.duration,
      publicationDate: publicationDate ?? this.publicationDate,
      topic: topic ?? this.topic,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': name,
      'url': url,
      'thumbUrl': thumbUrl,
      'descricao': description,
      'createdAt': createdAt,
      'duracao': duration,
      'dataPublicacao': publicationDate,
      'topico': topic,
      'tags': tags,
    };
  }

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      id: map['id'] ?? '',
      name: map['nome'] ?? '',
      url: map['url'] ?? '',
      thumbUrl: map['thumbUrl'] ?? '',
      description: map['descricao'] ?? '',
      createdAt: map['createdAt'] ?? '',
      duration: map['duracao'] ?? '',
      publicationDate: map['dataPublicacao'] ?? '',
      topic: map['topico'] ?? '',
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
        other.name == name &&
        other.url == url &&
        other.thumbUrl == thumbUrl &&
        other.description == description &&
        other.createdAt == createdAt &&
        other.duration == duration &&
        other.publicationDate == publicationDate &&
        other.topic == topic &&
        listEquals(other.tags, tags);
  }

  @override
  int get hashCode {
    return id.hashCode ^
    name.hashCode ^
    url.hashCode ^
    thumbUrl.hashCode ^
    description.hashCode ^
    createdAt.hashCode ^
    duration.hashCode ^
    publicationDate.hashCode ^
    topic.hashCode ^
    tags.hashCode;
  }
  @override
  String toString() {
    return 'nome: $name    ';
  }
}
