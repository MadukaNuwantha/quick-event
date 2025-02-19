import 'package:app/domain/usecases/event_usecase/event_comment_usecase.dart';
import 'package:app/domain/usecases/event_usecase/event_image_usecase.dart';
import 'package:app/domain/usecases/event_usecase/event_organizer_usecase.dart';
import 'package:app/domain/usecases/event_usecase/event_post_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  EventBloc({
    required EventCommentUsecase eventCommentUsecase,
    required EventImageUsecase eventImageUsecase,
    required EventOrganizerUsecase eventOrganizerUsecase,
    required EventPostUsecase eventPostUsecase,
  })  : _eventCommentUsecase = eventCommentUsecase,
        _eventImageUsecase = eventImageUsecase,
        _eventOrganizerUsecase = eventOrganizerUsecase,
        _eventPostUsecase = eventPostUsecase,
        super(EventInitial()) {
    on<LoadEventComments>(_getCommentsHandler);
  }
  EventCommentUsecase _eventCommentUsecase;
  EventImageUsecase _eventImageUsecase;
  EventOrganizerUsecase _eventOrganizerUsecase;
  EventPostUsecase _eventPostUsecase;

  Future<void> _getCommentsHandler(
    LoadEventComments event,
    Emitter<EventState> emit,
  ) async {}
}
