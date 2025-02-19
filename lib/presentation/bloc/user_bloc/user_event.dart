part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class CreateUser extends UserEvent {
  final UserCreateParams params;

  const CreateUser(this.params);

  @override
  List<Object> get props => [params];
}

class GetUser extends UserEvent {}

class SaveUser extends UserEvent {
  final UserSaveParams params;

  const SaveUser(this.params);

  @override
  List<Object> get props => [params];
}

class UpdateUser extends UserEvent {
  final UserUpdateParams params;

  const UpdateUser(this.params);

  @override
  List<Object> get props => [params];
}
