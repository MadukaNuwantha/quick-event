import 'package:app/domain/usecases/auth_usecases/auth_login_usecase.dart';
import 'package:app/domain/usecases/auth_usecases/auth_logout_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required AuthLoginUsecase authLoginUsecase,
    required AuthLogoutUsecase authLogoutUsecase,
  })  : _authLoginUsecase = authLoginUsecase,
        _authLogoutUsecase = authLogoutUsecase,
        super(AuthInitial()) {
    on<LoginUserEvent>(_loginUserHandler);
    on<LogoutUserEvent>(_logoutUserHandler);
  }
  final AuthLoginUsecase _authLoginUsecase;
  final AuthLogoutUsecase _authLogoutUsecase;

  Future<void> _loginUserHandler(
    LoginUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await _authLoginUsecase(
      AuthLoginParams(
        email: event.email,
        password: event.password,
      ),
    );

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(Authenticated()),
    );
  }

  Future<void> _logoutUserHandler(
    LogoutUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await _authLogoutUsecase();

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(Unauthenticated()),
    );
  }
}
