import 'package:app/core/usecase/usecase.dart';
import 'package:app/core/utils/typedef.dart';
import 'package:app/domain/entities/image_entity.dart';
import 'package:app/domain/repositories/event_repository.dart';

class EventImageUsecase extends UsecaseWithoutParams {
  const EventImageUsecase(this._eventRepository);

  final EventRepository _eventRepository;

  @override
  ResultFuture<List<ImageEntity>> call() async => _eventRepository.getEventImages();
}
