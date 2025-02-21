part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {
  const UserInitial();
}

final class UserLoading extends UserState {
  const UserLoading();
}

final class UserCreated extends UserState {
  const UserCreated();
}

final class UserSaved extends UserState {
  const UserSaved();
}

final class UserUpdated extends UserState {
  const UserUpdated();
}

final class UserLoaded extends UserState {
  const UserLoaded(this.userEntity);
  final UserEntity userEntity;
}

final class UserError extends UserState {
  const UserError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
