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

class FirebaseServerException extends AppException {
  const FirebaseServerException({required super.message});

  @override
  List<Object?> get props => [message];
}
