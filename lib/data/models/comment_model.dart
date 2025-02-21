import 'dart:convert';

import 'package:app/core/utils/typedef.dart';
import 'package:app/domain/entities/comment_entity.dart';

class CommentModel extends CommentEntity {
  const CommentModel({
    required super.id,
    required super.postId,
    required super.name,
    required super.email,
    required super.body,
  });

  const CommentModel.empty()
      : this(
          id: 1,
          postId: 1,
          name: '_empty.string_',
          email: '_empty.string_',
          body: '_empty.string_',
        );

  CommentModel.fromMap(DataMap map)
      : this(
          id: map['id'] as int,
          postId: map['postId'] as int,
          name: map['name'] as String,
          email: map['email'] as String,
          body: map['body'] as String,
        );

  factory CommentModel.fromJson(String source) => CommentModel.fromMap(jsonDecode(source) as DataMap);

  CommentModel copyWith({
    int? id,
    int? postId,
    String? name,
    String? email,
    String? body,
  }) {
    return CommentModel(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      name: name ?? this.name,
      email: email ?? this.email,
      body: body ?? this.body,
    );
  }

  DataMap toMap() => {
        'id': id,
        'postId': postId,
        'name': name,
        'email': email,
        'body': body,
      };

  String toJson() => jsonEncode(toMap());
}
