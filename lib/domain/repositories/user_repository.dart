import 'package:app/core/utils/typedef.dart';
import 'package:app/domain/entities/user_entity.dart';

abstract class UserRepository {
  UserRepository();

  ResultFuture<UserEntity> getUser();

  ResultVoid createUser({
    required firstName,
    required lastName,
    required email,
    required phoneNumber,
    required address,
  });

  ResultVoid updateUser({
    required firstName,
    required lastName,
    required email,
    required phoneNumber,
    required address,
  });
}
