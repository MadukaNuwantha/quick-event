import 'package:app/core/usecase/usecase.dart';
import 'package:app/core/utils/typedef.dart';
import 'package:app/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class AuthCreateUsecase extends UsecaseWithParams<void, CreateUserParams> {
  const AuthCreateUsecase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  ResultVoid call(CreateUserParams params) async =>
      _authRepository.createUser(email: params.email, password: params.password);
}

class CreateUserParams extends Equatable {
  const CreateUserParams({
    required this.email,
    required this.password,
  });

  const CreateUserParams.empty()
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
