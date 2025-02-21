import 'package:equatable/equatable.dart';

class CommentEntity extends Equatable {
  const CommentEntity({
    required this.id,
    required this.postId,
    required this.name,
    required this.email,
    required this.body,
  });

  final int id;
  final int postId;
  final String name;
  final String email;
  final String body;

  const CommentEntity.empty()
      : this(
          id: 1,
          postId: 1,
          name: '_empty.string_',
          email: '_empty.string_',
          body: '_empty.string_',
        );

  @override
  List<Object?> get props => [
        id,
        postId,
        name,
        email,
        body,
      ];
}
