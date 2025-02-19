import 'package:app/core/errors/exceptions.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/core/utils/typedef.dart';
import 'package:app/data/datasources/auth_remote_datasource.dart';
import 'package:app/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImplementation implements AuthRepository {
  const AuthRepositoryImplementation(this._authRemoteDatasource);

  final AuthRemoteDatasource _authRemoteDatasource;

  @override
  ResultVoid loginUser({required String email, required String password}) async {
    try {
      await _authRemoteDatasource.loginUser(email: email, password: password);
      return Right(null);
    } on ServerException catch (e) {
      return Left(
        ServerFailure.fromException(e),
      );
    }
  }

  @override
  ResultVoid logoutUser() async {
    try {
      await _authRemoteDatasource.logoutUser();
      return Right(null);
    } on ServerException catch (e) {
      return Left(
        ServerFailure.fromException(e),
      );
    }
  }
}
