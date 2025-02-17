import 'package:app/core/utils/typedef.dart';
import 'package:app/domain/entities/comment_entity.dart';
import 'package:app/domain/entities/image_entity.dart';
import 'package:app/domain/entities/organizer_entity.dart';

abstract class EventRepository {
  const EventRepository();

  ResultFuture<List<ImageEntity>> getEventImages();

  ResultFuture<List<OrganizerEntity>> getEventOrganizers();

  ResultFuture<List<CommentEntity>> getEventComments();
}
