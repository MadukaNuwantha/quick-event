import 'package:app/core/errors/failure.dart';
import 'package:app/domain/entities/user_entity.dart';
import 'package:app/domain/usecases/user_usecases/user_create_usecase.dart';
import 'package:app/domain/usecases/user_usecases/user_get_usecase.dart';
import 'package:app/domain/usecases/user_usecases/user_save_usecase.dart';
import 'package:app/domain/usecases/user_usecases/user_update_usecase.dart';
import 'package:app/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserCreateUsecase extends Mock implements UserCreateUsecase {}

class MockUserGetUsecase extends Mock implements UserGetUsecase {}

class MockUserSaveUsecase extends Mock implements UserSaveUsecase {}

class MockUserUpdateUsecase extends Mock implements UserUpdateUsecase {}

void main() {
  late UserBloc userBloc;
  late UserCreateUsecase userCreateUsecase;
  late UserGetUsecase userGetUsecase;
  late UserSaveUsecase userSaveUsecase;
  late UserUpdateUsecase userUpdateUsecase;

  setUp(
    () {
      userCreateUsecase = MockUserCreateUsecase();
      userGetUsecase = MockUserGetUsecase();
      userSaveUsecase = MockUserSaveUsecase();
      userUpdateUsecase = MockUserUpdateUsecase();

      userBloc = UserBloc(
        userCreateUsecase: userCreateUsecase,
        userGetUsecase: userGetUsecase,
        userSaveUsecase: userSaveUsecase,
        userUpdateUsecase: userUpdateUsecase,
      );
    },
  );

  tearDown(
    () {
      userBloc.close();
    },
  );

  final tCreateUserParams = UserCreateParams.empty();
  final tSaveUserParams = UserSaveParams.empty();
  final tUpdateUserParams = UserUpdateParams.empty();
  final tUser = UserEntity.empty();
  final tFailure = FirebaseServerFailure(
    message: 'Firebase Exception',
  );

  group(
    'UserBloc Tests',
    () {
      test(
        'initial state is UserInitial',
        () async {
          expect(userBloc.state, UserInitial());
        },
      );

      blocTest<UserBloc, UserState>(
        'emits [UserLoading, UserCreated] when CreateUser is successful',
        build: () {
          when(
            () => userCreateUsecase(tCreateUserParams),
          ).thenAnswer(
            (_) async => const Right(null),
          );
          return userBloc;
        },
        act: (bloc) => bloc.add(
          CreateUser(tCreateUserParams),
        ),
        expect: () => [UserLoading(), UserCreated()],
      );

      blocTest<UserBloc, UserState>(
        'emits [UserLoading, UserError] when CreateUser fails',
        build: () {
          when(
            () => userCreateUsecase(tCreateUserParams),
          ).thenAnswer(
            (_) async => Left(tFailure),
          );
          return userBloc;
        },
        act: (bloc) => bloc.add(
          CreateUser(tCreateUserParams),
        ),
        expect: () => [
          UserLoading(),
          UserError(tFailure.message),
        ],
      );

      blocTest<UserBloc, UserState>(
        'emits [UserLoading, UserLoaded] when GetUser is successful',
        build: () {
          when(
            () => userGetUsecase(),
          ).thenAnswer(
            (_) async => Right(tUser),
          );
          return userBloc;
        },
        act: (bloc) => bloc.add(
          GetUser(),
        ),
        expect: () => [
          UserLoading(),
          UserLoaded(tUser),
        ],
      );

      blocTest<UserBloc, UserState>(
        'emits [UserLoading, UserError] when GetUser fails',
        build: () {
          when(
            () => userGetUsecase(),
          ).thenAnswer(
            (_) async => Left(tFailure),
          );
          return userBloc;
        },
        act: (bloc) => bloc.add(
          GetUser(),
        ),
        expect: () => [UserLoading(), UserError(tFailure.message)],
      );

      blocTest<UserBloc, UserState>(
        'emits [UserLoading, UserSaved] when SaveUser is successful',
        build: () {
          when(
            () => userSaveUsecase(tSaveUserParams),
          ).thenAnswer(
            (_) async => const Right(null),
          );
          return userBloc;
        },
        act: (bloc) => bloc.add(
          SaveUser(tSaveUserParams),
        ),
        expect: () => [
          UserLoading(),
          UserSaved(),
        ],
      );

      blocTest<UserBloc, UserState>(
        'emits [UserLoading, UserError] when SaveUser fails',
        build: () {
          when(
            () => userSaveUsecase(tSaveUserParams),
          ).thenAnswer(
            (_) async => Left(tFailure),
          );
          return userBloc;
        },
        act: (bloc) => bloc.add(
          SaveUser(tSaveUserParams),
        ),
        expect: () => [UserLoading(), UserError(tFailure.message)],
      );

      blocTest<UserBloc, UserState>(
        'emits [UserLoading, UserUpdated] when UpdateUser is successful',
        build: () {
          when(
            () => userUpdateUsecase(tUpdateUserParams),
          ).thenAnswer(
            (_) async => const Right(null),
          );
          return userBloc;
        },
        act: (bloc) => bloc.add(
          UpdateUser(tUpdateUserParams),
        ),
        expect: () => [
          UserLoading(),
          UserUpdated(),
        ],
      );

      blocTest<UserBloc, UserState>(
        'emits [UserLoading, UserError] when UpdateUser fails',
        build: () {
          when(
            () => userUpdateUsecase(tUpdateUserParams),
          ).thenAnswer(
            (_) async => Left(tFailure),
          );
          return userBloc;
        },
        act: (bloc) => bloc.add(
          UpdateUser(tUpdateUserParams),
        ),
        expect: () => [UserLoading(), UserError(tFailure.message)],
      );
    },
  );
}
