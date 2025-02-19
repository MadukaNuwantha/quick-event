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

final class EventLoaded<T> extends EventState {
  final T data;

  EventLoaded(this.data);
}

final class EventError extends EventState {
  const EventError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
