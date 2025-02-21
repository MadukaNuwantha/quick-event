import 'package:app/core/usecase/usecase.dart';
import 'package:app/core/utils/typedef.dart';
import 'package:app/domain/entities/user_entity.dart';
import 'package:app/domain/repositories/user_repository.dart';

class UserGetUsecase extends UsecaseWithoutParams {
  const UserGetUsecase(this._userRepository);

  final UserRepository _userRepository;

  @override
  ResultFuture<UserEntity> call() async => _userRepository.getUser();
}
