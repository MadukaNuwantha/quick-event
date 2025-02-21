part of 'event_bloc.dart';

sealed class EventEvent extends Equatable {
  const EventEvent();

  @override
  List<Object> get props => [];
}

class LoadEventComments extends EventEvent {}

class LoadEventImages extends EventEvent {}

class LoadEventOrganizers extends EventEvent {}

class LoadEventPosts extends EventEvent {}

class LoadDashboardData extends EventEvent {}
