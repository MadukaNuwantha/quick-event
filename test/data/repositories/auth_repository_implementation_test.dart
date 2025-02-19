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
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDatasource {}

void main() {
  late AuthRemoteDatasource authRemoteDatasource;
  late AuthRepositoryImplementation authRepositoryImplementation;

  setUp(() {
    authRemoteDatasource = MockAuthRemoteDataSource();
    authRepositoryImplementation = AuthRepositoryImplementation(authRemoteDatasource);
  });

  const String tEmail = 'test@example.com';
  const String tPassword = 'password123';
  const tException = ServerException(
    message: 'Unknown error occurred',
    statusCode: 500,
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
          ).thenAnswer((_) async => Future.value());

          final result = await authRepositoryImplementation.loginUser(email: tEmail, password: tPassword);

          expect(result, equals(Right(null)));

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
                ServerFailure(
                  message: tException.message,
                  statusCode: tException.statusCode,
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
                ServerFailure(
                  message: tException.message,
                  statusCode: tException.statusCode,
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
