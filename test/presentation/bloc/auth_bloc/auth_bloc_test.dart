import 'package:app/core/errors/failure.dart';
import 'package:app/domain/usecases/auth_usecases/auth_login_usecase.dart';
import 'package:app/domain/usecases/auth_usecases/auth_logout_usecase.dart';
import 'package:app/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthLoginUsecase extends Mock implements AuthLoginUsecase {}

class MockAuthLogoutUsecase extends Mock implements AuthLogoutUsecase {}

void main() {
  late AuthBloc authBloc;
  late AuthLoginUsecase authLoginUsecase;
  late AuthLogoutUsecase authLogoutUsecase;

  setUp(
    () {
      authLoginUsecase = MockAuthLoginUsecase();
      authLogoutUsecase = MockAuthLogoutUsecase();

      authBloc = AuthBloc(
        authLoginUsecase: authLoginUsecase,
        authLogoutUsecase: authLogoutUsecase,
      );
    },
  );

  tearDown(
    () {
      authBloc.close();
    },
  );

  final tLoginParams = AuthLoginParams.empty();

  group(
    'AuthBloc',
    () {
      test(
        'initial state is AuthInitial',
        () async {
          expect(authBloc.state, AuthInitial());
        },
      );

      blocTest<AuthBloc, AuthState>(
        'emits [AuthLoading, Authenticated] when login is successful',
        build: () {
          when(
            () => authLoginUsecase(tLoginParams),
          ).thenAnswer(
            (_) async => const Right(null),
          );
          return authBloc;
        },
        act: (bloc) => bloc.add(
          LoginUserEvent(email: tLoginParams.email, password: tLoginParams.password),
        ),
        expect: () => [
          AuthLoading(),
          Authenticated(),
        ],
        verify: (_) {
          verify(
            () => authLoginUsecase(tLoginParams),
          ).called(1);
        },
      );

      blocTest<AuthBloc, AuthState>(
        'emits [AuthLoading, AuthError] when login fails',
        build: () {
          when(
            () => authLoginUsecase(tLoginParams),
          ).thenAnswer(
            (_) async => Left(
              FirebaseServerFailure(message: 'Login Failed'),
            ),
          );
          return authBloc;
        },
        act: (bloc) => bloc.add(
          LoginUserEvent(email: tLoginParams.email, password: tLoginParams.password),
        ),
        expect: () => [
          AuthLoading(),
          AuthError('Login Failed'),
        ],
        verify: (_) {
          verify(() => authLoginUsecase(tLoginParams)).called(1);
        },
      );

      blocTest<AuthBloc, AuthState>(
        'emits [AuthLoading, Unauthenticated] when logout is successful',
        build: () {
          when(
            () => authLogoutUsecase(),
          ).thenAnswer(
            (_) async => const Right(null),
          );
          return authBloc;
        },
        act: (bloc) => bloc.add(
          LogoutUserEvent(),
        ),
        expect: () => [
          AuthLoading(),
          Unauthenticated(),
        ],
        verify: (_) {
          verify(
            () => authLogoutUsecase(),
          ).called(1);
        },
      );

      blocTest<AuthBloc, AuthState>(
        'emits [AuthLoading, AuthError] when logout fails',
        build: () {
          when(
            () => authLogoutUsecase(),
          ).thenAnswer(
            (_) async => Left(
              FirebaseServerFailure(message: 'Logout Failed'),
            ),
          );
          return authBloc;
        },
        act: (bloc) => bloc.add(LogoutUserEvent()),
        expect: () => [
          AuthLoading(),
          AuthError('Logout Failed'),
        ],
        verify: (_) {
          verify(() => authLogoutUsecase()).called(1);
        },
      );
    },
  );
}
