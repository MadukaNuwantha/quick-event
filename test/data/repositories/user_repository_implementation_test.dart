/*

*  What does the class depend on
*   Answer - UserRemoteDatasource
*  How to create a fake version of the dependencies
*   Answer - Mocktail
*  How do we control what our dependencies do
*   Answer - using mocktail api

*/

import 'package:app/core/errors/exceptions.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/data/datasources/user_remote_datasource.dart';
import 'package:app/data/models/user_model.dart';
import 'package:app/data/repositories/user_repository_implementation.dart';
import 'package:app/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRemoteDatasource extends Mock implements UserRemoteDatasource {}

void main() {
  late UserRemoteDatasource userRemoteDatasource;
  late UserRepositoryImplementation userRepositoryImplementation;

  setUp(() {
    userRemoteDatasource = MockUserRemoteDatasource();
    userRepositoryImplementation = UserRepositoryImplementation(userRemoteDatasource);
  });

  const String tEmail = 'test@example.com';
  const String tPassword = 'password123';

  const tException = FirebaseServerException(
    message: 'Test Exception',
  );

  group(
    'createUser',
    () {
      test(
        'should return Right(null) when creating user is successful',
        () async {
          when(
            () => userRemoteDatasource.createUser(
              email: any(named: 'email'),
              password: any(named: 'password'),
            ),
          ).thenAnswer((_) async => Future.value());

          final result = await userRepositoryImplementation.createUser(email: tEmail, password: tPassword);

          expect(result, equals(Right(null)));

          verify(
            () => userRemoteDatasource.createUser(
              email: tEmail,
              password: tPassword,
            ),
          ).called(1);

          verifyNoMoreInteractions(userRemoteDatasource);
        },
      );

      test(
        'should return Left(FirebaseServerFailure) when creating user fails',
        () async {
          when(
            () => userRemoteDatasource.createUser(
              email: any(named: 'email'),
              password: any(named: 'password'),
            ),
          ).thenThrow(tException);

          final result = await userRepositoryImplementation.createUser(email: tEmail, password: tPassword);

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
            () => userRemoteDatasource.createUser(email: tEmail, password: tPassword),
          ).called(1);

          verifyNoMoreInteractions(userRemoteDatasource);
        },
      );
    },
  );

  group(
    'saveUser',
    () {
      test(
        'should return Right(null) when creating a user is successful',
        () async {
          when(
            () => userRemoteDatasource.saveUser(
              firstName: any(named: 'firstName'),
              lastName: any(named: 'lastName'),
              email: any(named: 'email'),
              phoneNumber: any(named: 'phoneNumber'),
              address: any(named: 'address'),
            ),
          ).thenAnswer((_) async => Future.value());

          final result = await userRepositoryImplementation.saveUser(
            firstName: 'John',
            lastName: 'Doe',
            email: 'johndoe@example.com',
            phoneNumber: '1234567890',
            address: '123 Street Name',
          );

          expect(result, equals(Right(null)));

          verify(
            () => userRemoteDatasource.saveUser(
              firstName: 'John',
              lastName: 'Doe',
              email: 'johndoe@example.com',
              phoneNumber: '1234567890',
              address: '123 Street Name',
            ),
          ).called(1);

          verifyNoMoreInteractions(userRemoteDatasource);
        },
      );

      test(
        'should return Left(FirebaseServerFailure) when creating a user fails',
        () async {
          when(
            () => userRemoteDatasource.saveUser(
              firstName: any(named: 'firstName'),
              lastName: any(named: 'lastName'),
              email: any(named: 'email'),
              phoneNumber: any(named: 'phoneNumber'),
              address: any(named: 'address'),
            ),
          ).thenThrow(tException);

          final result = await userRepositoryImplementation.saveUser(
            firstName: 'John',
            lastName: 'Doe',
            email: 'johndoe@example.com',
            phoneNumber: '1234567890',
            address: '123 Street Name',
          );

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
            () => userRemoteDatasource.saveUser(
              firstName: 'John',
              lastName: 'Doe',
              email: 'johndoe@example.com',
              phoneNumber: '1234567890',
              address: '123 Street Name',
            ),
          ).called(1);

          verifyNoMoreInteractions(userRemoteDatasource);
        },
      );
    },
  );

  group(
    'getUser',
    () {
      test(
        'should return Right(UserEntity) when getting user is successful',
        () async {
          when(() => userRemoteDatasource.getUser()).thenAnswer(
            (_) async => UserModel.empty(),
          );

          final result = await userRepositoryImplementation.getUser();

          expect(result, isA<Right<dynamic, UserEntity>>());

          verify(() => userRemoteDatasource.getUser()).called(1);

          verifyNoMoreInteractions(userRemoteDatasource);
        },
      );

      test(
        'should return Left(FirebaseServerFailure) when getting user fails',
        () async {
          when(() => userRemoteDatasource.getUser()).thenThrow(tException);

          final result = await userRepositoryImplementation.getUser();

          expect(
            result,
            equals(
              Left(FirebaseServerFailure.fromException(tException)),
            ),
          );

          verify(() => userRemoteDatasource.getUser()).called(1);

          verifyNoMoreInteractions(userRemoteDatasource);
        },
      );
    },
  );

  group(
    'updateUser',
    () {
      test(
        'should return Right(null) when updating a user is successful',
        () async {
          when(
            () => userRemoteDatasource.updateUser(
              firstName: any(named: 'firstName'),
              lastName: any(named: 'lastName'),
              email: any(named: 'email'),
              phoneNumber: any(named: 'phoneNumber'),
              address: any(named: 'address'),
            ),
          ).thenAnswer((_) async {});

          final result = await userRepositoryImplementation.updateUser(
            firstName: 'John',
            lastName: 'Doe',
            email: 'johndoe@example.com',
            phoneNumber: '1234567890',
            address: '123 Street Name',
          );

          expect(result, equals(Right(null)));
          verify(
            () => userRemoteDatasource.updateUser(
              firstName: 'John',
              lastName: 'Doe',
              email: 'johndoe@example.com',
              phoneNumber: '1234567890',
              address: '123 Street Name',
            ),
          ).called(1);
          verifyNoMoreInteractions(userRemoteDatasource);
        },
      );

      test(
        'should return Left(FirebaseServerFailure) when updating a user fails',
        () async {
          when(
            () => userRemoteDatasource.updateUser(
              firstName: any(named: 'firstName'),
              lastName: any(named: 'lastName'),
              email: any(named: 'email'),
              phoneNumber: any(named: 'phoneNumber'),
              address: any(named: 'address'),
            ),
          ).thenThrow(tException);

          final result = await userRepositoryImplementation.updateUser(
            firstName: 'John',
            lastName: 'Doe',
            email: 'johndoe@example.com',
            phoneNumber: '1234567890',
            address: '123 Street Name',
          );

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
            () => userRemoteDatasource.updateUser(
              firstName: 'John',
              lastName: 'Doe',
              email: 'johndoe@example.com',
              phoneNumber: '1234567890',
              address: '123 Street Name',
            ),
          ).called(1);
          verifyNoMoreInteractions(userRemoteDatasource);
        },
      );
    },
  );
}
