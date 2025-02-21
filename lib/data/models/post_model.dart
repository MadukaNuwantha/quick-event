import 'dart:convert';

import 'package:app/core/utils/typedef.dart';
import 'package:app/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  const PostModel({
    required super.id,
    required super.userId,
    required super.title,
    required super.body,
  });

  const PostModel.empty()
      : this(
          id: 1,
          userId: 1,
          title: '_empty.string_',
          body: '_empty.string_',
        );

  PostModel.fromMap(DataMap map)
      : this(
          id: map['id'] as int,
          userId: map['userId'] as int,
          title: map['title'] as String,
          body: map['body'] as String,
        );

  factory PostModel.fromJson(String source) => PostModel.fromMap(jsonDecode(source) as DataMap);

  PostModel copyWith({
    int? id,
    int? userId,
    String? title,
    String? body,
  }) {
    return PostModel(
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

  PostEntity toEntity(PostModel postModel) {
    return PostEntity(
      id: id,
      userId: userId,
      title: title,
      body: body,
    );
  }
}
