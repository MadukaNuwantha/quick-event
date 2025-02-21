/*

*  What does the class depend on
*   Answer - UserRepository
*  How to create a fake version of the dependencies
*   Answer - Mocktail
*  How do we control what our dependencies do
*   Answer - using mocktail api

*/

import 'package:app/domain/entities/user_entity.dart';
import 'package:app/domain/repositories/user_repository.dart';
import 'package:app/domain/usecases/user_usecases/user_get_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'user_repository.mock.dart';

void main() {
  late UserGetUsecase userGetUsecase;
  late UserRepository userRepository;

  setUp(
    () {
      userRepository = MockUserRepository();
      userGetUsecase = UserGetUsecase(userRepository);
    },
  );

  test(
    'should call the get user method on [UserRepository] and return [UserEntity]',
    () async {
      //   Arrange
      when(() => userRepository.getUser()).thenAnswer(
        (_) async => Right(UserEntity.empty()),
      );

      //   Act
      final result = await userGetUsecase();

      //   Assert
      expect(
        result,
        equals(Right(UserEntity.empty())),
      );

      verify(
        () => userRepository.getUser(),
      ).called(1);

      verifyNoMoreInteractions(userRepository);
    },
  );
}
