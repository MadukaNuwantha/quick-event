import 'package:equatable/equatable.dart';

import 'exceptions.dart';

abstract class Failure extends Equatable {
  final String message;
  final int? statusCode;

  const Failure({required this.message, this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message, required super.statusCode});

  ServerFailure.fromException(ServerException exception)
      : this(message: exception.message, statusCode: exception.statusCode);
}

class TimeoutFailure extends Failure {
  const TimeoutFailure({required super.message});
  TimeoutFailure.fromException(ServerException exception) : this(message: exception.message);
}

class NoInternetFailure extends Failure {
  const NoInternetFailure({required super.message});
  NoInternetFailure.fromException(ServerException exception) : this(message: exception.message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure({required super.message});
  DatabaseFailure.fromException(ServerException exception) : this(message: exception.message);
}

class AuthFailure extends Failure {
  const AuthFailure({required super.message});
  AuthFailure.fromException(ServerException exception) : this(message: exception.message);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({required super.message});
  UnauthorizedFailure.fromException(ServerException exception) : this(message: exception.message);
}

class ValidationFailure extends Failure {
  const ValidationFailure({required super.message});
  ValidationFailure.fromException(ServerException exception) : this(message: exception.message);
}

class RouteNotFoundFailure extends Failure {
  const RouteNotFoundFailure({required super.message});
  RouteNotFoundFailure.fromException(ServerException exception) : this(message: exception.message);
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure({required super.message});
  UnexpectedFailure.fromException(ServerException exception) : this(message: exception.message);
}
