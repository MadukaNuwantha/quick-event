/*

*  What does the class depend on
*   Answer - AuthRepository
*  How to create a fake version of the dependencies
*   Answer - Mocktail
*  How do we control what our dependencies do
*   Answer - using mocktail api

*/

import 'package:app/domain/repositories/auth_repository.dart';
import 'package:app/domain/usecases/auth_usecases/auth_logout_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'auth_repository.mock.dart';

void main() {
  late AuthLogoutUsecase authLogoutUsecase;
  late AuthRepository authRepository;

  setUp(
    () {
      authRepository = MockAuthRepository();
      authLogoutUsecase = AuthLogoutUsecase(authRepository);
    },
  );

  test(
    'should call the logout method on [AuthRepository]',
    () async {
      //   Arrange
      when(
        () => authRepository.logoutUser(),
      ).thenAnswer(
        (_) async => Right(null),
      );

      //   Act
      final result = await authLogoutUsecase();

      //   Assert
      expect(
        result,
        equals(Right<dynamic, void>(null)),
      );

      verify(
        () => authRepository.logoutUser(),
      ).called(1);

      verifyNoMoreInteractions(authRepository);
    },
  );
}
