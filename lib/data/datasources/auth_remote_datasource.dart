abstract class AuthRemoteDatasource {
  Future<void> createUser({required String email, required String password});

  Future<void> loginUser({required String email, required String password});

  Future<void> logoutUser();
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  @override
  Future<void> createUser({required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<void> loginUser({required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<void> logoutUser() {
    throw UnimplementedError();
  }
}
