import 'package:app/domain/entities/user_entity.dart';
import 'package:app/domain/usecases/user_usecases/user_create_usecase.dart';
import 'package:app/domain/usecases/user_usecases/user_get_usecase.dart';
import 'package:app/domain/usecases/user_usecases/user_save_usecase.dart';
import 'package:app/domain/usecases/user_usecases/user_update_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({
    required UserCreateUsecase userCreateUsecase,
    required UserGetUsecase userGetUsecase,
    required UserSaveUsecase userSaveUsecase,
    required UserUpdateUsecase userUpdateUsecase,
  })  : _userCreateUsecase = userCreateUsecase,
        _userGetUsecase = userGetUsecase,
        _userSaveUsecase = userSaveUsecase,
        _userUpdateUsecase = userUpdateUsecase,
        super(UserInitial()) {
    on<CreateUser>(_createUserHandler);
    on<GetUser>(_getUserHandler);
    on<SaveUser>(_saveUserHandler);
    on<UpdateUser>(_updateUserHandler);
  }

  final UserCreateUsecase _userCreateUsecase;
  final UserGetUsecase _userGetUsecase;
  final UserSaveUsecase _userSaveUsecase;
  final UserUpdateUsecase _userUpdateUsecase;

  Future<void> _createUserHandler(
    CreateUser event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());

    final result = await _userCreateUsecase(event.params);

    result.fold(
      (failure) => emit(UserError(failure.message)),
      (_) => emit(UserCreated()),
    );
  }

  Future<void> _getUserHandler(
    GetUser event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());

    final result = await _userGetUsecase();

    result.fold(
      (failure) => emit(UserError(failure.message)),
      (data) => emit(UserLoaded(data)),
    );
  }

  Future<void> _saveUserHandler(
    SaveUser event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());

    final result = await _userSaveUsecase(event.params);

    result.fold(
      (failure) => emit(UserError(failure.message)),
      (_) => emit(UserSaved()),
    );
  }

  Future<void> _updateUserHandler(
    UpdateUser event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());

    final result = await _userUpdateUsecase(event.params);

    result.fold(
      (failure) => emit(UserError(failure.message)),
      (_) => emit(UserUpdated()),
    );
  }
}
