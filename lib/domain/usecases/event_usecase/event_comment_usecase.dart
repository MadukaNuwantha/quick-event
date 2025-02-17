import 'package:app/core/usecase/usecase.dart';
import 'package:app/core/utils/typedef.dart';
import 'package:app/domain/entities/comment_entity.dart';
import 'package:app/domain/repositories/event_repository.dart';

class EventCommentUsecase extends UsecaseWithoutParams {
  const EventCommentUsecase(this._eventRepository);

  final EventRepository _eventRepository;

  @override
  ResultFuture<List<CommentEntity>> call() async => _eventRepository.getEventComments();
}
