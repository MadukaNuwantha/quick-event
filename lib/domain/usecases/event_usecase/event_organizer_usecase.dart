import 'package:app/core/usecase/usecase.dart';
import 'package:app/core/utils/typedef.dart';
import 'package:app/domain/entities/organizer_entity.dart';
import 'package:app/domain/repositories/event_repository.dart';

class EventOrganizerUsecase extends UsecaseWithoutParams {
  const EventOrganizerUsecase(this._eventRepository);

  final EventRepository _eventRepository;

  @override
  ResultFuture<List<OrganizerEntity>> call() async => _eventRepository.getEventOrganizers();
}
