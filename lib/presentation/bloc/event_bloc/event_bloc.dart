import 'package:app/domain/usecases/event_usecase/event_comment_usecase.dart';
import 'package:app/domain/usecases/event_usecase/event_image_usecase.dart';
import 'package:app/domain/usecases/event_usecase/event_organizer_usecase.dart';
import 'package:app/domain/usecases/event_usecase/event_post_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
    on<LoadEventImages>(_getImageHandler);
    on<LoadEventOrganizers>(_getOrganizerHandler);
    on<LoadEventPosts>(_getPostsHandler);
  }
  final EventCommentUsecase _eventCommentUsecase;
  final EventImageUsecase _eventImageUsecase;
  final EventOrganizerUsecase _eventOrganizerUsecase;
  final EventPostUsecase _eventPostUsecase;

  Future<void> _getCommentsHandler(
    LoadEventComments event,
    Emitter<EventState> emit,
  ) async {
    emit(EventLoading());

    final result = await _eventCommentUsecase();

    result.fold(
      (failure) => emit(EventError(failure.message)),
      (data) => emit(EventLoaded(data)),
    );
  }

  Future<void> _getImageHandler(
    LoadEventImages event,
    Emitter<EventState> emit,
  ) async {
    emit(EventLoading());

    final result = await _eventImageUsecase();

    result.fold(
      (failure) => emit(EventError(failure.message)),
      (data) => emit(EventLoaded(data)),
    );
  }

  Future<void> _getOrganizerHandler(
    LoadEventOrganizers event,
    Emitter<EventState> emit,
  ) async {
    emit(EventLoading());

    final result = await _eventOrganizerUsecase();

    result.fold(
      (failure) => emit(EventError(failure.message)),
      (data) => emit(EventLoaded(data)),
    );
  }

  Future<void> _getPostsHandler(
    LoadEventPosts event,
    Emitter<EventState> emit,
  ) async {
    emit(EventLoading());

    final result = await _eventPostUsecase();

    result.fold(
      (failure) => emit(EventError(failure.message)),
      (data) => emit(EventLoaded(data)),
    );
  }
}
