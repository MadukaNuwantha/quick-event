/*

*  What does the class depend on
*   Answer - UserRepository
*  How to create a fake version of the dependencies
*   Answer - Mocktail
*  How do we control what our dependencies do
*   Answer - using mocktail api

*/

import 'package:app/domain/repositories/user_repository.dart';
import 'package:app/domain/usecases/user_usecases/user_update_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'user_repository.mock.dart';

void main() {
  late UserUpdateUsecase userUpdateUsecase;
  late UserRepository userRepository;

  setUp(
    () {
      userRepository = MockUserRepository();
      userUpdateUsecase = UserUpdateUsecase(userRepository);
    },
  );

  final params = UserUpdateParams.empty();

  test(
    'should call the update user method on [UserRepository]',
    () async {
      //   Arrange
      when(() => userRepository.updateUser(
            firstName: params.firstName,
            lastName: params.lastName,
            email: params.email,
            phoneNumber: params.phoneNumber,
            address: params.address,
          )).thenAnswer(
        (_) async => Right(null),
      );

      //   Act
      final result = await userUpdateUsecase(params);

      //   Assert
      expect(
        result,
        equals(Right<dynamic, void>(null)),
      );

      verify(
        () => userRepository.updateUser(
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
