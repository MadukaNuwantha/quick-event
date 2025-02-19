part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class CreateUserEvent extends AuthEvent {
  const CreateUserEvent({
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

class LoginUserEvent extends AuthEvent {
  const LoginUserEvent({
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

class LogoutUserEvent extends AuthEvent {
  const LogoutUserEvent();
}
