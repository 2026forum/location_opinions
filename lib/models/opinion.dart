import 'dart:convert';

import 'package:flutter/foundation.dart';

class Opinion {
  final String text;
  final String id;
  final String author;
  final String authorId;
  final List<String> upVotes;
  final List<String> downVotes;
  final DateTime createdAt;
  Opinion({
    required this.text,
    required this.id,
    required this.author,
    required this.authorId,
    required this.upVotes,
    required this.downVotes,
    required this.createdAt,
  });


  Opinion copyWith({
    String? text,
    String? id,
    String? author,
    String? authorId,
    List<String>? upVotes,
    List<String>? downVotes,
    DateTime? createdAt,
  }) {
    return Opinion(
      text: text ?? this.text,
      id: id ?? this.id,
      author: author ?? this.author,
      authorId: authorId ?? this.authorId,
      upVotes: upVotes ?? this.upVotes,
      downVotes: downVotes ?? this.downVotes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'id': id,
      'author': author,
      'authorId': authorId,
      'upVotes': upVotes,
      'downVotes': downVotes,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Opinion.fromMap(Map<String, dynamic> map) {
    return Opinion(
      text: map['text'] ?? '',
      id: map['id'] ?? '',
      author: map['author'] ?? '',
      authorId: map['authorId'] ?? '',
      upVotes: List<String>.from(map['upVotes']),
      downVotes: List<String>.from(map['downVotes']),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Opinion.fromJson(String source) => Opinion.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Opinion(text: $text, id: $id, author: $author, authorId: $authorId, upVotes: $upVotes, downVotes: $downVotes, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Opinion &&
      other.text == text &&
      other.id == id &&
      other.author == author &&
      other.authorId == authorId &&
      listEquals(other.upVotes, upVotes) &&
      listEquals(other.downVotes, downVotes) &&
      other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return text.hashCode ^
      id.hashCode ^
      author.hashCode ^
      authorId.hashCode ^
      upVotes.hashCode ^
      downVotes.hashCode ^
      createdAt.hashCode;
  }
}

class Topic {
  final String text;
  final String id;
  final String author;
  final String authorId;
  final List<String> upVotes;
  final List<String> downVotes;
  final DateTime createdAt;
  Topic({
    required this.text,
    required this.id,
    required this.author,
    required this.authorId,
    required this.upVotes,
    required this.downVotes,
    required this.createdAt,
  });


  int get totalVotes => upVotes.length + downVotes.length;
  

  Topic copyWith({
    String? text,
    String? id,
    String? author,
    String? authorId,
    List<String>? upVotes,
    List<String>? downVotes,
    DateTime? createdAt,
  }) {
    return Topic(
      text: text ?? this.text,
      id: id ?? this.id,
      author: author ?? this.author,
      authorId: authorId ?? this.authorId,
      upVotes: upVotes ?? this.upVotes,
      downVotes: downVotes ?? this.downVotes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'id': id,
      'author': author,
      'authorId': authorId,
      'upVotes': upVotes,
      'downVotes': downVotes,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Topic.fromMap(Map<String, dynamic> map) {
    return Topic(
      text: map['text'] ?? '',
      id: map['id'] ?? '',
      author: map['author'] ?? '',
      authorId: map['authorId'] ?? '',
      upVotes: List<String>.from(map['upVotes']),
      downVotes: List<String>.from(map['downVotes']),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  }






  




