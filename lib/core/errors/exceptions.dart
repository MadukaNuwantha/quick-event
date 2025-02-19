import 'package:equatable/equatable.dart';

abstract class AppException extends Equatable implements Exception {
  final String message;
  final int? statusCode;

  const AppException({required this.message, this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}

class ServerException extends AppException {
  const ServerException({required super.message, required super.statusCode});
}

class TimeoutException extends AppException {
  const TimeoutException({required super.message});
}

class NoInternetException extends AppException {
  const NoInternetException({required super.message});
}

class DatabaseException extends AppException {
  const DatabaseException({required super.message});
}

class AuthException extends AppException {
  const AuthException({required super.message});
}

class UnauthorizedException extends AppException {
  const UnauthorizedException({required super.message});
}

class ValidationException extends AppException {
  const ValidationException({required super.message});
}

class RouteNotFoundException extends AppException {
  const RouteNotFoundException({required super.message});
}

class UnexpectedException extends AppException {
  const UnexpectedException({required super.message});
}
