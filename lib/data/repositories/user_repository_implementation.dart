import 'package:app/core/errors/exceptions.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/core/utils/typedef.dart';
import 'package:app/data/datasources/user_remote_datasource.dart';
import 'package:app/domain/entities/user_entity.dart';
import 'package:app/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImplementation implements UserRepository {
  const UserRepositoryImplementation(this._userRemoteDatasource);

  final UserRemoteDatasource _userRemoteDatasource;

  @override
  ResultVoid createUser({required String email, required String password}) async {
    try {
      await _userRemoteDatasource.createUser(email: email, password: password);
      return Right(null);
    } on FirebaseServerException catch (e) {
      return Left(
        FirebaseServerFailure.fromException(e),
      );
    }
  }

  @override
  ResultVoid saveUser({
    required firstName,
    required lastName,
    required email,
    required phoneNumber,
    required address,
  }) async {
    try {
      await _userRemoteDatasource.saveUser(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber,
        address: address,
      );
      return Right(null);
    } on FirebaseServerException catch (e) {
      return Left(
        FirebaseServerFailure.fromException(e),
      );
    }
  }

  @override
  ResultFuture<UserEntity> getUser() async {
    try {
      final result = await _userRemoteDatasource.getUser();
      return Right(UserEntity.empty());
    } on FirebaseServerException catch (e) {
      return Left(
        FirebaseServerFailure.fromException(e),
      );
    }
  }

  @override
  ResultVoid updateUser({
    required firstName,
    required lastName,
    required email,
    required phoneNumber,
    required address,
  }) async {
    try {
      await _userRemoteDatasource.updateUser(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber,
        address: address,
      );
      return Right(null);
    } on FirebaseServerException catch (e) {
      return Left(
        FirebaseServerFailure.fromException(e),
      );
    }
  }
}
