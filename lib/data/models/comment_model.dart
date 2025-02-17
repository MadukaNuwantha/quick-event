import 'dart:convert';

import 'package:app/core/utils/typedef.dart';
import 'package:app/domain/entities/comment_entity.dart';

class CommentModel extends CommentEntity {
  const CommentModel({
    required super.id,
    required super.userId,
    required super.title,
    required super.body,
  });

  const CommentModel.empty()
      : this(
          id: '_empty.string_',
          userId: '_empty.string_',
          title: '_empty.string_',
          body: '_empty.string_',
        );

  CommentModel.fromMap(DataMap map)
      : this(
          id: map['id'] as String,
          userId: map['userId'] as String,
          title: map['title'] as String,
          body: map['body'] as String,
        );

  factory CommentModel.fromJson(String source) => CommentModel.fromMap(jsonDecode(source) as DataMap);

  CommentModel copyWith({
    String? id,
    String? userId,
    String? title,
    String? body,
  }) {
    return CommentModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  DataMap toMap() => {
        'id': id,
        'userId': userId,
        'title': title,
        'body': body,
      };

  String toJson() => jsonEncode(toMap());
}
