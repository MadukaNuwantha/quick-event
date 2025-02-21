import 'package:app/core/usecase/usecase.dart';
import 'package:app/core/utils/typedef.dart';
import 'package:app/domain/entities/post_entity.dart';
import 'package:app/domain/repositories/event_repository.dart';

class EventPostUsecase extends UsecaseWithoutParams {
  const EventPostUsecase(this._eventRepository);

  final EventRepository _eventRepository;

  @override
  ResultFuture<List<PostEntity>> call() async => _eventRepository.getEventPosts();
}
