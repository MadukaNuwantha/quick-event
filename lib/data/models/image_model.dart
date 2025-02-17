import 'dart:convert';

import 'package:app/core/utils/typedef.dart';
import 'package:app/domain/entities/image_entity.dart';

class ImageModel extends ImageEntity {
  const ImageModel({
    required super.id,
    required super.albumId,
    required super.title,
    required super.url,
    required super.thumbnailUrl,
  });

  const ImageModel.empty()
      : this(
          id: '_empty.string_',
          albumId: '_empty.string_',
          title: '_empty.string_',
          url: '_empty.string_',
          thumbnailUrl: '_empty.string_',
        );

  ImageModel.fromMap(DataMap map)
      : this(
          id: map['id'] as String,
          albumId: map['albumId'] as String,
          title: map['title'] as String,
          url: map['url'] as String,
          thumbnailUrl: map['thumbnailUrl'] as String,
        );

  factory ImageModel.fromJson(String source) => ImageModel.fromMap(jsonDecode(source) as DataMap);

  ImageModel copyWith({
    String? id,
    String? albumId,
    String? title,
    String? url,
    String? thumbnailUrl,
  }) {
    return ImageModel(
      id: id ?? this.id,
      albumId: albumId ?? this.albumId,
      title: title ?? this.title,
      url: url ?? this.url,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }

  DataMap toMap() => {
        'id': id,
        'albumId': albumId,
        'title': title,
        'url': url,
        'thumbnailUrl': thumbnailUrl,
      };

  String toJson() => jsonEncode(toMap());
}
