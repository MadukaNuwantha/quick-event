import 'package:app/data/models/user_model.dart';

abstract class UserRemoteDatasource {
  Future<UserModel> getUser();

  Future<void> createUser({
    required firstName,
    required lastName,
    required email,
    required phoneNumber,
    required address,
  });

  Future<void> updateUser({
    required firstName,
    required lastName,
    required email,
    required phoneNumber,
    required address,
  });
}

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  @override
  Future<void> createUser({
    required firstName,
    required lastName,
    required email,
    required phoneNumber,
    required address,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getUser() {
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser({
    required firstName,
    required lastName,
    required email,
    required phoneNumber,
    required address,
  }) {
    throw UnimplementedError();
  }
}
