part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class CreateUser extends UserEvent {
  const CreateUser({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [
        email,
        password,
      ];
}

class GetUser extends UserEvent {}

class SaveUser extends UserEvent {
  const SaveUser({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.address,
  });
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String address;
  @override
  List<Object> get props => [
        firstName,
        lastName,
        email,
        phoneNumber,
        address,
      ];
}

class UpdateUser extends UserEvent {
  const UpdateUser({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.address,
  });
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String address;
  @override
  List<Object> get props => [
        firstName,
        lastName,
        email,
        phoneNumber,
        address,
      ];
}
