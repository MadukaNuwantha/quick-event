part of 'event_bloc.dart';

sealed class EventState extends Equatable {
  const EventState();

  @override
  List<Object> get props => [];
}

final class EventInitial extends EventState {
  const EventInitial();
}

final class EventLoading extends EventState {
  const EventLoading();
}

final class EventDashboardLoaded extends EventState {
  const EventDashboardLoaded({
    required this.eventImages,
    required this.eventOrganizers,
    required this.eventPosts,
  });

  final List<ImageEntity> eventImages;
  final List<OrganizerEntity> eventOrganizers;
  final List<PostEntity> eventPosts;

  @override
  List<Object> get props => [eventImages, eventOrganizers, eventPosts];
}

final class EventImagesLoaded extends EventState {
  const EventImagesLoaded(this.eventImages);
  final List<ImageEntity> eventImages;
}

final class EventOrganizersLoaded extends EventState {
  const EventOrganizersLoaded(this.eventOrganizers);
  final List<OrganizerEntity> eventOrganizers;
}

final class EventPostsLoaded extends EventState {
  const EventPostsLoaded(this.eventPosts);
  final List<PostEntity> eventPosts;
}

final class EventCommentsLoaded extends EventState {
  const EventCommentsLoaded(this.eventComments);
  final List<CommentEntity> eventComments;
}

final class EventError extends EventState {
  const EventError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
