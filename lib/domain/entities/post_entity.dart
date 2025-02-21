import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  const PostEntity({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  final int id;
  final int userId;
  final String title;
  final String body;

  const PostEntity.empty()
      : this(
          id: 1,
          userId: 1,
          title: '_empty.string_',
          body: '_empty.string_',
        );

  @override
  List<Object?> get props => [
        id,
        userId,
        title,
        body,
      ];
}
