/*

*  What does the class depend on
*   Answer - AuthRemoteDatasource
*  How to create a fake version of the dependencies
*   Answer - Mocktail
*  How do we control what our dependencies do
*   Answer - using mocktail api

*/

import 'package:app/core/errors/exceptions.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/data/datasources/auth_remote_datasource.dart';
import 'package:app/data/repositories/auth_repository_implementation.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDatasource {}

class MockUserCredential extends Mock implements UserCredential {}

void main() {
  late AuthRemoteDatasource authRemoteDatasource;
  late AuthRepositoryImplementation authRepositoryImplementation;
  late UserCredential userCredential;

  setUp(() {
    userCredential = MockUserCredential();
    authRemoteDatasource = MockAuthRemoteDataSource();
    authRepositoryImplementation = AuthRepositoryImplementation(authRemoteDatasource);
  });

  const String tEmail = 'test@example.com';
  const String tPassword = 'password123';
  const tException = FirebaseServerException(
    message: 'Test Exception',
  );

  group(
    'loginUser',
    () {
      test(
        'should return Right(null) when login is successful',
        () async {
          when(
            () => authRemoteDatasource.loginUser(
              email: any(named: 'email'),
              password: any(named: 'password'),
            ),
          ).thenAnswer((_) async => userCredential);

          final result = await authRepositoryImplementation.loginUser(email: tEmail, password: tPassword);

          expect(result, equals(Right(userCredential)));

          verify(
            () => authRemoteDatasource.loginUser(email: tEmail, password: tPassword),
          ).called(1);

          verifyNoMoreInteractions(authRemoteDatasource);
        },
      );

      test(
        'should return Left(ServerFailure) when login fails',
        () async {
          when(
            () => authRemoteDatasource.loginUser(
              email: any(named: 'email'),
              password: any(named: 'password'),
            ),
          ).thenThrow(tException);

          final result = await authRepositoryImplementation.loginUser(email: tEmail, password: tPassword);

          expect(
            result,
            equals(
              Left(
                FirebaseServerFailure(
                  message: tException.message,
                ),
              ),
            ),
          );

          verify(
            () => authRemoteDatasource.loginUser(email: tEmail, password: tPassword),
          );
          verifyNoMoreInteractions(authRemoteDatasource);
        },
      );
    },
  );

  group(
    'logoutUser',
    () {
      test(
        'should return Right(null) when logout is successful',
        () async {
          when(
            () => authRemoteDatasource.logoutUser(),
          ).thenAnswer((_) async => Future.value());

          final result = await authRepositoryImplementation.logoutUser();

          expect(result, equals(Right(null)));

          verify(() => authRemoteDatasource.logoutUser()).called(1);

          verifyNoMoreInteractions(authRemoteDatasource);
        },
      );

      test(
        'should return Left(ServerFailure) when logout fails',
        () async {
          when(
            () => authRemoteDatasource.logoutUser(),
          ).thenThrow(tException);

          final result = await authRepositoryImplementation.logoutUser();

          expect(
            result,
            equals(
              Left(
                FirebaseServerFailure(
                  message: tException.message,
                ),
              ),
            ),
          );

          verify(() => authRemoteDatasource.logoutUser()).called(1);

          verifyNoMoreInteractions(authRemoteDatasource);
        },
      );
    },
  );
}
