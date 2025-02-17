/*

*  What does the class depend on
*   Answer - AuthRepository
*  How to create a fake version of the dependencies
*   Answer - Mocktail
*  How do we control what our dependencies do
*   Answer - using mocktail api

*/

import 'package:app/domain/repositories/auth_repository.dart';
import 'package:app/domain/usecases/auth_usecases/auth_login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'auth_repository.mock.dart';

void main() {
  late AuthLoginUsecase authLoginUsecase;
  late AuthRepository authRepository;

  setUp(
    () {
      authRepository = MockAuthRepository();
      authLoginUsecase = AuthLoginUsecase(authRepository);
    },
  );

  final params = AuthLoginParams.empty();

  test(
    'should call the login method on [AuthRepository]',
    () async {
      //   Arrange
      when(
        () => authRepository.loginUser(email: params.email, password: params.password),
      ).thenAnswer(
        (_) async => Right(null),
      );

      //   Act
      final result = await authLoginUsecase(params);

      //   Assert
      expect(
        result,
        equals(Right<dynamic, void>(null)),
      );

      verify(
        () => authRepository.loginUser(email: params.email, password: params.password),
      ).called(1);

      verifyNoMoreInteractions(authRepository);
    },
  );
}
