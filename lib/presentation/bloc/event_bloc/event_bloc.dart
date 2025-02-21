import 'package:app/domain/entities/comment_entity.dart';
import 'package:app/domain/entities/image_entity.dart';
import 'package:app/domain/entities/organizer_entity.dart';
import 'package:app/domain/entities/post_entity.dart';
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
    on<LoadDashboardData>(_loadDashboardDataHandler);
  }
  final EventCommentUsecase _eventCommentUsecase;
  final EventImageUsecase _eventImageUsecase;
  final EventOrganizerUsecase _eventOrganizerUsecase;
  final EventPostUsecase _eventPostUsecase;

  List<ImageEntity> _eventImages = [];
  List<OrganizerEntity> _eventOrganizers = [];
  List<PostEntity> _eventPosts = [];

  Future<void> _getCommentsHandler(
    LoadEventComments event,
    Emitter<EventState> emit,
  ) async {
    emit(EventLoading());

    final result = await _eventCommentUsecase();

    result.fold(
      (failure) => emit(EventError(failure.message)),
      (data) => emit(EventCommentsLoaded(data)),
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
      (data) => emit(EventImagesLoaded(data)),
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
      (data) => emit(EventOrganizersLoaded(data)),
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
      (data) => emit(EventPostsLoaded(data)),
    );
  }

  Future<void> _loadDashboardDataHandler(
    LoadDashboardData event,
    Emitter<EventState> emit,
  ) async {
    emit(EventLoading());

    // Load all data in parallel
    final imageResult = await _eventImageUsecase();
    final organizerResult = await _eventOrganizerUsecase();
    final postResult = await _eventPostUsecase();

    // Check for errors
    if (imageResult.isLeft() || organizerResult.isLeft() || postResult.isLeft()) {
      emit(EventError('Failed to load dashboard data'));
      return;
    }

    // Update local state
    _eventImages = imageResult.getOrElse(() => []);
    _eventOrganizers = organizerResult.getOrElse(() => []);
    _eventPosts = postResult.getOrElse(() => []);

    // Emit the combined state
    emit(EventDashboardLoaded(
      eventImages: _eventImages,
      eventOrganizers: _eventOrganizers,
      eventPosts: _eventPosts,
    ));
  }

  void _emitDashboardState(Emitter<EventState> emit) {
    if (_eventImages.isNotEmpty && _eventOrganizers.isNotEmpty && _eventPosts.isNotEmpty) {
      emit(EventDashboardLoaded(
        eventImages: _eventImages,
        eventOrganizers: _eventOrganizers,
        eventPosts: _eventPosts,
      ));
    }
  }
}
