import 'package:app/core/usecase/usecase.dart';
import 'package:app/core/utils/typedef.dart';
import 'package:app/domain/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';

class UserCreateUsecase extends UsecaseWithParams<void, UserCreateParams> {
  const UserCreateUsecase(this._userRepository);

  final UserRepository _userRepository;

  @override
  ResultVoid call(UserCreateParams params) async =>
      _userRepository.createUser(email: params.email, password: params.password);
}

class UserCreateParams extends Equatable {
  const UserCreateParams({
    required this.email,
    required this.password,
  });

  const UserCreateParams.empty()
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
