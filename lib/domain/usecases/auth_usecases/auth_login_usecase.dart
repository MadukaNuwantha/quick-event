import 'package:app/core/usecase/usecase.dart';
import 'package:app/core/utils/typedef.dart';
import 'package:app/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthLoginUsecase extends UsecaseWithParams<void, AuthLoginParams> {
  const AuthLoginUsecase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  ResultFuture<UserCredential?> call(AuthLoginParams params) async =>
      _authRepository.loginUser(email: params.email, password: params.password);
}

class AuthLoginParams extends Equatable {
  const AuthLoginParams({
    required this.email,
    required this.password,
  });

  const AuthLoginParams.empty()
      : this(
          email: '_empty.string_',
          password: '_empty.string_',
        );

  final String email;
  final String password;

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
