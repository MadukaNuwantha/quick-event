import 'package:app/core/usecase/usecase.dart';
import 'package:app/core/utils/typedef.dart';
import 'package:app/domain/repositories/auth_repository.dart';

class AuthLogoutUsecase extends UsecaseWithoutParams {
  const AuthLogoutUsecase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  ResultVoid call() async => _authRepository.logoutUser();
}
