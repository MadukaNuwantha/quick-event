/*

*  What does the class depend on
*   Answer - UserRepository
*  How to create a fake version of the dependencies
*   Answer - Mocktail
*  How do we control what our dependencies do
*   Answer - using mocktail api

*/

import 'package:app/domain/repositories/user_repository.dart';
import 'package:app/domain/usecases/user_usecases/user_save_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'user_repository.mock.dart';

void main() {
  late UserSaveUsecase userCreateUsecase;
  late UserRepository userRepository;

  setUp(
    () {
      userRepository = MockUserRepository();
      userCreateUsecase = UserSaveUsecase(userRepository);
    },
  );

  final params = UserSaveParams.empty();

  test(
    'should call the create user method on [UserRepository]',
    () async {
      //   Arrange
      when(() => userRepository.saveUser(
            firstName: params.firstName,
            lastName: params.lastName,
            email: params.email,
            phoneNumber: params.phoneNumber,
            address: params.address,
          )).thenAnswer(
        (_) async => Right(null),
      );

      //   Act
      final result = await userCreateUsecase(params);

      //   Assert
      expect(
        result,
        equals(Right<dynamic, void>(null)),
      );

      verify(
        () => userRepository.saveUser(
          firstName: params.firstName,
          lastName: params.lastName,
          email: params.email,
          phoneNumber: params.phoneNumber,
          address: params.address,
        ),
      ).called(1);

      verifyNoMoreInteractions(userRepository);
    },
  );
}
