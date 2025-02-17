import 'package:equatable/equatable.dart';

class CommentEntity extends Equatable {
  const CommentEntity({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  final String id;
  final String userId;
  final String title;
  final String body;

  const CommentEntity.empty()
      : this(
          id: '_empty.string_',
          userId: '_empty.string_',
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
