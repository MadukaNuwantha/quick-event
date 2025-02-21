import 'package:app/core/errors/exceptions.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/core/utils/typedef.dart';
import 'package:app/data/datasources/auth_remote_datasource.dart';
import 'package:app/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImplementation implements AuthRepository {
  const AuthRepositoryImplementation(this._authRemoteDatasource);

  final AuthRemoteDatasource _authRemoteDatasource;

  @override
  ResultFuture<UserCredential?> loginUser({required String email, required String password}) async {
    try {
      UserCredential? userCredential = await _authRemoteDatasource.loginUser(
        email: email,
        password: password,
      );
      return Right(userCredential);
    } on FirebaseServerException catch (e) {
      return Left(
        FirebaseServerFailure.fromException(e),
      );
    }
  }

  @override
  ResultVoid logoutUser() async {
    try {
      await _authRemoteDatasource.logoutUser();
      return Right(null);
    } on FirebaseServerException catch (e) {
      return Left(
        FirebaseServerFailure.fromException(e),
      );
    }
  }
}
