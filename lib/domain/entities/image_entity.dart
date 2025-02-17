import 'package:equatable/equatable.dart';

class ImageEntity extends Equatable {
  const ImageEntity({
    required this.id,
    required this.albumId,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  final String id;
  final String albumId;
  final String title;
  final String url;
  final String thumbnailUrl;

  const ImageEntity.empty()
      : this(
          id: '_empty.string_',
          albumId: '_empty.string_',
          title: '_empty.string_',
          url: '_empty.string_',
          thumbnailUrl: '_empty.string_',
        );

  @override
  List<Object?> get props => [
        id,
        albumId,
        title,
        url,
        thumbnailUrl,
      ];
}
